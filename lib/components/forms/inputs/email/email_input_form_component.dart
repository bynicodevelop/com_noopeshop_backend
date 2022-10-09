import "package:flutter/material.dart";
import "package:validators/validators.dart";

class EmailInputFormComponent extends StatefulWidget {
  final ValueNotifier<String> controller;
  final String? Function(String)? validator;
  final Function(bool)? hasError;
  final String label;

  const EmailInputFormComponent({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.hasError,
  });

  @override
  State<EmailInputFormComponent> createState() =>
      _EmailInputFormComponentState();
}

class _EmailInputFormComponentState extends State<EmailInputFormComponent> {
  final TextEditingController _textEditingController = TextEditingController();
  late String? Function(String) _validator;
  final FocusNode _focusNode = FocusNode();
  String? _errorText;

  @override
  void initState() {
    super.initState();

    _textEditingController.text = widget.controller.value;

    _validator = widget.validator ??
        (String value) {
          if (value.isEmpty) {
            return "required";
          }

          if (!isEmail(value)) {
            return "invalid email";
          }

          return null;
        };

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.controller.value = _textEditingController.text;

        setState(() {
          _errorText = _validator(widget.controller.value);
        });

        if (widget.hasError != null) {
          widget.hasError!(_errorText != null);
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
        errorText: _errorText,
      ),
    );
  }
}
