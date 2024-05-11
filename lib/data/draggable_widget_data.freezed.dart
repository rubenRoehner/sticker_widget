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

  /// Whether the widget is currently selected.
  ///
  /// The [isSelected] property indicates whether the draggable widget is currently selected or not.
  bool get isSelected => throw _privateConstructorUsedError;

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
      void Function(Matrix4) updateTransform,
      void Function() startTransform,
      void Function() endTransform,
      Matrix4 transform,
      int layerIndex,
      bool isSelected,
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
    Object? updateTransform = null,
    Object? startTransform = null,
    Object? endTransform = null,
    Object? transform = null,
    Object? layerIndex = null,
    Object? isSelected = null,
    Object? isLocked = null,
    Object? canvasScale = null,
  }) {
    return _then(_value.copyWith(
      onSelect: null == onSelect
          ? _value.onSelect
          : onSelect // ignore: cast_nullable_to_non_nullable
              as void Function(),
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
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
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
      void Function(Matrix4) updateTransform,
      void Function() startTransform,
      void Function() endTransform,
      Matrix4 transform,
      int layerIndex,
      bool isSelected,
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
    Object? updateTransform = null,
    Object? startTransform = null,
    Object? endTransform = null,
    Object? transform = null,
    Object? layerIndex = null,
    Object? isSelected = null,
    Object? isLocked = null,
    Object? canvasScale = null,
  }) {
    return _then(_$DraggableWidgetDataImpl(
      onSelect: null == onSelect
          ? _value.onSelect
          : onSelect // ignore: cast_nullable_to_non_nullable
              as void Function(),
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
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
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
      required this.updateTransform,
      required this.startTransform,
      required this.endTransform,
      required this.transform,
      required this.layerIndex,
      this.isSelected = false,
      this.isLocked = false,
      this.canvasScale = 1});

  /// A callback function that is called when the widget is selected.
  ///
  /// The [onSelect] function is required and should be provided by the parent widget.
  /// It will be called when the user selects the draggable widget.
  /// This can be used to perform any necessary actions or updates in the parent widget.
  @override
  final void Function() onSelect;

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

  /// Whether the widget is currently selected.
  ///
  /// The [isSelected] property indicates whether the draggable widget is currently selected or not.
  @override
  @JsonKey()
  final bool isSelected;

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
    return 'DraggableWidgetData(onSelect: $onSelect, updateTransform: $updateTransform, startTransform: $startTransform, endTransform: $endTransform, transform: $transform, layerIndex: $layerIndex, isSelected: $isSelected, isLocked: $isLocked, canvasScale: $canvasScale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraggableWidgetDataImpl &&
            (identical(other.onSelect, onSelect) ||
                other.onSelect == onSelect) &&
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
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.canvasScale, canvasScale) ||
                other.canvasScale == canvasScale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      onSelect,
      updateTransform,
      startTransform,
      endTransform,
      transform,
      layerIndex,
      isSelected,
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
      required final void Function(Matrix4) updateTransform,
      required final void Function() startTransform,
      required final void Function() endTransform,
      required final Matrix4 transform,
      required final int layerIndex,
      final bool isSelected,
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

  /// Whether the widget is currently selected.
  ///
  /// The [isSelected] property indicates whether the draggable widget is currently selected or not.
  bool get isSelected;
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
