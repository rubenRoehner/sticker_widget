import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final StickerWidgetController controller = StickerWidgetController();

  @override
  void initState() {
    controller.addWidget(
      Image.network(
        'https://picsum.photos/200',
        width: 200,
        height: 200,
      ),
    );

    controller.addIconWidget(
      CupertinoIcons.square_fill,
      CupertinoColors.black,
    );

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
            Expanded(
              child: StickerWidget(
                controller: controller,
                width: MediaQuery.of(context).size.width * 3,
                height: MediaQuery.of(context).size.height,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network('https://picsum.photos/800/800?blur',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            CupertinoButton.filled(onPressed: () {}, child: const Text("Test"))
          ],
        ),
      ),
    );
  }
}
