import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vector_math/vector_math_64.dart';
part 'draggable_widget_data.freezed.dart';

@freezed
class DraggableWidgetData with _$DraggableWidgetData {
  const factory DraggableWidgetData({
    required final void Function() onSelect,
    required final void Function() onFlipButtonPressed,
    required final void Function() onDoneButtonPressed,
    required final void Function() onLockPressed,
    required final void Function() onDeleteButtonPressed,
    required final void Function() onLayerButtonPressed,
    required final void Function(double newScale) updateScale,
    required final void Function(Matrix4 newTransform) updateTransform,
    required final Matrix4 transform,
    @Default(1.0) final double scale,
    @Default(false) final bool isSelected,
    @Default(false) final bool isFlipped,
    @Default(false) final bool isLocked,
  }) = _DraggableWidgetData;
}
