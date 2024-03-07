import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sticker_widget/data/sticker_widget_config.dart';
import 'package:sticker_widget/data/draggable_widget_data.dart';
import 'package:sticker_widget/draggable_widget.dart';
import 'package:sticker_widget/draggable_widget/draggable_icon_widget.dart';
import 'package:sticker_widget/draggable_widget/draggable_image_widget.dart';
import 'package:sticker_widget/draggable_widget/draggable_text_field_widget.dart';
import 'package:sticker_widget/sticker_widget.dart';

/// A Dart class StickerWidgetController used for managing a list of draggable widgets and their properties.
class StickerWidgetController {
  /// StickerWidget's configuration
  StickerWidgetConfig config;

  StickerWidgetController({this.config = const StickerWidgetConfig()});

  /// List to store draggable widgets.
  final Map<Key, DraggableWidget> _widgets = {};

  /// StreamController for List of DraggableWidget's.
  final StreamController<List<DraggableWidget>> _widgetsStreamController =
      StreamController.broadcast();

  /// StreamController to keep track of selected DraggableWidget.
  final StreamController<Key?> _selectedWidgetStreamController =
      StreamController.broadcast();

  /// StreamController to keep track of selected DraggableWidget.
  final StreamController<bool> _isTransformingStreamController =
      StreamController.broadcast();

  /// Returns stream of DraggableWidget's.
  Stream<bool> get isTransforming => _isTransformingStreamController.stream;

  /// Returns stream of DraggableWidget's.
  Stream<List<DraggableWidget>> get widgets => _widgetsStreamController.stream;

  /// Returns current DraggableWidget's.
  List<DraggableWidget> get getCurrentWidgets => _widgets.values
      .toList()
      .sorted((a, b) => a.data.layerIndex.compareTo(b.data.layerIndex));

  /// Returns stream of selected DraggableWidget.
  Stream<DraggableWidget?> get selectedWidget => Rx.combineLatest2(
        _widgetsStreamController.stream,
        _selectedWidgetStreamController.stream,
        (list, key) => list.firstWhereOrNull((element) => element.key == key),
      );

  ///  Method to add a custom widget to the list of draggable widgets.
  void addWidget(Widget widget) {
    // Generate a unique key for the widget.
    Key key = _getNewKey();
    DraggableWidgetData data = _getNewDraggableWidgetData(key);

    // Create a DraggableWidget with specified properties.
    _widgets[key] = DraggableWidget(
      key: key,
      type: DraggableWidgetType.custom,
      config: config,
      data: data,
      child: widget,
    );

    // Highlight the border of the added widget.
    _selectWidget(key);
  }

  /// Method to add a TextField to the list of draggable widgets.
  void addTextWidget(
      {TextStyle textStyle = const TextStyle(),
      TextAlign textAlign = TextAlign.center,
      bool upperCase = false}) {
    // Generate a unique key for the widget.
    Key key = _getNewKey();
    DraggableWidgetData data = _getNewDraggableWidgetData(key);

    // Create a DraggableWidget with specified properties.
    _widgets[key] = DraggableTextFieldWidget(
      key: key,
      config: config,
      data: data,
      textEditingController: TextEditingController(text: "Moments"),
      textAlign: textAlign,
      textStyle: textStyle,
      upperCase: upperCase,
      showTextField: false,
      setShowTextField: (showTextField) =>
          _setShowTextField(key, showTextField),
    );

    // Highlight the border of the added widget.
    _selectWidget(key);
  }

  /// Method to update an existing TextField.
  void updateTextWidget(DraggableTextFieldWidget textFieldWidget) {
    _widgets[textFieldWidget.key!] = textFieldWidget;
    _widgetsStreamController.add(getCurrentWidgets);
  }

  /// Method to add an Image to the list of draggable widgets.
  void addImageWidget(String filePath) {
    // Generate a unique key for the widget.
    Key key = _getNewKey();
    DraggableWidgetData data = _getNewDraggableWidgetData(key);

    // Create a DraggableWidget with specified properties.
    _widgets[key] = DraggableImageWidget(
      key: key,
      config: config,
      data: data,
      path: filePath,
    );

    // Highlight the border of the added widget.
    _selectWidget(key);
  }

