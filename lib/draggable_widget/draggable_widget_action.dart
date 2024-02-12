import 'package:flutter/material.dart';

class DraggableWidgetAction extends StatelessWidget {
  const DraggableWidgetAction(
      {super.key,
      required this.icon,
      required this.scale,
      this.onTap,
      this.left,
      this.right,
      this.bottom,
      this.top,
      required this.borderColor,
      required this.iconColor});
  final IconData icon;
  final double scale;
  final Color borderColor;
  final Color iconColor;
  final void Function()? onTap;
  final double? left;
  final double? right;
  final double? bottom;
  final double? top;

  static const double _defaultCircleSize = 24;
  static const double _defaultIconSize = 12;

  @override
  Widget build(BuildContext context) {
    double circleSize = _defaultCircleSize / scale;
    double iconSize = _defaultIconSize / scale;
    return Positioned(
      left: left,
      right: right,
      bottom: bottom,
      top: top,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: circleSize,
          height: circleSize,
          child: CircleAvatar(
            backgroundColor: borderColor,
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
