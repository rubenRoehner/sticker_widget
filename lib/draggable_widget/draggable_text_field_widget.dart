import 'package:flutter/material.dart';
import 'package:sticker_widget/draggable_widget/draggable_widget.dart';
import 'package:sticker_widget/utils/upper_case_text_formatter.dart';

/// A draggable text field widget that extends the [DraggableWidget] class.
class DraggableTextFieldWidget extends DraggableWidget {
  /// The controller for the text field.
  final TextEditingController textEditingController;

  /// The style of the text.
  final TextStyle textStyle;

  /// The alignment of the text.
  final TextAlign textAlign;

  /// Whether the text should be automatically converted to uppercase.
  final bool upperCase;

  /// Whether to show the text field or a simple text widget.
  final bool showTextField;

  /// Callback function to control whether to show a TextField or a Text widget.
  final void Function(bool showTextField) setShowTextField;

  /// Constructs a [DraggableTextFieldWidget].
  ///
  /// The [key], [data], [config], [textEditingController], [textStyle],
  /// [textAlign], [upperCase], [showTextField], and [setShowTextField]
  /// parameters are required.
  DraggableTextFieldWidget({
    super.key,
    required super.data,
    required super.config,
    required this.textEditingController,
    required this.textStyle,
    required this.textAlign,
    required this.upperCase,
    required this.showTextField,
    required this.setShowTextField,
  }) : super(
          type: DraggableWidgetType.text,
          child: showTextField && data.isSelected
              ? Material(
                  color: Colors.transparent,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 48),
                    child: IntrinsicWidth(
                      child: TextField(
                        controller: textEditingController,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                        style: textStyle,
                        textAlign: textAlign,
                        autofocus: true,
                        inputFormatters:
                            upperCase ? [UpperCaseTextFormatter()] : null,
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: data.isSelected
                      ? () {
                          setShowTextField(true);
                        }
                      : null,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 48),
                    child: Text(
                      upperCase
                          ? textEditingController.text.toUpperCase()
                          : textEditingController.text,
                      style: textStyle,
                      textAlign: textAlign,
                    ),
                  ),
                ),
        );
}
