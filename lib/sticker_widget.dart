library sticker_widget;

import 'package:flutter/material.dart';
import 'package:sticker_widget/sticker_widget_controller.dart';

/// A Flutter widget class StickerWidget, which is used to display draggable stickers.
///
class StickerWidget extends StatelessWidget {
  /// A global key used to access this widget's state from outside.
  ///
  static GlobalKey globalKey = GlobalKey();

  /// The controller responsible for managing stickers and their behavior.
  ///
  final StickerWidgetController controller;

  /// The [child] widget (the main content) to be displayed on the sticker.
  ///
  final Widget child;

  /// Constructor to initialize the widget with a controller and a child widget.
  ///
  const StickerWidget(
      {super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    // A RepaintBoundary widget used to isolate and capture the sticker and its contents as an image.
    return RepaintBoundary(
      key: globalKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // The main child widget (content) displayed on the sticker.
          GestureDetector(
            onTap: () => controller.clearAllBorders(),
            child: child,
          ),
          // A positioned.fill Stack to overlay draggable widgets on top of the main content.
          StreamBuilder(
            stream: controller.widgets,
            initialData: controller.getCurrentWidgets,
            builder: (context, widgets) {
              return Positioned.fill(
                child: Stack(
                  children: widgets.data ?? List.empty(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
