import 'dart:math';

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
      onScaleStart: data.startTransform,
      onScaleEnd: data.endTransform,
      onTap: data.onSelect,
      onUpdate: (m) {
        data.updateTransform(m);
      },
      childrenKey: childrenKey,
      getXSnapValues: data.getTranslationXSnapValues,
      getYSnapValues: data.getTranslationYSnapValues,
      child: SizedBox(
        width: config.layerSize.width,
        height: config.layerSize.height,
        child: Transform(
          transform: data.transform,
          alignment: Alignment.center,
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

  List<double> getXSnapValues() {
    Size rectangleSize =
        childrenKey.currentContext!.size! * data.transform.getMaxScaleOnAxis();

    Offset center = Offset(
        data.transform.getTranslation().x, data.transform.getTranslation().y);

    double rotation = atan2(data.transform[1], data.transform[0]);

    if (rotation == 0 || rotation == pi) {
      return [
        center.dx,
        center.dx + rectangleSize.width / 2,
        center.dx - rectangleSize.width / 2,
      ];
    }
    if (rotation == pi / 2 || rotation == 3 * pi / 2) {
      return [
        center.dx,
        center.dx + rectangleSize.height / 2,
        center.dx - rectangleSize.height / 2,
      ];
    }

    return [center.dx];
  }

  List<double> getYSnapValues() {
    Size rectangleSize =
        childrenKey.currentContext!.size! * data.transform.getMaxScaleOnAxis();

    Offset center = Offset(
        data.transform.getTranslation().x, data.transform.getTranslation().y);

    double rotation = atan2(data.transform[1], data.transform[0]);
    if (rotation == 0 || rotation == pi) {
      return [
        center.dy,
        center.dy + rectangleSize.height / 2,
        center.dy - rectangleSize.height / 2,
      ];
    }
    if (rotation == pi / 2 || rotation == 3 * pi / 2) {
      return [
        center.dy,
        center.dy + rectangleSize.width / 2,
        center.dy - rectangleSize.width / 2,
      ];
    }
    return [center.dx];
  }
}

enum DraggableWidgetType { text, image, icon, custom }
