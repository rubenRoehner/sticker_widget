import 'package:flutter/material.dart';
import 'package:sticker_widget/draggable_widget/draggable_widget.dart';

/// A widget that represents an icon that can be dragged.
class DraggableIconWidget extends DraggableWidget {
  final IconData icon;
  final Color color;

  /// Creates a [DraggableIconWidget].
  ///
  /// The [icon] parameter specifies the icon to be displayed.
  /// The [color] parameter specifies the color of the icon.
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
