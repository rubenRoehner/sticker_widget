import 'package:flutter/material.dart';

/// A widget that represents an action within a draggable widget.
class DraggableWidgetAction extends StatelessWidget {
  /// Creates a [DraggableWidgetAction].
  ///
  /// The [icon] parameter specifies the icon to be displayed.
  /// The [scale] parameter specifies the scale factor for the widget.
  /// The [borderColor] parameter specifies the color of the border.
  /// The [iconColor] parameter specifies the color of the icon.
  /// The [onTap] parameter specifies the callback function when the widget is tapped.
  /// The [left] parameter specifies the left position of the widget.
  /// The [right] parameter specifies the right position of the widget.
  /// The [bottom] parameter specifies the bottom position of the widget.
  /// The [top] parameter specifies the top position of the widget.
  const DraggableWidgetAction({
    super.key,
    required this.icon,
    required this.scale,
    this.onTap,
    this.left,
    this.right,
    this.bottom,
    this.top,
    required this.borderColor,
    required this.iconColor,
  });

  /// The icon to be displayed.
  final IconData icon;

  /// The scale factor for the widget.
  final double scale;

  /// The color of the border.
  final Color borderColor;

  /// The color of the icon.
  final Color iconColor;

  /// The callback function when the widget is tapped.
  final void Function()? onTap;

  /// The left position of the widget.
  final double? left;

  /// The right position of the widget.
  final double? right;

  /// The bottom position of the widget.
  final double? bottom;

  /// The top position of the widget.
  final double? top;

  /// The default radius of the draggable widget action's circle.
  static const double defaultCircleRadius = 12;

  /// The default size of the draggable widget actions' icon.
  static const double defaultIconSize = 12;

  @override
  Widget build(BuildContext context) {
    double circleSize = defaultCircleRadius / scale;
    double iconSize = defaultIconSize / scale;
    return Positioned(
      left: left,
      right: right,
      bottom: bottom,
      top: top,
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: circleSize,
          backgroundColor: borderColor,
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