  /// Method to update an existing DraggableImage.
  void updateImageWidget(DraggableImageWidget imageWidget) {
    _widgets[imageWidget.key!] = imageWidget;
    _widgetsStreamController.add(getCurrentWidgets);
  }

  /// Method to add an Icon to the list of draggable widgets.
  void addIconWidget(IconData icon, Color color) {
    // Generate a unique key for the widget.
    Key key = _getNewKey();
    DraggableWidgetData data = _getNewDraggableWidgetData(key);

    // Create a DraggableWidget with specified properties.
    _widgets[key] = DraggableIconWidget(
      key: key,
      config: config,
      data: data,
      icon: icon,
      color: color,
    );

    // Highlight the border of the added widget.
    _selectWidget(key);
  }

  /// Method to update an existing Image.
  void updateIconWidget(DraggableIconWidget iconWidget) {
    _widgets[iconWidget.key!] = iconWidget;
    _widgetsStreamController.add(getCurrentWidgets);
  }

  /// Method to clear the selected widget.
  void clearAllBorders() {
    _selectWidget(null);
  }

  /// Method to highlight the border of a specific widget.
  void _selectWidget(Key? selectKey) {
    _widgets.forEach((key, value) {
      if (key == selectKey) {
        updateDraggableWidget(
          _widgets[key]!,
          _widgets[key]!.data.copyWith(isSelected: true),
        );
      } else {
        updateDraggableWidget(
          _widgets[key]!,
          _widgets[key]!.data.copyWith(isSelected: false),
        );
        if (_widgets[key] is DraggableTextFieldWidget &&
            (_widgets[key] as DraggableTextFieldWidget).showTextField) {
          _setShowTextField(key, false);
        }
      }
    });
    _widgetsStreamController.add(getCurrentWidgets);
    _selectedWidgetStreamController.add(selectKey);
  }

  /// Method to toggle the lock of a widget.
  void _toggleLock(Key key) {
    if (_widgets.containsKey(key)) {
      updateDraggableWidget(
        _widgets[key]!,
        _widgets[key]!.data.copyWith(
              isLocked: !_widgets[key]!.data.isLocked,
            ),
      );
    }
    _widgetsStreamController.add(getCurrentWidgets);
  }

  /// Method to flip a widget.
  void _toggleFlip(Key key) {
    if (_widgets.containsKey(key)) {
      updateDraggableWidget(
        _widgets[key]!,
        _widgets[key]!.data.copyWith(
              isFlipped: !_widgets[key]!.data.isFlipped,
            ),
      );
    }
    _widgetsStreamController.add(getCurrentWidgets);
  }

  /// Method to update the scale of a widget.
  void _updateScale(Key key, double scale) {
    if (_widgets.containsKey(key)) {
      updateDraggableWidget(
          _widgets[key]!, _widgets[key]!.data.copyWith(scale: scale));
    }
    _widgetsStreamController.add(getCurrentWidgets);
  }

  /// Method to update the transform matrix of a widget.
  void _updateTransform(Key key, Matrix4 transform) {
    if (_widgets.containsKey(key)) {
      updateDraggableWidget(
          _widgets[key]!, _widgets[key]!.data.copyWith(transform: transform));
    }
    _widgetsStreamController.add(getCurrentWidgets);
  }

  /// Method to change the layering of a widget.
  void _updateLayer(Key key) {
    DraggableWidget widget = _widgets[key]!;
    int index = widget.data.layerIndex;
    if (index != 0) {
      DraggableWidget other = _widgets.values
          .firstWhere((element) => element.data.layerIndex == index - 1);
      updateDraggableWidget(
          widget, widget.data.copyWith(layerIndex: index - 1));
      updateDraggableWidget(other, other.data.copyWith(layerIndex: index));
    }
    _widgetsStreamController.add(getCurrentWidgets);
  }

