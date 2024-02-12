import 'package:flutter/cupertino.dart';
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

    controller.addWidget(
      const Icon(
        CupertinoIcons.smiley_fill,
        color: CupertinoColors.black,
        size: 48,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        middle: const Text('Sticker Widget'),
        trailing: GestureDetector(
          onTap: () {
            controller.addWidget(
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: CupertinoColors.activeBlue,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Text(
                  'This is a Text',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
            );
          },
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      child: StickerWidget(
        controller: controller,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.network('https://picsum.photos/400/800?blur',
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
