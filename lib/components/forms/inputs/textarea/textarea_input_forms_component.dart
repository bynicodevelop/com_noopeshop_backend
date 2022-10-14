import "package:flutter/material.dart";

class TextareaInputFormComponent extends StatefulWidget {
  final TextEditingController controller;
  final Function(bool)? hasError;
  final String? Function(String)? validator;
  final String label;

  const TextareaInputFormComponent({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.hasError,
  });

  @override
  State<TextareaInputFormComponent> createState() =>
      _TextareaInputFormComponentState();
}

class _TextareaInputFormComponentState
    extends State<TextareaInputFormComponent> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? _textError;

  @override
  void initState() {
    super.initState();

    _textEditingController.text = widget.controller.text;

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.controller.text = _textEditingController.text;

        if (widget.validator == null) return;

        setState(() {
          _textError = widget.validator!(widget.controller.text);
        });

        if (widget.hasError != null) {
          widget.hasError!(_textError != null);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _textEditingController,
      decoration: InputDecoration(
        labelText: widget.label,
        errorText: _textError,
      ),
      maxLines: null,
    );
  }
}
