import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:sticker_widget/data/sticker_widget_config.dart';
import 'package:vector_math/vector_math_64.dart';

/// StickerGestureDetector for handling scaling, rotating, and translating the widget.
///
/// This widget wraps another widget and provides gesture detection for scaling, rotating, and translating the child widget.
/// It allows the user to interact with the child widget by performing pinch-to-zoom, rotate, and drag gestures.
class StickerGestureDetector extends StatefulWidget {
  /// Callback function for when updates occur.
  ///
  /// The [onUpdate] function is called whenever there is a change in the scale or matrix of the widget.
  /// It receives the updated scale and matrix as parameters.
  final void Function(double scale, Matrix4 matrix) onUpdate;

  /// The child widget wrapped by the gesture detector.
  final Widget child;

  /// Flag indicating whether the widget is currently selected.
  ///
  /// When [isSelected] is true, the widget will respond to user gestures.
  final bool isSelected;

  /// Control flags for various gesture types (translate, scale, rotate).
  ///
  /// By default, all gestures are enabled.
  final bool shouldTranslate;
  final bool shouldScale;
  final bool shouldRotate;

  /// Flag to clip the child widget.
  ///
  /// When [clipChild] is true, the child widget will be clipped to its parent's bounds.
  final bool clipChild;

  /// Behavior when handling hit tests.
  ///
  /// By default, the gesture detector defers to the child widget for hit testing.
  final HitTestBehavior behavior;

  /// Alignment of the focal point.
  ///
  /// The [focalPointAlignment] determines the alignment of the focal point used for scaling and rotating the widget.
  /// If not specified, the focal point will be the local focal point of the gesture.
  final Alignment? focalPointAlignment;

  /// Callback functions for scale start and end.
  ///
  /// The [onScaleStart] function is called when a scale gesture starts.
  /// The [onScaleEnd] function is called when a scale gesture ends.
  final VoidCallback onScaleStart;
  final VoidCallback onScaleEnd;

  /// Callback function for tap gesture.
  ///
  /// The [onTap] function is called when the widget is tapped.
  final VoidCallback onTap;

  /// Minimum and maximum scale values.
  ///
  /// The [minScale] and [maxScale] determine the range of allowed scale values for the widget.
  final double minScale;
  final double maxScale;

  /// GlobalKey for accessing the child widget.
  ///
  /// The [layerKey] is used to access the child widget's context and size.
  final GlobalKey layerKey;

  final GlobalKey childrenKey;

  /// StickerWidgetConfig.
  ///
  /// The [stickerWidgetConfig] contains configuration options for the sticker widget.
  final StickerWidgetConfig stickerWidgetConfig;

  final Matrix4 initialMatrix;

  const StickerGestureDetector({
    super.key,
    required this.onUpdate,
    required this.child,
    required this.stickerWidgetConfig,
    this.shouldTranslate = true,
    this.shouldScale = true,
    this.shouldRotate = true,
    this.clipChild = true,
    this.focalPointAlignment,
    this.behavior = HitTestBehavior.deferToChild,
    required this.onScaleStart,
    required this.onScaleEnd,
    required this.onTap,
    required this.minScale,
    required this.maxScale,
    required this.isSelected,
    required this.layerKey,
    required this.childrenKey,
    required this.initialMatrix,
  });

  @override
  State<StickerGestureDetector> createState() => StickerGestureDetectorState();
}

class StickerGestureDetectorState extends State<StickerGestureDetector> {
  // Matrix for handling translation, scaling, and rotation.
  Matrix4 matrix = Matrix4.identity();

  // Current and previous scale values.
  double recordScale = 1;
  double recordOldScale = 0;

  @override
  Widget build(BuildContext context) {
    // Wrap the child widget in a ClipRect if clipping is enabled.
    Widget child =
        widget.clipChild ? ClipRect(child: widget.child) : widget.child;

    // Create a GestureDetector to handle gestures.
    return GestureDetector(
      behavior: widget.behavior,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      onTap: widget.onTap,
      child: child,
    );
  }

