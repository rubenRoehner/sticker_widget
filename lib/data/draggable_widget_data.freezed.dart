// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draggable_widget_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DraggableWidgetData {
  /// A callback function that is called when the widget is selected.
  ///
  /// The [onSelect] function is required and should be provided by the parent widget.
  /// It will be called when the user selects the draggable widget.
  /// This can be used to perform any necessary actions or updates in the parent widget.
  void Function() get onSelect => throw _privateConstructorUsedError;

  /// A callback function that is called when the flip button is pressed.
  ///
  /// The [onFlipButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the flip button on the draggable widget.
  void Function() get onFlipButtonPressed => throw _privateConstructorUsedError;

  /// A required callback function that is called when the done button is pressed.
  ///
  /// The [onDoneButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the done button on the draggable widget.
  void Function() get onDoneButtonPressed => throw _privateConstructorUsedError;

  /// A callback function that is called when the lock button is pressed.
  ///
  /// The [onLockPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the lock button on the draggable widget.
  void Function() get onLockPressed => throw _privateConstructorUsedError;

  /// A callback function that is called when the delete button is pressed.
  ///
  /// The [onDeleteButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the delete button on the draggable widget.
  void Function() get onDeleteButtonPressed =>
      throw _privateConstructorUsedError;

  /// A callback function that is called when the layer button is pressed.
  ///
  /// The [onLayerButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the layer button on the draggable widget.
  void Function() get onLayerButtonPressed =>
      throw _privateConstructorUsedError;

  /// A callback function that is called when the scale is updated.
  ///
  /// The [updateScale] function is required and should be provided by the parent widget.
  /// It will be called when the user updates the scale of the draggable widget.
  void Function(double) get updateScale => throw _privateConstructorUsedError;

  /// A callback function that is called when the transform is updated.
  ///
  /// The [updateTransform] function is required and should be provided by the parent widget.
  /// It will be called when the user updates the transform of the draggable widget.
  void Function(Matrix4) get updateTransform =>
      throw _privateConstructorUsedError;

  /// A callback function that is called when the transform starts.
  ///
  /// The [startTransform] function is required and should be provided by the parent widget.
  /// It will be called when the user starts transforming the draggable widget.
  void Function() get startTransform => throw _privateConstructorUsedError;

  /// A callback function that is called when the transform ends.
  ///
  /// The [endTransform] function is required and should be provided by the parent widget.
  /// It will be called when the user finishes transforming the draggable widget.
  void Function() get endTransform => throw _privateConstructorUsedError;

  /// The current transform of the widget.
  ///
  /// The [transform] property represents the current transformation matrix of the draggable widget.
  Matrix4 get transform => throw _privateConstructorUsedError;

  /// The index of the layer the widget belongs to.
  ///
  /// The [layerIndex] property represents the index of the layer to which the draggable widget belongs.
  int get layerIndex => throw _privateConstructorUsedError;

  /// The scale of the widget.
  ///
  /// The [scale] property represents the scale factor of the draggable widget.
  double get scale => throw _privateConstructorUsedError;

  /// Whether the widget is currently selected.
  ///
  /// The [isSelected] property indicates whether the draggable widget is currently selected or not.
  bool get isSelected => throw _privateConstructorUsedError;

  /// Whether the widget is flipped.
  ///
  /// The [isFlipped] property indicates whether the draggable widget is flipped or not.
  bool get isFlipped => throw _privateConstructorUsedError;

  /// Whether the widget is locked.
  ///
  /// The [isLocked] property indicates whether the draggable widget is locked or not.
  bool get isLocked => throw _privateConstructorUsedError;

  /// The scale factor of the canvas.
  ///
  /// The [canvasScale] property represents the scale factor of the canvas.
  double get canvasScale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DraggableWidgetDataCopyWith<DraggableWidgetData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraggableWidgetDataCopyWith<$Res> {
  factory $DraggableWidgetDataCopyWith(
          DraggableWidgetData value, $Res Function(DraggableWidgetData) then) =
      _$DraggableWidgetDataCopyWithImpl<$Res, DraggableWidgetData>;
  @useResult
  $Res call(
      {void Function() onSelect,
      void Function() onFlipButtonPressed,
      void Function() onDoneButtonPressed,
      void Function() onLockPressed,
      void Function() onDeleteButtonPressed,
      void Function() onLayerButtonPressed,
      void Function(double) updateScale,
      void Function(Matrix4) updateTransform,
      void Function() startTransform,
      void Function() endTransform,
      Matrix4 transform,
      int layerIndex,
      double scale,
      bool isSelected,
      bool isFlipped,
      bool isLocked,
      double canvasScale});
}

