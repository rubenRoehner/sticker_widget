import 'package:flutter/cupertino.dart';
import 'package:sticker_widget/data/sticker_widget_config.dart';
import 'package:sticker_widget/data/draggable_widget_data.dart';
import 'draggable_widget_action.dart';
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
      layerKey: layerKey,
      childrenKey: childrenKey,
      child: SizedBox(
        width: config.canvasSize.width,
        height: config.canvasSize.height,
        child: Transform(
          transform: data.transform,
          alignment: Alignment.topLeft,
          child: FittedBox(
            key: layerKey,
            fit: BoxFit.scaleDown,
            child: Stack(
              children: [
                Container(
                  margin: config.showAllBorders
                      ? EdgeInsets.all(
                          DraggableWidgetAction.defaultCircleRadius /
                              data.scale)
                      : EdgeInsetsDirectional.zero,
                  padding: config.showAllBorders
                      ? EdgeInsets.all(
                          DraggableWidgetAction.defaultCircleRadius /
                              data.scale)
                      : EdgeInsetsDirectional.zero,
                  decoration: (config.showAllBorders && data.isSelected)
                      ? BoxDecoration(
                          border: Border.all(
                            color: config.borderColor,
                            width: 1.5 / data.scale,
                          ),
                        )
                      : null,
                  foregroundDecoration: BoxDecoration(
                    color: data.isSelected
                        ? config.selectedOverlayColor
                        : const Color(0x00000000),
                  ),
                  child: Transform.flip(
                    key: childrenKey,
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
