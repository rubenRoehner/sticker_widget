import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'draggable_widget_config.freezed.dart';

@freezed
class StickerWidgetConfig with _$DraggableWidgetConfig {
  const factory StickerWidgetConfig({
    @Default(Color(0xFFFFFFFF)) final Color borderColor,
    @Default(Color(0xFF000000)) final Color iconColor,
    @Default(true) final bool showDone,
    @Default(true) final bool showClose,
    @Default(true) final bool showFlip,
    @Default(true) final bool showStack,
    @Default(true) final bool showLock,
    @Default(true) final bool showAllBorders,
    @Default(true) final bool shouldMove,
    @Default(true) final bool shouldRotate,
    @Default(true) final bool shouldScale,
    @Default(0.5) final double minScale,
    @Default(4.0) final double maxScale,
  }) = _DraggableWidgetConfig;
}
