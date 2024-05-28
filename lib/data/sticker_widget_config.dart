import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sticker_widget_config.freezed.dart';

@freezed

/// Represents the configuration for a sticker widget.
/// This class is used to define the properties and behavior of a sticker widget.
class StickerWidgetConfig with _$StickerWidgetConfig {
  const factory StickerWidgetConfig({
    /// The size of the underlying canvas.
    ///
    /// The [canvasSize] property represents the size of the underlying canvas.
    @Default(Size(500, 500)) final Size canvasSize,

    /// The size of the underlying canvas.
    ///
    /// The [canvasSize] property represents the size of the underlying canvas.
    @Default(Size(500, 500)) final Size layerSize,

    /// Whether the widget should be movable.
    ///
    /// The [shouldMove] property determines whether the widget should be movable.
    @Default(true) final bool shouldMove,

    /// Whether the widget should be rotatable.
    ///
    /// The [shouldRotate] property determines whether the widget should be rotatable.
    @Default(true) final bool shouldRotate,

    /// Whether the widget should be scalable.
    ///
    /// The [shouldScale] property determines whether the widget should be scalable.
    @Default(true) final bool shouldScale,

    /// The minimum scale value.
    ///
    /// The [minScale] property represents the minimum scale value.
    @Default(0.5) final double minScale,

    /// The maximum scale value.
    ///
    /// The [maxScale] property represents the maximum scale value.
    @Default(4.0) final double maxScale,

    /// The snap values for rotation.
    ///
    /// The [rotationSnapValues] property represents the snap values for rotation.
    @Default([0, 90, 180, 270]) final List<double> rotationSnapValues,

    /// The snap values for translation on the x-axis.
    ///
    /// The [translationXSnapValues] property represents the snap values for translation on the x-axis.
    @Default([0]) final List<double> translationXSnapValues,

    /// The snap values for translation on the y-axis.
    ///
    /// The [translationYSnapValues] property represents the snap values for translation on the y-axis.
    @Default([0]) final List<double> translationYSnapValues,

    /// The rotation snap threshold.
    ///
    /// The [rotationSnapThreshold] property represents the rotation snap threshold.
    @Default(0.015) final double rotationFromSnapThreshold,

    /// The rotation snap threshold.
    ///
    /// The [rotationSnapThreshold] property represents the rotation snap threshold.
    @Default(0.015) final double rotationToSnapThreshold,

    /// The translation snap threshold.
    ///
    /// The [translationSnapThreshold] property represents the translation snap threshold.
    @Default(0.8) final double translationSnapThreshold,

    /// The color of the Overlay.
    ///
    /// The [selectedOverlayColor] property represents the color of the Overlay that is displayed when the Widget is selected.
    /// It defaults to a transparent color.
    @Default(Color(0x00000000)) final Color selectedOverlayColor,

    /// The size of the icon.
    ///
    /// The [defaultIconSize] property represents the size of the icon.
    /// It defaults to 24.
    @Default(24) final double defaultIconSize,
    @Default(false) final bool enableHapticFeedbackOnRotation,
    @Default(1.0) final double rotationSpeed,
  }) = _StickerWidgetConfig;
}
