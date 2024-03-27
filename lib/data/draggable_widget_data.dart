import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vector_math/vector_math_64.dart';

part 'draggable_widget_data.freezed.dart';

/// Data class representing the state of a draggable widget.
@freezed
class DraggableWidgetData with _$DraggableWidgetData {
  const factory DraggableWidgetData({
    /// A callback function that is called when the widget is selected.
    ///
    /// The [onSelect] function is required and should be provided by the parent widget.
    /// It will be called when the user selects the draggable widget.
    /// This can be used to perform any necessary actions or updates in the parent widget.
    required final void Function() onSelect,

    /// A callback function that is called when the flip button is pressed.
    ///
    /// The [onFlipButtonPressed] function is required and should be provided by the parent widget.
    /// It will be called when the user presses the flip button on the draggable widget.
    required final void Function() onFlipButtonPressed,

    /// A required callback function that is called when the done button is pressed.
    ///
    /// The [onDoneButtonPressed] function is required and should be provided by the parent widget.
    /// It will be called when the user presses the done button on the draggable widget.
    required final void Function() onDoneButtonPressed,

    /// A callback function that is called when the lock button is pressed.
    ///
    /// The [onLockPressed] function is required and should be provided by the parent widget.
    /// It will be called when the user presses the lock button on the draggable widget.
    required final void Function() onLockPressed,

    /// A callback function that is called when the delete button is pressed.
    ///
    /// The [onDeleteButtonPressed] function is required and should be provided by the parent widget.
    /// It will be called when the user presses the delete button on the draggable widget.
    required final void Function() onDeleteButtonPressed,

    /// A callback function that is called when the layer button is pressed.
    ///
    /// The [onLayerButtonPressed] function is required and should be provided by the parent widget.
    /// It will be called when the user presses the layer button on the draggable widget.
    required final void Function() onLayerButtonPressed,

    /// A callback function that is called when the scale is updated.
    ///
    /// The [updateScale] function is required and should be provided by the parent widget.
    /// It will be called when the user updates the scale of the draggable widget.
    required final void Function(double newScale) updateScale,

    /// A callback function that is called when the transform is updated.
    ///
    /// The [updateTransform] function is required and should be provided by the parent widget.
    /// It will be called when the user updates the transform of the draggable widget.
    required final void Function(Matrix4 newTransform) updateTransform,

    /// A callback function that is called when the transform starts.
    ///
    /// The [startTransform] function is required and should be provided by the parent widget.
    /// It will be called when the user starts transforming the draggable widget.
    required final void Function() startTransform,

    /// A callback function that is called when the transform ends.
    ///
    /// The [endTransform] function is required and should be provided by the parent widget.
    /// It will be called when the user finishes transforming the draggable widget.
    required final void Function() endTransform,

    /// The current transform of the widget.
    ///
    /// The [transform] property represents the current transformation matrix of the draggable widget.
    required final Matrix4 transform,

    /// The index of the layer the widget belongs to.
    ///
    /// The [layerIndex] property represents the index of the layer to which the draggable widget belongs.
    required final int layerIndex,

    /// The scale of the widget.
    ///
    /// The [scale] property represents the scale factor of the draggable widget.
    @Default(1.0) final double scale,

    /// Whether the widget is currently selected.
    ///
    /// The [isSelected] property indicates whether the draggable widget is currently selected or not.
    @Default(false) final bool isSelected,

    /// Whether the widget is flipped.
    ///
    /// The [isFlipped] property indicates whether the draggable widget is flipped or not.
    @Default(false) final bool isFlipped,

    /// Whether the widget is locked.
    ///
    /// The [isLocked] property indicates whether the draggable widget is locked or not.
    @Default(false) final bool isLocked,

    /// The scale factor of the canvas.
    ///
    /// The [canvasScale] property represents the scale factor of the canvas.
    @Default(1) final double canvasScale,
  }) = _DraggableWidgetData;
}
