import 'package:flutter/material.dart';
import 'package:sticker_widget/draggable_widget.dart';

class DraggableTextFieldWidget extends DraggableWidget {
  final TextEditingController textEditingController;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final bool showTextField;
  final void Function(bool showTextField) setShowTextField;

  DraggableTextFieldWidget({
    super.key,
    required super.data,
    required super.config,
    required this.textEditingController,
    required this.textStyle,
    required this.textAlign,
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
                      textEditingController.text,
                      style: textStyle,
                      textAlign: textAlign,
                    ),
                  ),
                ),
        );
}
