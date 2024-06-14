import 'package:flutter/material.dart';
import 'package:sticker_widget/draggable_widget/draggable_widget.dart';

/// A draggable text field widget that extends the [DraggableWidget] class.
class DraggableTextWidget extends DraggableWidget {
  /// The [text] parameter is used to specify the text to be displayed.
  final String text;

  /// The style of the text.
  final TextStyle textStyle;

  /// The alignment of the text.
  final TextAlign textAlign;

  /// Whether the text should be automatically converted to uppercase.
  final bool upperCase;

  /// Callback function to control whether to show a TextField or a Text widget.
  final void Function(bool showTextField) setShowTextField;

  /// The width of the draggable text widget.
  final double width;

  /// Constructs a [DraggableTextWidget].
  ///
  /// The [key], [data], [config], [text], [width], [textStyle],
  /// [textAlign], [upperCase], and [setShowTextField]
  /// parameters are required.
  DraggableTextWidget({
    super.key,
    required super.data,
    required super.config,
    required this.text,
    required this.textStyle,
    required this.textAlign,
    required this.upperCase,
    required this.setShowTextField,
    required this.width,
  }) : super(
          type: DraggableWidgetType.text,
          child: GestureDetector(
            onTap: data.isSelected
                ? () {
                    setShowTextField(true);
                  }
                : null,
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: width),
              child: Text(
                upperCase ? text.toUpperCase() : text,
                style: textStyle,
                textAlign: textAlign,
              ),
            ),
          ),
          canScale: false,
        );
}
