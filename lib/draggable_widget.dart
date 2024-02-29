import 'package:flutter/cupertino.dart';
import 'package:sticker_widget/data/sticker_widget_config.dart';
import 'package:sticker_widget/data/draggable_widget_data.dart';
import 'draggable_widget/draggable_widget_action.dart';
import 'draggable_widget/sticker_gesture_detector.dart';

class DraggableWidget extends StatelessWidget {
  final Widget child;
  final StickerWidgetConfig config;
  final DraggableWidgetData data;
  final DraggableWidgetType type;

  DraggableWidget({
    required super.key,
    required this.child,
    required this.data,
    required this.config,
    required this.type,
  });

  final GlobalKey childrenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return StickerGestureDetector(
      stickerWidgetConfig: config,
      isSelected: data.isSelected,
      shouldTranslate: config.shouldMove,
      shouldRotate: config.shouldRotate,
      shouldScale: config.shouldScale,
      minScale: config.minScale,
      maxScale: config.maxScale,
      onTap: () {
        data.onSelect();
      },
      onScaleStart: () {
        data.startTransform();
      },
      onScaleEnd: () {
        data.endTransform();
      },
      onUpdate: (s, m) {
        data.updateScale(s);
        data.updateTransform(m);
      },
      childrenKey: childrenKey,
      child: SizedBox(
        width: config.canvasSize.width,
        height: config.canvasSize.height,
        child: Transform(
          transform: data.transform,
          child: FittedBox(
            key: childrenKey,
            fit: BoxFit.scaleDown,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(
                      DraggableWidgetAction.defaultCircleRadius / data.scale),
                  padding: EdgeInsets.all(
                      DraggableWidgetAction.defaultCircleRadius / data.scale),
                  decoration: (config.showAllBorders && data.isSelected)
                      ? BoxDecoration(
                          border: Border.all(
                            color: config.borderColor,
                            width: 1.5 / data.scale,
                          ),
                        )
                      : null,
                  child: Transform.flip(
                    flipX: data.isFlipped,
                    child: child,
                  ),
                ),
                ...actionWidgets(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> actionWidgets() {
    // Widgets for interaction (e.g., delete, flip, etc.).
    if (!(config.showAllBorders && data.isSelected)) {
      return List.empty();
    }
    if (data.isLocked) {
      return [
        DraggableWidgetAction(
          icon: CupertinoIcons.lock,
          borderColor: config.borderColor,
          iconColor: config.iconColor,
          scale: data.scale,
          onTap: data.onLockPressed,
          left: 0,
          right: 0,
        ),
      ];
    }
    return [
      if (config.showDone)
        DraggableWidgetAction(
          icon: CupertinoIcons.check_mark,
          borderColor: config.borderColor,
          iconColor: config.iconColor,
          scale: data.scale,
          onTap: data.onDoneButtonPressed,
          right: 0,
        ),
      if (config.showClose)
        DraggableWidgetAction(
          icon: CupertinoIcons.xmark,
          borderColor: config.borderColor,
          iconColor: config.iconColor,
          scale: data.scale,
          left: 0,
          onTap: data.onDeleteButtonPressed,
        ),
      if (config.showFlip)
        DraggableWidgetAction(
          icon: CupertinoIcons.perspective,
          borderColor: config.borderColor,
          iconColor: config.iconColor,
          scale: data.scale,
          onTap: data.onFlipButtonPressed,
          bottom: 0,
          left: 0,
        ),
      if (config.showStack)
        DraggableWidgetAction(
          icon: CupertinoIcons.layers,
          borderColor: config.borderColor,
          iconColor: config.iconColor,
          scale: data.scale,
          onTap: data.onLayerButtonPressed,
          bottom: 0,
          right: 0,
        ),
      if (config.showLock)
        DraggableWidgetAction(
          icon: CupertinoIcons.lock_open,
          borderColor: config.borderColor,
          iconColor: config.iconColor,
          scale: data.scale,
          onTap: data.onLockPressed,
          left: 0,
          right: 0,
        ),
    ];
  }
}

enum DraggableWidgetType { text, image, icon, custom }
