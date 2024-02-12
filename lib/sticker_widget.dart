library sticker_widget;

import 'package:flutter/material.dart';
import 'package:sticker_widget/sticker_widget_controller.dart';

/// A Flutter widget class StickerWidget, which is used to display draggable stickers.
///
class StickerWidget extends StatefulWidget {
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
  State<StatefulWidget> createState() => _StickerWidgetState();
}

class _StickerWidgetState extends State<StickerWidget> {
  @override
  void initState() {
    // Add a listener to the controller to update the widget when the controller changes.
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // A RepaintBoundary widget used to isolate and capture the sticker and its contents as an image.
    return RepaintBoundary(
      key: StickerWidget.globalKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // The main child widget (content) displayed on the sticker.
          GestureDetector(
            onTap: () => widget.controller.clearAllBorders(),
            child: widget.child,
          ),
          // A positioned.fill Stack to overlay draggable widgets on top of the main content.
          Positioned.fill(
            child: Stack(
              children: widget.controller.widgets,
            ),
          )
        ],
      ),
    );
  }
}
