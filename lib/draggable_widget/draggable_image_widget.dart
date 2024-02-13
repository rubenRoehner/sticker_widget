import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sticker_widget/draggable_widget.dart';

class DraggableImageWidget extends DraggableWidget {
  final String path;

  DraggableImageWidget({
    super.key,
    required super.data,
    required super.config,
    required this.path,
  }) : super(
          type: DraggableWidgetType.image,
          child: Image.file(File(path)),
        );
}
