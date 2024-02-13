import 'package:flutter/material.dart';
import 'package:sticker_widget/draggable_widget.dart';

class DraggableIconWidget extends DraggableWidget {
  final IconData icon;
  final Color color;

  DraggableIconWidget({
    super.key,
    required super.data,
    required super.config,
    required this.icon,
    required this.color,
  }) : super(
          type: DraggableWidgetType.icon,
          child: Icon(
            icon,
            color: color,
          ),
        );
}
