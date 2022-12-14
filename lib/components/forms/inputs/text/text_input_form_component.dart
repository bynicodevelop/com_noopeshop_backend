import "package:flutter/material.dart";

class TextInputFormComponent extends StatefulWidget {
  final TextEditingController controller;
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
  final FocusNode _focusNode = FocusNode();
  String? _textError;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
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
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        errorText: _textError,
      ),
    );
  }
}
