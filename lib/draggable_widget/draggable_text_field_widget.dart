import 'package:flutter/material.dart';
import 'package:sticker_widget/draggable_widget.dart';

class DraggableTextFieldWidget extends DraggableWidget {
  final TextEditingController textEditingController;
  final TextStyle textStyle;
  final TextAlign textAlign;

  DraggableTextFieldWidget(
      {super.key,
      required super.data,
      required super.config,
      required this.textEditingController,
      required this.textStyle,
      required this.textAlign})
      : super(
          type: DraggableWidgetType.text,
          child: data.isSelected
              ? Material(
                  textStyle: textStyle,
                  color: Colors.transparent,
                  child: Theme(
                    data: ThemeData(splashColor: Colors.transparent),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 48),
                      child: IntrinsicWidth(
                        child: TextField(
                          controller: textEditingController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: textStyle,
                          textAlign: textAlign,
                          onSubmitted: (value) {},
                        ),
                      ),
                    ),
                  ),
                )
              : Text(
                  textEditingController.text,
                  style: textStyle,
                  textAlign: textAlign,
                ),
        );
}
