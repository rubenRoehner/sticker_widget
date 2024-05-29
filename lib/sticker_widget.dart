library sticker_widget;

import 'package:flutter/cupertino.dart';
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

  /// The padding around the sticker's content.
  ///
  final EdgeInsets contentPadding;

  /// The minimum scale value for the sticker.
  ///
  final double minScale;

  /// The maximum scale value for the sticker.
  ///
  final double maxScale;

  /// The [topLayer] widget to be displayed on top of the sticker. Can bes used to display guidelines or other widgets.
  ///
  final Widget? topLayer;

  /// Constructor to initialize the widget with a controller and a child widget.
  ///
  const StickerWidget({
    super.key,
    required this.controller,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 48, vertical: 180),
    this.minScale = 0.4,
    this.maxScale = 2.5,
    required this.child,
    this.topLayer,
  });

  @override
  Widget build(BuildContext context) {
    // A RepaintBoundary widget used to isolate and capture the sticker and its contents as an image.
    return StreamBuilder<bool>(
        stream: controller.selectedWidget.map((event) => event != null),
        builder: (context, snapshot) {
          return InteractiveViewer(
            constrained: false,
            boundaryMargin: contentPadding,
            transformationController: controller.canvasTransformationController,
            minScale: minScale,
            maxScale: maxScale,
            child: SizedBox(
              height: controller.config.canvasSize.height,
              width: controller.config.canvasSize.width,
              child: RepaintBoundary(
                key: globalKey,
                child: ClipRect(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.clearAllBorders();
                        },
                        child: child,
                      ),
                      StreamBuilder(
                        stream: controller.widgets,
                        initialData: controller.getCurrentWidgets,
                        builder: (context, widgets) {
                          return Stack(
                            children: widgets.data
                                    ?.map(
                                      (widget) => Positioned(
                                        top: 0,
                                        left: 0,
                                        child: widget,
                                      ),
                                    )
                                    .toList() ??
                                List.empty(),
                          );
                        },
                      ),
                      if (topLayer != null) topLayer!,
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
