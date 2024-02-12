import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sticker_widget/data/draggable_widget_config.dart';
import 'package:sticker_widget/data/draggable_widget_data.dart';
import 'package:sticker_widget/draggable_widget.dart';
import 'package:sticker_widget/sticker_widget.dart';

/// A Dart class StickerWidgetController extending ChangeNotifier,
/// used for managing a list of draggable widgets and their properties.
///
class StickerWidgetController extends ChangeNotifier {
  /// StickerWidget's configuration
  StickerWidgetConfig config;

  StickerWidgetController({this.config = const StickerWidgetConfig()});

  /// List to store draggable widgets.
  final List<DraggableWidget> _widgets = List.empty(growable: true);

  List<DraggableWidget> get widgets => _widgets;

  // Method to add a widget to the list of draggable widgets.
  void addWidget(Widget widget) {
    // Generate a unique key for the widget.
    Key key = getNewKey();

    // Create a DraggableWidget with specified properties.
    _widgets.add(
      DraggableWidget(
        key: key,
        config: config,
        data: DraggableWidgetData(
          transform: Matrix4.identity(),
          onSelect: () => _selectWidget(key),
          onDeleteButtonPressed: () => _deleteWidget(key),
          onLayerButtonPressed: () => _updateLayer(key),
          onDoneButtonPressed: () => clearAllBorders(),
          onFlipButtonPressed: () => _toggleFlip(key),
          onLockPressed: () => _toggleLock(key),
          updateScale: (scale) => _updateScale(key, scale),
          updateTransform: (transform) => _updateTransform(key, transform),
        ),
        child: widget,
      ),
    );

    // Highlight the border of the added widget.
    _selectWidget(key);
  }

  /// Method to clear the selected widget.
  void clearAllBorders() {
    _selectWidget(const Key('-1'));
  }

  /// Method to highlight the border of a specific widget.
  void _selectWidget(Key? key) {
    for (int i = 0; i < _widgets.length; i++) {
      if (_widgets[i].key == key) {
        _widgets[i] = DraggableWidget(
          key: _widgets[i].key,
          config: config,
          data: _widgets[i].data.copyWith(isSelected: true),
          child: _widgets[i].child,
        );
      } else {
        _widgets[i] = DraggableWidget(
          key: _widgets[i].key,
          config: config,
          data: _widgets[i].data.copyWith(isSelected: false),
          child: _widgets[i].child,
        );
      }
    }
    notifyListeners();
  }

  /// Method to toggle the lock of a widget.
  void _toggleLock(Key? key) {
    for (int i = 0; i < _widgets.length; i++) {
      if (_widgets[i].key == key) {
        _widgets[i] = DraggableWidget(
          key: _widgets[i].key,
          config: config,
          data: _widgets[i].data.copyWith(isLocked: !_widgets[i].data.isLocked),
          child: _widgets[i].child,
        );
      }
    }
    notifyListeners();
  }

  /// Method to flip a widget.
  void _toggleFlip(Key? key) {
    for (int i = 0; i < _widgets.length; i++) {
      if (_widgets[i].key == key) {
        _widgets[i] = DraggableWidget(
          key: _widgets[i].key,
          config: config,
          data:
              _widgets[i].data.copyWith(isFlipped: !_widgets[i].data.isFlipped),
          child: _widgets[i].child,
        );
      }
    }
    notifyListeners();
  }

  /// Method to update the scale of a widget.
  void _updateScale(Key? key, double scale) {
    for (int i = 0; i < _widgets.length; i++) {
      if (_widgets[i].key == key) {
        _widgets[i] = DraggableWidget(
          key: _widgets[i].key,
          config: config,
          data: _widgets[i].data.copyWith(scale: scale),
          child: _widgets[i].child,
        );
      }
    }
    notifyListeners();
  }

  /// Method to update the transform matrix of a widget.
  void _updateTransform(Key? key, Matrix4 transform) {
    for (int i = 0; i < _widgets.length; i++) {
      if (_widgets[i].key == key) {
        _widgets[i] = DraggableWidget(
          key: _widgets[i].key,
          config: config,
          data: _widgets[i].data.copyWith(transform: transform),
          child: _widgets[i].child,
        );
      }
    }
    notifyListeners();
  }

  /// Method to delete a widget from the list.
  void _deleteWidget(key) {
    _widgets.removeWhere((element) {
      return element.key! == key;
    });
    notifyListeners();
  }

  /// Method to change the layering of a widget.
  void _updateLayer(key) {
    DraggableWidget widget =
        _widgets.firstWhere((element) => element.key == key);
    int index = _widgets.indexOf(widget);
    if (index != 0) {
      _widgets.remove(widget);
      _widgets.insert(index - 1, widget);
      notifyListeners();
    }
  }

  // Method to save the widget layout as a Uint8List image.
  Future<Uint8List?> saveAsUint8List() async {
    // Clear all borders before capturing the image.
    clearAllBorders();
    try {
      Uint8List? pngBytes;
      double pixelRatio = 2;
      await Future.delayed(const Duration(milliseconds: 700))
          .then((value) async {
        // Capture the image of the widget.
        RenderRepaintBoundary boundary = StickerWidget.globalKey.currentContext
            ?.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        pngBytes = byteData?.buffer.asUint8List();
      });
      return pngBytes;
    } catch (e) {
      rethrow;
    }
  }

  /// Helper function to generate a new Key.
  Key getNewKey() {
    Random rnd = Random();
    int min = 1;
    int max = 100000;
    int nrRnd = min + rnd.nextInt(max - min);
    return Key('draggable-${DateTime.now().millisecondsSinceEpoch}-$nrRnd');
  }
}
