import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticker_widget/data/sticker_widget_config.dart';
import 'package:sticker_widget/draggable_widget/draggable_widget.dart';
import 'package:sticker_widget/sticker_widget.dart';
import 'package:sticker_widget/sticker_widget_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Sticker Widget',
      theme: CupertinoThemeData(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [DefaultMaterialLocalizations.delegate],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StickerWidgetController controller = StickerWidgetController(
    config: const StickerWidgetConfig(
      canvasSize: Size(1080 * 2, 1350),
      layerSize: Size(1080 * 10, 1350),
      translationXSnapValues: [-1080 * 5, 0, 1080 * 3],
      translationYSnapValues: [-1350 / 2, 0, 1350 / 2],
      translationSnapThreshold: 5,
      selectedOverlayColor: Color.fromARGB(100, 0, 122, 255),
      maxScale: 10,
      minScale: 0.01,
      defaultIconSize: 256,
    ),
  );

  int pages = 2;

  @override
  void initState() {
    final DraggableWidget firstWidget = controller.addIconWidget(
      CupertinoIcons.square_fill,
      CupertinoColors.white,
    );
    final DraggableWidget secondWidget = controller.addWidget(Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(
        border: Border.all(
          color: CupertinoColors.activeGreen,
          width: 3,
        ),
        color: Colors.transparent,
      ),
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: CupertinoColors.systemRed,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    ));

    controller.updateDraggableWidget(
        secondWidget,
        secondWidget.data.copyWith(
            transform: secondWidget.data.transform.clone()
              ..translate(-(1080 * 9) / 2, 0)));

    controller.updateDraggableWidget(
        firstWidget,
        firstWidget.data.copyWith(
            transform: firstWidget.data.transform.clone()
              ..translate(-(1080 * 9) / 2, 0)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        middle: const Text('Sticker Widget'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  pages--;
                  final Size size = Size(1080.0 * pages, 1350);
                  controller.config = controller.config.copyWith(
                    canvasSize: size,
                    translationXSnapValues: [
                      -size.width / 2,
                      0,
                      size.width / 2,
                    ],
                    translationYSnapValues: [
                      -size.height / 2,
                      0,
                      size.height / 2,
                    ],
                  );
                });
              },
              child: const Icon(CupertinoIcons.minus),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pages++;
                  final Size size = Size(1080.0 * pages, 1350);
                  controller.config = controller.config.copyWith(
                    canvasSize: size,
                    translationXSnapValues: [
                      -size.width / 2,
                      0,
                      size.width / 2,
                    ],
                    translationYSnapValues: [
                      -size.height / 2,
                      0,
                      size.height / 2,
                    ],
                  );
                });
              },
              child: const Icon(CupertinoIcons.add),
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
              stream: controller.selectedWidget,
              builder: (context, snapshot) {
                return Text(
                  "SelectedWidget: ${snapshot.data?.type}",
                  style: const TextStyle(color: CupertinoColors.activeBlue),
                );
              },
            ),
            StreamBuilder(
              stream: controller.isTransforming,
              initialData: false,
              builder: (context, snapshot) {
                return Text(
                  "IsTransforming: ${snapshot.data}",
                  style: const TextStyle(color: CupertinoColors.activeBlue),
                );
              },
            ),
            Text(
              'Pages $pages',
              style: const TextStyle(color: CupertinoColors.black),
            ),
            Expanded(
              child: Center(
                child: Container(
                  color: CupertinoColors.systemBackground,
                  child: StickerWidget(
                    controller: controller,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
