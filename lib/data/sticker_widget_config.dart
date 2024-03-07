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

    /// The color of the border.
    ///
    /// The [borderColor] property represents the color of the border.
    @Default(Color(0xFFFFFFFF)) final Color borderColor,

    /// The color of the icon.
    ///
    /// The [iconColor] property represents the color of the icon.
    @Default(Color(0xFF000000)) final Color iconColor,

    /// Whether to show the "Done" button.
    ///
    /// The [showDone] property determines whether to show the "Done" button.
    @Default(true) final bool showDone,

    /// Whether to show the "Close" button.
    ///
    /// The [showClose] property determines whether to show the "Close" button.
    @Default(true) final bool showClose,

    /// Whether to show the "Flip" button.
    ///
    /// The [showFlip] property determines whether to show the "Flip" button.
    @Default(true) final bool showFlip,

    /// Whether to show the "Stack" button.
    ///
    /// The [showStack] property determines whether to show the "Stack" button.
    @Default(true) final bool showStack,

    /// Whether to show the "Lock" button.
    ///
    /// The [showLock] property determines whether to show the "Lock" button.
    @Default(true) final bool showLock,

    /// Whether to show all borders.
    ///
    /// The [showAllBorders] property determines whether to show all borders.
    @Default(true) final bool showAllBorders,

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
    @Default(0.015) final double rotationSnapThreshold,

    /// The translation snap threshold.
    ///
    /// The [translationSnapThreshold] property represents the translation snap threshold.
    @Default(0.8) final double translationSnapThreshold,
  }) = _StickerWidgetConfig;
}
