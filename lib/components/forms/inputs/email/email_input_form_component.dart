import "package:flutter/material.dart";
import "package:validators/validators.dart";

class EmailInputFormComponent extends StatefulWidget {
  final TextEditingController controller;
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
  late String? Function(String) _validator;
  final FocusNode _focusNode = FocusNode();
  String? _errorText;

  @override
  void initState() {
    super.initState();

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
        setState(() {
          _errorText = _validator(widget.controller.text);
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
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        errorText: _errorText,
      ),
    );
  }
}
