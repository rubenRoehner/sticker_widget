import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:sticker_widget/data/sticker_widget_config.dart';
import 'package:vector_math/vector_math_64.dart';

/// StickerGestureDetector for handling scaling, rotating, and translating the widget.
///
class StickerGestureDetector extends StatefulWidget {
  /// Callback function for when updates occur.
  ///
  final void Function(double scale, Matrix4 matrix) onUpdate;

  /// [child] widget wrapped by the gesture detector.
  ///
  final Widget child;

  /// Control flags for various gesture types (translate, scale, rotate).
  ///
  /// Defaults to true
  ///
  final bool shouldTranslate;
  final bool shouldScale;
  final bool shouldRotate;

  /// Flag to clip the child widget.
  ///
  /// Defaults to true
  ///
  final bool clipChild;

  /// Behavior when handling hit tests.
  ///
  /// Defaults to HitTestBehavior.deferToChild
  ///
  final HitTestBehavior behavior;

  /// Alignment of the focal point.
  ///
  final Alignment? focalPointAlignment;

  /// Callback functions for scale start and end.
  ///
  final VoidCallback onScaleStart;
  final VoidCallback onScaleEnd;
  final VoidCallback onTap;

  /// Minimum and maximum scale values.
  ///
  final double minScale;
  final double maxScale;

  /// StickerWidgetConfig.
  ///
  final StickerWidgetConfig stickerWidgetConfig;

  const StickerGestureDetector(
      {super.key,
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
      required this.maxScale});

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

  // Callback when a scale gesture starts.
  void onScaleStart(ScaleStartDetails details) {
    widget.onScaleStart();
    translationUpdater.value = details.focalPoint;
    recordOldScale = recordScale;
    scaleUpdater.value = 1.0;
    rotationUpdater.value = 0.0;
  }

  // Callback when a scale gesture ends.
  void onScaleEnd(ScaleEndDetails details) {
    widget.onScaleEnd();
  }

  // Callback for handling scale updates.
  void onScaleUpdate(ScaleUpdateDetails details) {
    widget.onScaleStart();

    // Handle translation.
    if (widget.shouldTranslate) {
      Offset translationDelta = translationUpdater.update(details.focalPoint);
      matrix = _translate(translationDelta) * matrix;
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

    double tx = matrix[12];
    double ty = matrix[13];

    Size size = context.size!;
    double rotation = atan2(matrix[1], matrix[0]);

    double preRotationCenterX = (tx - size.width / 2) / recordOldScale;
    double preRotationCenterY = (ty - size.height / 2) / recordOldScale;

    double centerX = cos(-rotation) * preRotationCenterX -
        sin(-rotation) * preRotationCenterY +
        (size.width / 2);

    double centerY = sin(-rotation) * preRotationCenterX +
        cos(-rotation) * preRotationCenterY +
        (size.height / 2);

    // TODO: Fix translation snapping when the object is rotated.

    for (var snapPosition
        in widget.stickerWidgetConfig.translationXSnapValues) {
      if (absoluteError(centerX + dy, snapPosition) <=
          widget.stickerWidgetConfig.translationSnapThreshold) {
        dx = snapPosition - centerX;
      }
    }

    for (var snapPosition
        in widget.stickerWidgetConfig.translationYSnapValues) {
      if (absoluteError(centerY + dy, snapPosition) <=
          widget.stickerWidgetConfig.translationSnapThreshold) {
        dy = snapPosition - centerY;
      }
    }

    Matrix4 translationMatrix =
        Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);

    return translationMatrix;
  }

  // Helper function for scaling matrix.
  Matrix4 _scale(double scale, Offset focalPoint) {
    var dx = (1 - scale) * focalPoint.dx;
    var dy = (1 - scale) * focalPoint.dy;

    return Matrix4(scale, 0, 0, 0, 0, scale, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
  }

  Matrix4 _rotate(double angle, Offset focalPoint) {
    double toBeRotated = 0;
    var array = matrix.applyToVector3Array([0, 0, 0, 1, 0, 0]);
    Offset delta = Offset(array[3] - array[0], array[4] - array[1]);
    double rotation = delta.direction;
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