/// @nodoc
class _$DraggableWidgetDataCopyWithImpl<$Res, $Val extends DraggableWidgetData>
    implements $DraggableWidgetDataCopyWith<$Res> {
  _$DraggableWidgetDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onSelect = null,
    Object? onFlipButtonPressed = null,
    Object? onDoneButtonPressed = null,
    Object? onLockPressed = null,
    Object? onDeleteButtonPressed = null,
    Object? onLayerButtonPressed = null,
    Object? updateScale = null,
    Object? updateTransform = null,
    Object? startTransform = null,
    Object? endTransform = null,
    Object? transform = null,
    Object? layerIndex = null,
    Object? scale = null,
    Object? isSelected = null,
    Object? isFlipped = null,
    Object? isLocked = null,
    Object? canvasScale = null,
  }) {
    return _then(_value.copyWith(
      onSelect: null == onSelect
          ? _value.onSelect
          : onSelect // ignore: cast_nullable_to_non_nullable
              as void Function(),
      onFlipButtonPressed: null == onFlipButtonPressed
          ? _value.onFlipButtonPressed
          : onFlipButtonPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
      onDoneButtonPressed: null == onDoneButtonPressed
          ? _value.onDoneButtonPressed
          : onDoneButtonPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
      onLockPressed: null == onLockPressed
          ? _value.onLockPressed
          : onLockPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
      onDeleteButtonPressed: null == onDeleteButtonPressed
          ? _value.onDeleteButtonPressed
          : onDeleteButtonPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
      onLayerButtonPressed: null == onLayerButtonPressed
          ? _value.onLayerButtonPressed
          : onLayerButtonPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
      updateScale: null == updateScale
          ? _value.updateScale
          : updateScale // ignore: cast_nullable_to_non_nullable
              as void Function(double),
      updateTransform: null == updateTransform
          ? _value.updateTransform
          : updateTransform // ignore: cast_nullable_to_non_nullable
              as void Function(Matrix4),
      startTransform: null == startTransform
          ? _value.startTransform
          : startTransform // ignore: cast_nullable_to_non_nullable
              as void Function(),
      endTransform: null == endTransform
          ? _value.endTransform
          : endTransform // ignore: cast_nullable_to_non_nullable
              as void Function(),
      transform: null == transform
          ? _value.transform
          : transform // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      layerIndex: null == layerIndex
          ? _value.layerIndex
          : layerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isFlipped: null == isFlipped
          ? _value.isFlipped
          : isFlipped // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      canvasScale: null == canvasScale
          ? _value.canvasScale
          : canvasScale // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DraggableWidgetDataImplCopyWith<$Res>
    implements $DraggableWidgetDataCopyWith<$Res> {
  factory _$$DraggableWidgetDataImplCopyWith(_$DraggableWidgetDataImpl value,
          $Res Function(_$DraggableWidgetDataImpl) then) =
      __$$DraggableWidgetDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {void Function() onSelect,
      void Function() onFlipButtonPressed,
      void Function() onDoneButtonPressed,
      void Function() onLockPressed,
      void Function() onDeleteButtonPressed,
      void Function() onLayerButtonPressed,
      void Function(double) updateScale,
      void Function(Matrix4) updateTransform,
      void Function() startTransform,
      void Function() endTransform,
      Matrix4 transform,
      int layerIndex,
      double scale,
      bool isSelected,
      bool isFlipped,
      bool isLocked,
      double canvasScale});
}

/// @nodoc
class __$$DraggableWidgetDataImplCopyWithImpl<$Res>
    extends _$DraggableWidgetDataCopyWithImpl<$Res, _$DraggableWidgetDataImpl>
    implements _$$DraggableWidgetDataImplCopyWith<$Res> {
  __$$DraggableWidgetDataImplCopyWithImpl(_$DraggableWidgetDataImpl _value,
      $Res Function(_$DraggableWidgetDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onSelect = null,
    Object? onFlipButtonPressed = null,
    Object? onDoneButtonPressed = null,
    Object? onLockPressed = null,
    Object? onDeleteButtonPressed = null,
    Object? onLayerButtonPressed = null,
    Object? updateScale = null,
    Object? updateTransform = null,
    Object? startTransform = null,
    Object? endTransform = null,
    Object? transform = null,
    Object? layerIndex = null,
    Object? scale = null,
    Object? isSelected = null,
    Object? isFlipped = null,
    Object? isLocked = null,
    Object? canvasScale = null,
  }) {
    return _then(_$DraggableWidgetDataImpl(
      onSelect: null == onSelect
          ? _value.onSelect
          : onSelect // ignore: cast_nullable_to_non_nullable
              as void Function(),
      onFlipButtonPressed: null == onFlipButtonPressed
          ? _value.onFlipButtonPressed
          : onFlipButtonPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
      onDoneButtonPressed: null == onDoneButtonPressed
          ? _value.onDoneButtonPressed
          : onDoneButtonPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
      onLockPressed: null == onLockPressed
          ? _value.onLockPressed
          : onLockPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
      onDeleteButtonPressed: null == onDeleteButtonPressed
          ? _value.onDeleteButtonPressed
          : onDeleteButtonPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
      onLayerButtonPressed: null == onLayerButtonPressed
          ? _value.onLayerButtonPressed
          : onLayerButtonPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
      updateScale: null == updateScale
          ? _value.updateScale
          : updateScale // ignore: cast_nullable_to_non_nullable
              as void Function(double),
      updateTransform: null == updateTransform
          ? _value.updateTransform
          : updateTransform // ignore: cast_nullable_to_non_nullable
              as void Function(Matrix4),
      startTransform: null == startTransform
          ? _value.startTransform
          : startTransform // ignore: cast_nullable_to_non_nullable
              as void Function(),
      endTransform: null == endTransform
          ? _value.endTransform
          : endTransform // ignore: cast_nullable_to_non_nullable
              as void Function(),
      transform: null == transform
          ? _value.transform
          : transform // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      layerIndex: null == layerIndex
          ? _value.layerIndex
          : layerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isFlipped: null == isFlipped
          ? _value.isFlipped
          : isFlipped // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      canvasScale: null == canvasScale
          ? _value.canvasScale
          : canvasScale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DraggableWidgetDataImpl implements _DraggableWidgetData {
  const _$DraggableWidgetDataImpl(
      {required this.onSelect,
      required this.onFlipButtonPressed,
      required this.onDoneButtonPressed,
      required this.onLockPressed,
      required this.onDeleteButtonPressed,
      required this.onLayerButtonPressed,
      required this.updateScale,
      required this.updateTransform,
      required this.startTransform,
      required this.endTransform,
      required this.transform,
      required this.layerIndex,
      this.scale = 1.0,
      this.isSelected = false,
      this.isFlipped = false,
      this.isLocked = false,
      this.canvasScale = 1});

  /// A callback function that is called when the widget is selected.
  ///
  /// The [onSelect] function is required and should be provided by the parent widget.
  /// It will be called when the user selects the draggable widget.
  /// This can be used to perform any necessary actions or updates in the parent widget.
  @override
  final void Function() onSelect;

  /// A callback function that is called when the flip button is pressed.
  ///
  /// The [onFlipButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the flip button on the draggable widget.
  @override
  final void Function() onFlipButtonPressed;

  /// A required callback function that is called when the done button is pressed.
  ///
  /// The [onDoneButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the done button on the draggable widget.
  @override
  final void Function() onDoneButtonPressed;

  /// A callback function that is called when the lock button is pressed.
  ///
  /// The [onLockPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the lock button on the draggable widget.
  @override
  final void Function() onLockPressed;

  /// A callback function that is called when the delete button is pressed.
  ///
  /// The [onDeleteButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the delete button on the draggable widget.
  @override
  final void Function() onDeleteButtonPressed;

  /// A callback function that is called when the layer button is pressed.
  ///
  /// The [onLayerButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the layer button on the draggable widget.
  @override
  final void Function() onLayerButtonPressed;

  /// A callback function that is called when the scale is updated.
  ///
  /// The [updateScale] function is required and should be provided by the parent widget.
  /// It will be called when the user updates the scale of the draggable widget.
  @override
  final void Function(double) updateScale;

  /// A callback function that is called when the transform is updated.
  ///
  /// The [updateTransform] function is required and should be provided by the parent widget.
  /// It will be called when the user updates the transform of the draggable widget.
  @override
  final void Function(Matrix4) updateTransform;

  /// A callback function that is called when the transform starts.
  ///
  /// The [startTransform] function is required and should be provided by the parent widget.
  /// It will be called when the user starts transforming the draggable widget.
  @override
  final void Function() startTransform;

  /// A callback function that is called when the transform ends.
  ///
  /// The [endTransform] function is required and should be provided by the parent widget.
  /// It will be called when the user finishes transforming the draggable widget.
  @override
  final void Function() endTransform;

  /// The current transform of the widget.
  ///
  /// The [transform] property represents the current transformation matrix of the draggable widget.
  @override
  final Matrix4 transform;

  /// The index of the layer the widget belongs to.
  ///
  /// The [layerIndex] property represents the index of the layer to which the draggable widget belongs.
  @override
  final int layerIndex;

  /// The scale of the widget.
  ///
  /// The [scale] property represents the scale factor of the draggable widget.
  @override
  @JsonKey()
  final double scale;

  /// Whether the widget is currently selected.
  ///
  /// The [isSelected] property indicates whether the draggable widget is currently selected or not.
  @override
  @JsonKey()
  final bool isSelected;

  /// Whether the widget is flipped.
  ///
  /// The [isFlipped] property indicates whether the draggable widget is flipped or not.
  @override
  @JsonKey()
  final bool isFlipped;

  /// Whether the widget is locked.
  ///
  /// The [isLocked] property indicates whether the draggable widget is locked or not.
  @override
  @JsonKey()
  final bool isLocked;

  /// The scale factor of the canvas.
  ///
  /// The [canvasScale] property represents the scale factor of the canvas.
  @override
  @JsonKey()
  final double canvasScale;

  @override
  String toString() {
    return 'DraggableWidgetData(onSelect: $onSelect, onFlipButtonPressed: $onFlipButtonPressed, onDoneButtonPressed: $onDoneButtonPressed, onLockPressed: $onLockPressed, onDeleteButtonPressed: $onDeleteButtonPressed, onLayerButtonPressed: $onLayerButtonPressed, updateScale: $updateScale, updateTransform: $updateTransform, startTransform: $startTransform, endTransform: $endTransform, transform: $transform, layerIndex: $layerIndex, scale: $scale, isSelected: $isSelected, isFlipped: $isFlipped, isLocked: $isLocked, canvasScale: $canvasScale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraggableWidgetDataImpl &&
            (identical(other.onSelect, onSelect) ||
                other.onSelect == onSelect) &&
            (identical(other.onFlipButtonPressed, onFlipButtonPressed) ||
                other.onFlipButtonPressed == onFlipButtonPressed) &&
            (identical(other.onDoneButtonPressed, onDoneButtonPressed) ||
                other.onDoneButtonPressed == onDoneButtonPressed) &&
            (identical(other.onLockPressed, onLockPressed) ||
                other.onLockPressed == onLockPressed) &&
            (identical(other.onDeleteButtonPressed, onDeleteButtonPressed) ||
                other.onDeleteButtonPressed == onDeleteButtonPressed) &&
            (identical(other.onLayerButtonPressed, onLayerButtonPressed) ||
                other.onLayerButtonPressed == onLayerButtonPressed) &&
            (identical(other.updateScale, updateScale) ||
                other.updateScale == updateScale) &&
            (identical(other.updateTransform, updateTransform) ||
                other.updateTransform == updateTransform) &&
            (identical(other.startTransform, startTransform) ||
                other.startTransform == startTransform) &&
            (identical(other.endTransform, endTransform) ||
                other.endTransform == endTransform) &&
            (identical(other.transform, transform) ||
                other.transform == transform) &&
            (identical(other.layerIndex, layerIndex) ||
                other.layerIndex == layerIndex) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.isFlipped, isFlipped) ||
                other.isFlipped == isFlipped) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.canvasScale, canvasScale) ||
                other.canvasScale == canvasScale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      onSelect,
      onFlipButtonPressed,
      onDoneButtonPressed,
      onLockPressed,
      onDeleteButtonPressed,
      onLayerButtonPressed,
      updateScale,
      updateTransform,
      startTransform,
      endTransform,
      transform,
      layerIndex,
      scale,
      isSelected,
      isFlipped,
      isLocked,
      canvasScale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DraggableWidgetDataImplCopyWith<_$DraggableWidgetDataImpl> get copyWith =>
      __$$DraggableWidgetDataImplCopyWithImpl<_$DraggableWidgetDataImpl>(
          this, _$identity);
}

abstract class _DraggableWidgetData implements DraggableWidgetData {
  const factory _DraggableWidgetData(
      {required final void Function() onSelect,
      required final void Function() onFlipButtonPressed,
      required final void Function() onDoneButtonPressed,
      required final void Function() onLockPressed,
      required final void Function() onDeleteButtonPressed,
      required final void Function() onLayerButtonPressed,
      required final void Function(double) updateScale,
      required final void Function(Matrix4) updateTransform,
      required final void Function() startTransform,
      required final void Function() endTransform,
      required final Matrix4 transform,
      required final int layerIndex,
      final double scale,
      final bool isSelected,
      final bool isFlipped,
      final bool isLocked,
      final double canvasScale}) = _$DraggableWidgetDataImpl;

  @override

  /// A callback function that is called when the widget is selected.
  ///
  /// The [onSelect] function is required and should be provided by the parent widget.
  /// It will be called when the user selects the draggable widget.
  /// This can be used to perform any necessary actions or updates in the parent widget.
  void Function() get onSelect;
  @override

  /// A callback function that is called when the flip button is pressed.
  ///
  /// The [onFlipButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the flip button on the draggable widget.
  void Function() get onFlipButtonPressed;
  @override

  /// A required callback function that is called when the done button is pressed.
  ///
  /// The [onDoneButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the done button on the draggable widget.
  void Function() get onDoneButtonPressed;
  @override

  /// A callback function that is called when the lock button is pressed.
  ///
  /// The [onLockPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the lock button on the draggable widget.
  void Function() get onLockPressed;
  @override

  /// A callback function that is called when the delete button is pressed.
  ///
  /// The [onDeleteButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the delete button on the draggable widget.
  void Function() get onDeleteButtonPressed;
  @override

  /// A callback function that is called when the layer button is pressed.
  ///
  /// The [onLayerButtonPressed] function is required and should be provided by the parent widget.
  /// It will be called when the user presses the layer button on the draggable widget.
  void Function() get onLayerButtonPressed;
  @override

  /// A callback function that is called when the scale is updated.
  ///
  /// The [updateScale] function is required and should be provided by the parent widget.
  /// It will be called when the user updates the scale of the draggable widget.
  void Function(double) get updateScale;
  @override

  /// A callback function that is called when the transform is updated.
  ///
  /// The [updateTransform] function is required and should be provided by the parent widget.
  /// It will be called when the user updates the transform of the draggable widget.
  void Function(Matrix4) get updateTransform;
  @override

  /// A callback function that is called when the transform starts.
  ///
  /// The [startTransform] function is required and should be provided by the parent widget.
  /// It will be called when the user starts transforming the draggable widget.
  void Function() get startTransform;
  @override

  /// A callback function that is called when the transform ends.
  ///
  /// The [endTransform] function is required and should be provided by the parent widget.
  /// It will be called when the user finishes transforming the draggable widget.
  void Function() get endTransform;
  @override

  /// The current transform of the widget.
  ///
  /// The [transform] property represents the current transformation matrix of the draggable widget.
  Matrix4 get transform;
  @override

  /// The index of the layer the widget belongs to.
  ///
  /// The [layerIndex] property represents the index of the layer to which the draggable widget belongs.
  int get layerIndex;
  @override

  /// The scale of the widget.
  ///
  /// The [scale] property represents the scale factor of the draggable widget.
  double get scale;
  @override

  /// Whether the widget is currently selected.
  ///
  /// The [isSelected] property indicates whether the draggable widget is currently selected or not.
  bool get isSelected;
  @override

  /// Whether the widget is flipped.
  ///
  /// The [isFlipped] property indicates whether the draggable widget is flipped or not.
  bool get isFlipped;
  @override

  /// Whether the widget is locked.
  ///
  /// The [isLocked] property indicates whether the draggable widget is locked or not.
  bool get isLocked;
  @override

  /// The scale factor of the canvas.
  ///
  /// The [canvasScale] property represents the scale factor of the canvas.
  double get canvasScale;
  @override
  @JsonKey(ignore: true)
  _$$DraggableWidgetDataImplCopyWith<_$DraggableWidgetDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
