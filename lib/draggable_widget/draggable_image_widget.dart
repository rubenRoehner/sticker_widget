import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sticker_widget/draggable_widget/draggable_widget.dart';

/// A widget that represents an image that can be dragged within a draggable area.
class DraggableImageWidget extends DraggableWidget {
  final String path;
  final Size imageSize;

  /// Creates a [DraggableImageWidget].
  ///
  /// The [path] parameter specifies the path to the image file.
  DraggableImageWidget({
    super.key,
    required super.data,
    required super.config,
    required this.path,
    required this.imageSize,
  }) : super(
          type: DraggableWidgetType.image,
          child: SizedBox(
            width: imageSize.width,
            height: imageSize.height,
            child: Image.file(File(path)),
          ),
        );
}
