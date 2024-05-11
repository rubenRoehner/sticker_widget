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
    required final List<double> Function() getTranslationXSnapValues,
    required final List<double> Function() getTranslationYSnapValues,

    /// The current transform of the widget.
    ///
    /// The [transform] property represents the current transformation matrix of the draggable widget.
    required final Matrix4 transform,

    /// The index of the layer the widget belongs to.
    ///
    /// The [layerIndex] property represents the index of the layer to which the draggable widget belongs.
    required final int layerIndex,

    /// Whether the widget is currently selected.
    ///
    /// The [isSelected] property indicates whether the draggable widget is currently selected or not.
    @Default(false) final bool isSelected,

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
