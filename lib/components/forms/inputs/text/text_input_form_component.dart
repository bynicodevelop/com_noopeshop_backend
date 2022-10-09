import "package:flutter/material.dart";

class TextInputFormComponent extends StatefulWidget {
  final ValueNotifier<String> controller;
  final Function(bool)? hasError;
  final String? Function(String)? validator;
  final String label;

  const TextInputFormComponent({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.hasError,
  });

  @override
  State<TextInputFormComponent> createState() => _TextInputFormComponentState();
}

class _TextInputFormComponentState extends State<TextInputFormComponent> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? _textError;

  @override
  void initState() {
    super.initState();

    _textEditingController.text = widget.controller.value;

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.controller.value = _textEditingController.text;

        if (widget.validator == null) return;

        setState(() {
          _textError = widget.validator!(widget.controller.value);
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
    );
  }
}
