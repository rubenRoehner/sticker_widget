import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticker_widget/data/sticker_widget_config.dart';
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
      canvasSize: Size(500, 300),
      translationSnapThreshold: 1.5,
      selectedOverlayColor: Color.fromARGB(100, 0, 122, 255),
    ),
  );

  @override
  void initState() {
    controller.addIconWidget(
      CupertinoIcons.square_fill,
      CupertinoColors.white,
    );
    controller.addWidget(Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: CupertinoColors.activeGreen,
          width: 3,
        ),
        color: Colors.transparent,
      ),
      child: Center(
        child: Container(
          width: 5,
          height: 5,
          decoration: const BoxDecoration(
            color: CupertinoColors.systemRed,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        middle: const Text('Sticker Widget'),
        trailing: GestureDetector(
          onTap: () {
            controller.addTextWidget();
          },
          child: const Icon(CupertinoIcons.add),
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
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
