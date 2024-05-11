import 'package:flutter/cupertino.dart';
import 'package:sticker_widget/data/sticker_widget_config.dart';
import 'package:sticker_widget/data/draggable_widget_data.dart';
import 'sticker_gesture_detector.dart';

class DraggableWidget extends StatelessWidget {
  /// The [child] parameter is required and specifies the widget to be displayed.
  final Widget child;

  /// The [config] parameter is the configuration for the sticker widget.
  final StickerWidgetConfig config;

  /// The [data] parameter is the data associated with the draggable widget.
  final DraggableWidgetData data;

  /// The [type] parameter is the type of the draggable widget.
  final DraggableWidgetType type;

  /// Creates a draggable widget.
  ///
  /// The [child] parameter is the widget to be displayed.
  /// The [config] parameter is the configuration for the sticker widget.
  /// The [data] parameter is the data associated with the draggable widget.
  /// The [type] parameter is the type of the draggable widget.
  DraggableWidget({
    required super.key,
    required this.child,
    required this.data,
    required this.config,
    required this.type,
  });

  final GlobalKey layerKey = GlobalKey();
  final GlobalKey childrenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return StickerGestureDetector(
      stickerWidgetConfig: config,
      isSelected: data.isSelected,
      shouldTranslate: data.isLocked ? false : config.shouldMove,
      shouldRotate: data.isLocked ? false : config.shouldRotate,
      shouldScale: data.isLocked ? false : config.shouldScale,
      minScale: config.minScale,
      maxScale: config.maxScale,
      initialMatrix: data.transform,
      canvasScale: data.canvasScale,
      onScaleStart: data.startTransform,
      onScaleEnd: data.endTransform,
      onTap: data.onSelect,
      onUpdate: (m) {
        data.updateTransform(m);
      },
      layerKey: layerKey,
      childrenKey: childrenKey,
      child: SizedBox(
        key: layerKey,
        width: config.layerSize.width,
        height: config.layerSize.height,
        child: Transform(
          transform: data.transform.clone()
            ..translate(
                -config.canvasSize.width / 2, -config.canvasSize.height / 2),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              key: childrenKey,
              foregroundDecoration: BoxDecoration(
                color: data.isSelected
                    ? config.selectedOverlayColor
                    : const Color(0x00000000),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

enum DraggableWidgetType { text, image, icon, custom }
