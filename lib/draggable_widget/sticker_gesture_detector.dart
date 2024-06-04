import 'dart:math';
import 'package:flutter/services.dart';
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
  final void Function(Matrix4 matrix) onUpdate;

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

  /// Callback functions for scale start and end.
  ///
  /// The [onScaleStart] function is called when a scale gesture starts.
  /// The [onScaleEnd] function is called when a scale gesture ends.
  final VoidCallback onScaleStart;
  final VoidCallback onScaleEnd;

  /// Callback function for tap gesture.
  ///
  /// The [onTap] function is called when the widget is tapped.
  final void Function()? onTap;

  /// Minimum and maximum scale values.
  ///
  /// The [minScale] and [maxScale] determine the range of allowed scale values for the widget.
  final double minScale;
  final double maxScale;

  final GlobalKey childrenKey;

  /// StickerWidgetConfig.
  ///
  /// The [stickerWidgetConfig] contains configuration options for the sticker widget.
  final StickerWidgetConfig stickerWidgetConfig;

  final List<double> Function() getXSnapValues;

  final List<double> Function() getYSnapValues;

  final Matrix4 initialMatrix;

  final double canvasScale;

  const StickerGestureDetector({
    super.key,
    required this.onUpdate,
    required this.child,
    required this.stickerWidgetConfig,
    this.shouldTranslate = true,
    this.shouldScale = true,
    this.shouldRotate = true,
    required this.onScaleStart,
    required this.onScaleEnd,
    this.onTap,
    required this.minScale,
    required this.maxScale,
    required this.isSelected,
    required this.childrenKey,
    required this.initialMatrix,
    required this.canvasScale,
    required this.getXSnapValues,
    required this.getYSnapValues,
  });

  @override
  State<StickerGestureDetector> createState() => StickerGestureDetectorState();
}

class StickerGestureDetectorState extends State<StickerGestureDetector> {
  // Current and previous scale values.
  double recordScale = 1;
  double recordOldScale = 0;

  @override
  Widget build(BuildContext context) {
    // Create a GestureDetector to handle gestures.
    return GestureDetector(
      onScaleStart: widget.isSelected ? onScaleStart : null,
      onScaleUpdate: widget.isSelected ? onScaleUpdate : null,
      onScaleEnd: widget.isSelected ? onScaleEnd : null,
      excludeFromSemantics: widget.isSelected,
      onTap: widget.onTap,
      child: widget.child,
    );
  }

  // ValueUpdater instances to track scale and rotation changes.
  ValueUpdater<double> scaleUpdater = ValueUpdater(
    value: 1.0,
    onUpdate: (oldVal, newVal) => newVal / oldVal,
  );
  ValueUpdater<double> rotationUpdater = ValueUpdater(
    value: 0.0,
    onUpdate: (oldVal, newVal) => newVal - oldVal,
  );

  void onScaleStart(ScaleStartDetails details) {
    if (!widget.isSelected) {
      return;
    }
    widget.onScaleStart();
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

    Matrix4 matrix = widget.initialMatrix;

    // Handle translation.
    if (widget.shouldTranslate) {
      Vector3 delta =
          Vector3(details.focalPointDelta.dx, details.focalPointDelta.dy, 0);

      Matrix4 inverse =
          Matrix4.inverted(matrix.clone()..setTranslationRaw(0.0, 0.0, 0.0));

      delta = inverse.transform3(delta);
      matrix.translate(_translationSnap(matrix, delta));
    }

    // Handle scaling.
    if (widget.shouldScale && details.scale != 1.0) {
      double sc = recordOldScale * details.scale;
      if (sc > widget.minScale && sc < widget.maxScale) {
        recordScale = sc;
        double scaleDelta = scaleUpdater.update(details.scale);
        matrix.scale(scaleDelta, scaleDelta, scaleDelta);
      }
    }

    // Handle rotation.
    if (widget.shouldRotate && details.rotation != 0.0) {
      matrix.rotateZ(
        _rotate(
          matrix,
          details.rotation * widget.stickerWidgetConfig.rotationSpeed,
        ),
      );
    }

    // Notify the callback with the updated scale and matrix.
    widget.onUpdate(matrix);
  }