  // ValueUpdater instances to track translation, scale, and rotation changes.
  ValueUpdater<Offset> translationUpdater = ValueUpdater(
    value: Offset.zero,
    onUpdate: (oldVal, newVal) => newVal - oldVal,
  );
  ValueUpdater<double> scaleUpdater = ValueUpdater(
    value: 1.0,
    onUpdate: (oldVal, newVal) => newVal / oldVal,
  );
  ValueUpdater<double> rotationUpdater = ValueUpdater(
    value: 0.0,
    onUpdate: (oldVal, newVal) => newVal - oldVal,
  );

  @override
  void initState() {
    matrix = widget.initialMatrix;
    translationUpdater.value = Offset(widget.initialMatrix.getTranslation().x,
        widget.initialMatrix.getTranslation().y);
    scaleUpdater.value = widget.initialMatrix.getMaxScaleOnAxis();
    recordOldScale = scaleUpdater.value;
    rotationUpdater.value =
        atan2(widget.initialMatrix[1], widget.initialMatrix[0]);
    super.initState();
  }

  void onScaleStart(ScaleStartDetails details) {
    if (!widget.isSelected) {
      return;
    }
    widget.onScaleStart();
    translationUpdater.value = details.focalPoint;
    recordOldScale = recordScale;
    scaleUpdater.value = 1.0;
    rotationUpdater.value = 0.0;
  }

  void onScaleEnd(ScaleEndDetails details) {
    widget.onScaleEnd();
  }

  void onScaleUpdate(ScaleUpdateDetails details) {
    if (!widget.isSelected) {
      return;
    }

    widget.onScaleStart();

    // Handle translation.
    if (widget.shouldTranslate) {
      Offset translationDelta = translationUpdater.update(details.focalPoint);
      matrix = _translate(translationDelta) * matrix;
      matrix = _translationSnap() * matrix;
    }

    final focalPointAlignment = widget.focalPointAlignment;
    final focalPoint = focalPointAlignment == null
        ? details.localFocalPoint
        : focalPointAlignment.alongSize(context.size!);

    // Handle scaling.
    if (widget.shouldScale && details.scale != 1.0) {
      double sc = recordOldScale * details.scale;
      if (sc > widget.minScale && sc < widget.maxScale) {
        recordScale = sc;
        double scaleDelta = scaleUpdater.update(details.scale);
        matrix = _scale(scaleDelta, focalPoint) * matrix;
      }
    }

    // Handle rotation.
    if (widget.shouldRotate && details.rotation != 0.0) {
      matrix = _rotate(details.rotation, focalPoint) * matrix;
    }

    // Notify the callback with the updated scale and matrix.
    widget.onUpdate(recordScale, matrix);
  }

  // Helper function for translation matrix.
  Matrix4 _translate(Offset translation) {
    var dx = translation.dx;
    var dy = translation.dy;

    Matrix4 translationMatrix =
        Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);