  /// Method to update the transform matrix of a widget.
  void _setShowTextField(Key key, bool showTextField) {
    if (_widgets.containsKey(key) &&
        _widgets[key] is DraggableTextFieldWidget) {
      DraggableTextFieldWidget textFieldWidget =
          _widgets[key] as DraggableTextFieldWidget;

      _widgets[key] = DraggableTextFieldWidget(
        key: key,
        data: textFieldWidget.data,
        config: config,
        textEditingController: textFieldWidget.textEditingController,
        textStyle: textFieldWidget.textStyle,
        textAlign: textFieldWidget.textAlign,
        upperCase: textFieldWidget.upperCase,
        showTextField: showTextField,
        setShowTextField: textFieldWidget.setShowTextField,
      );
    }
    _widgetsStreamController.add(getCurrentWidgets);
  }

  /// Method to update the draggable widget.
  void updateDraggableWidget(DraggableWidget widget, DraggableWidgetData data) {
    switch (widget.type) {
      case DraggableWidgetType.text:
        DraggableTextFieldWidget textFieldWidget =
            widget as DraggableTextFieldWidget;
        _widgets[textFieldWidget.key!] = DraggableTextFieldWidget(
          key: textFieldWidget.key,
          data: data,
          config: config,
          textEditingController: textFieldWidget.textEditingController,
          textStyle: textFieldWidget.textStyle,
          textAlign: textFieldWidget.textAlign,
          upperCase: textFieldWidget.upperCase,
          showTextField: textFieldWidget.showTextField,
          setShowTextField: textFieldWidget.setShowTextField,
        );
        break;
      case DraggableWidgetType.image:
        DraggableImageWidget imageWidget = widget as DraggableImageWidget;
        _widgets[imageWidget.key!] = DraggableImageWidget(
          key: imageWidget.key,
          data: data,
          config: config,
          path: imageWidget.path,
        );
        break;
      case DraggableWidgetType.icon:
        DraggableIconWidget iconWidget = widget as DraggableIconWidget;
        _widgets[iconWidget.key!] = DraggableIconWidget(
          key: iconWidget.key,
          data: data,
          config: config,
          icon: iconWidget.icon,
          color: iconWidget.color,
        );
        break;
      case DraggableWidgetType.custom:
        _widgets[widget.key!] = DraggableWidget(
          type: widget.type,
          key: widget.key,
          data: data,
          config: config,
          child: widget.child,
        );
        break;
    }
  }

  /// Method to delete a widget from the list.
  void deleteWidget(Key key) {
    _widgets.remove(key);
    for (var (index, element) in getCurrentWidgets.indexed) {
      updateDraggableWidget(element, element.data.copyWith(layerIndex: index));
    }
    _widgetsStreamController.add(getCurrentWidgets);
  }

  /// Method to save the widget layout as a Uint8List image.
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

  /// Helper function to create new DraggableWidgetData
  DraggableWidgetData _getNewDraggableWidgetData(Key key) {
    return DraggableWidgetData(
      transform: Matrix4.identity(),
      onSelect: () => _selectWidget(key),
      onDeleteButtonPressed: () => deleteWidget(key),
      onLayerButtonPressed: () => _updateLayer(key),
      onDoneButtonPressed: () => clearAllBorders(),
      onFlipButtonPressed: () => _toggleFlip(key),
      onLockPressed: () => _toggleLock(key),
      updateScale: (scale) => _updateScale(key, scale),
      updateTransform: (transform) => _updateTransform(key, transform),
      layerIndex: _widgets.length,
      startTransform: () => _isTransformingStreamController.add(true),
      endTransform: () => _isTransformingStreamController.add(false),
    );
  }

  /// Helper function to generate a new Key.
  Key _getNewKey() {
    Random rnd = Random();
    int min = 1;
    int max = 100000;
    int nrRnd = min + rnd.nextInt(max - min);
    return Key('draggable-${DateTime.now().millisecondsSinceEpoch}-$nrRnd');
  }
}