  // Helper function for translation matrix.
  Vector3 _translationSnap(Matrix4 matrix, Vector3 translation) {
    double dx = translation.x;
    double dy = translation.y;

    Size childrenSize =
        widget.childrenKey.currentContext!.size! * matrix.getMaxScaleOnAxis();

    Offset center =
        Offset(matrix.getTranslation().x, matrix.getTranslation().y);

    double rotation = atan2(matrix[1], matrix[0]);

    List<double> horizontalSnapPoints =
        _findHorizontalSnapPoints(rotation, childrenSize, center);

    List<double> verticalSnapPoints =
        _findVerticalSnapPoints(rotation, childrenSize, center);

    final List<double> translationXSnapValues =
        widget.stickerWidgetConfig.translationXSnapValues +
            widget.getXSnapValues();

    for (final double snapPosition in translationXSnapValues) {
      final Map<double, double> absoluteErrors = Map.fromEntries(
          horizontalSnapPoints
              .map((e) => MapEntry(e, absoluteError(e + dx, snapPosition))));

      final MapEntry<double, double> minErrorEntry =
          absoluteErrors.entries.reduce((a, b) => a.value < b.value ? a : b);

      if (minErrorEntry.value <=
          widget.stickerWidgetConfig.translationSnapThreshold) {
        dx = snapPosition - minErrorEntry.key;
      }
    }

    final List<double> translationYSnapValues =
        widget.stickerWidgetConfig.translationYSnapValues +
            widget.getYSnapValues();

    for (final double snapPosition in translationYSnapValues) {
      final Map<double, double> absoluteErrors = Map.fromEntries(
          verticalSnapPoints
              .map((e) => MapEntry(e, absoluteError(e + dy, snapPosition))));

      final MapEntry<double, double> minErrorEntry =
          absoluteErrors.entries.reduce((a, b) => a.value < b.value ? a : b);

      if (minErrorEntry.value <=
          widget.stickerWidgetConfig.translationSnapThreshold) {
        dy = snapPosition - minErrorEntry.key;
      }
    }

    return Vector3(dx, dy, 0);
  }

  List<double> _findHorizontalSnapPoints(
      double rotation, Size rectangleSize, Offset center) {
    if (rotation == 0 || rotation == pi) {
      return [
        center.dx,
        center.dx + rectangleSize.width / 2,
        center.dx - rectangleSize.width / 2,
      ];
    }
    if (rotation == pi / 2 || rotation == 3 * pi / 2) {
      return [
        center.dx,
        center.dx + rectangleSize.height / 2,
        center.dx - rectangleSize.height / 2,
      ];
    }
    return [center.dx];
  }

  List<double> _findVerticalSnapPoints(
      double rotation, Size rectangleSize, Offset center) {
    if (rotation == 0 || rotation == pi) {
      return [
        center.dy,
        center.dy + rectangleSize.height / 2,
        center.dy - rectangleSize.height / 2,
      ];
    }
    if (rotation == pi / 2 || rotation == 3 * pi / 2) {
      return [
        center.dy,
        center.dy + rectangleSize.width / 2,
        center.dy - rectangleSize.width / 2,
      ];
    }
    return [center.dx];
  }

  // Helper function for rotating matrix.
  double _rotate(Matrix4 matrix, double angle) {
    double toBeRotated = 0;
    double rotation = atan2(matrix[1], matrix[0]);
    double deltaAngle = rotationUpdater.update(angle);

    for (var snapPosition in widget.stickerWidgetConfig.rotationSnapValues) {
      if (snapPosition > 180) {
        snapPosition = 180 - snapPosition;
      }
      snapPosition = radians(snapPosition);

      if (rotation != snapPosition &&
          absoluteError((rotation + deltaAngle), snapPosition) <=
              widget.stickerWidgetConfig.rotationToSnapThreshold) {
        toBeRotated = snapPosition - rotation;

        if (widget.stickerWidgetConfig.enableHapticFeedbackOnRotation) {
          HapticFeedback.mediumImpact();
        }

        break;
      } else if (rotation == snapPosition &&
          absoluteError((rotation + deltaAngle), snapPosition) <=
              widget.stickerWidgetConfig.rotationFromSnapThreshold) {
        toBeRotated = 0;
        break;
      } else {
        toBeRotated = deltaAngle;
      }
    }

    return toBeRotated;
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