    return translationMatrix;
  }

  // Helper function for translation matrix.
  Matrix4 _translationSnap() {
    var dx = 0.0;
    var dy = 0.0;

    Offset center = _findTransformedRectangleCenter(
        matrix,
        widget.layerKey.currentContext!.size!,
        widget.stickerWidgetConfig.canvasSize);

    double rotation = atan2(matrix[1], matrix[0]);

    List<double> horizontalSnapPoints = _findHorizontalSnapPoints(
        rotation, widget.childrenKey.currentContext!.size!, center);

    List<double> verticalSnapPoints = _findVerticalSnapPoints(
        rotation, widget.childrenKey.currentContext!.size!, center);
    for (final double snapPosition
        in widget.stickerWidgetConfig.translationXSnapValues) {
      final Map<double, double> absoluteErrors = Map.fromEntries(
          horizontalSnapPoints
              .map((e) => MapEntry(e, absoluteError(e, snapPosition))));

      final MapEntry<double, double> minErrorEntry =
          absoluteErrors.entries.reduce((a, b) => a.value < b.value ? a : b);
      print(horizontalSnapPoints);
      print(minErrorEntry);
      if (minErrorEntry.value <=
          widget.stickerWidgetConfig.translationSnapThreshold) {
        dx = minErrorEntry.key - snapPosition;
      }
    }

    for (final double snapPosition
        in widget.stickerWidgetConfig.translationYSnapValues) {
      final Map<double, double> absoluteErrors = Map.fromEntries(
          verticalSnapPoints
              .map((e) => MapEntry(e, absoluteError(e, snapPosition))));

      final MapEntry<double, double> minErrorEntry =
          absoluteErrors.entries.reduce((a, b) => a.value < b.value ? a : b);

      if (minErrorEntry.value <=
          widget.stickerWidgetConfig.translationSnapThreshold) {
        dy = minErrorEntry.key - snapPosition;
      }
    }

    Matrix4 translationMatrix =
        Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);

    return translationMatrix;
  }

  Offset _findTransformedRectangleCenter(
      Matrix4 transformationMatrix, Size rectangleSize, Size canvasSize) {
    // Calculate the center point of the rectangle in its own coordinate system
    Vector3 rectangleCenter =
        Vector3(rectangleSize.width / 2, rectangleSize.height / 2, 0);

    // Apply the transformation matrix to the rectangle center
    Vector3 transformedCenter =
        transformationMatrix.transform3(rectangleCenter);

    // Calculate the center point of the transformed rectangle in the canvas coordinate system
    Offset canvasCenter = Offset(canvasSize.width / 2, canvasSize.height / 2);
    Offset transformedCanvasCenter = Offset(
        canvasCenter.dx - transformedCenter.x,
        canvasCenter.dy - transformedCenter.y);

    return transformedCanvasCenter;
  }

  List<double> _findHorizontalSnapPoints(
      double rotation, Size rectangleSize, Offset center) {
    if (rotation == 0 || rotation == pi) {
      return [
        center.dx - rectangleSize.width / 2,
        center.dx,
        center.dx + rectangleSize.width / 2
      ];
    }
    if (rotation == pi / 2 || rotation == 3 * pi / 2) {
      return [
        center.dx - rectangleSize.height / 2,
        center.dx,
        center.dx + rectangleSize.height / 2
      ];
    }
    return [center.dx];
  }

  List<double> _findVerticalSnapPoints(
      double rotation, Size rectangleSize, Offset center) {
    if (rotation == 0 || rotation == pi) {
      return [
        center.dy - rectangleSize.height / 2,
        center.dy,
        center.dy + rectangleSize.height / 2
      ];
    }
    if (rotation == pi / 2 || rotation == 3 * pi / 2) {
      return [
        center.dy - rectangleSize.width / 2,
        center.dy,
        center.dy + rectangleSize.width / 2
      ];
    }
    return [center.dx];
  }

  // Helper function for scaling matrix.
  Matrix4 _scale(double scale, Offset focalPoint) {
    var dx = (1 - scale) * focalPoint.dx;
    var dy = (1 - scale) * focalPoint.dy;

    return Matrix4(scale, 0, 0, 0, 0, scale, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
  }

  // Helper function for rotating matrix.
  Matrix4 _rotate(double angle, Offset focalPoint) {
    double toBeRotated = 0;
    double rotation = atan2(matrix[1], matrix[0]);
    double deltaAngle = rotationUpdater.update(angle);

    for (var snapPosition in widget.stickerWidgetConfig.rotationSnapValues) {
      if (snapPosition > 180) {
        snapPosition = 180 - snapPosition;
      }
      snapPosition = radians(snapPosition);

      if (absoluteError((rotation + deltaAngle), snapPosition) >
          widget.stickerWidgetConfig.rotationSnapThreshold) {
        toBeRotated = deltaAngle;
      } else if (rotation != snapPosition &&
          absoluteError((rotation + deltaAngle), snapPosition) <=
              widget.stickerWidgetConfig.rotationSnapThreshold) {
        toBeRotated = snapPosition - rotation;
        break;
      } else {
        toBeRotated = 0;
        break;
      }
    }

    double c = cos(toBeRotated);
    double s = sin(toBeRotated);

    double dx = (1 - c) * focalPoint.dx + s * focalPoint.dy;
    double dy = (1 - c) * focalPoint.dy - s * focalPoint.dx;

    return Matrix4(c, s, 0, 0, -s, c, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
  }
}

// Callback type for updating values.
typedef OnUpdate<T> = T Function(T oldValue, T newValue);

// ValueUpdater class for tracking and updating values.
class ValueUpdater<T> {
  final OnUpdate<T> onUpdate;
  T value;

  ValueUpdater({
    required this.value,
    required this.onUpdate,
  });

  T update(T newValue) {
    T updated = onUpdate(value, newValue);
    value = newValue;
    return updated;
  }
}
