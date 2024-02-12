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
    return MaterialApp(
      title: 'Sticker Widget',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StickerWidgetController controller;

  List<Widget> widgets = [
    SizedBox(
        height: 100,
        width: 100,
        child: Image.network('https://picsum.photos/200/200')),
    const Icon(Icons.favorite, color: Colors.red, size: 50)
  ];

  @override
  void initState() {
    controller = StickerWidgetController();
    for (var element in widgets) {
      controller.addWidget(element);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sticker Widget'),
      ),
      body: StickerWidget(
        controller: controller,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child:
              Image.network('https://picsum.photos/200/300', fit: BoxFit.cover),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controller.addWidget(
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Text(
                'This is a Text',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
