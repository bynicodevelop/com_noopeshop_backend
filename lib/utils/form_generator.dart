import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/config/form_mapper.dart";
import "package:flutter/material.dart";

class FormGenerator {
  final List<Map<String, dynamic>> form;
  final Map<String, dynamic> data;
  final Function(Map<String, dynamic>) onSubmitted;
  final Function() onError;

  final Map<String, dynamic> _controllers = {};
  final Map<String, dynamic> _errors = {};
  final List<Widget> _widgets = [];

  FormGenerator({
    required this.form,
    required this.onSubmitted,
    required this.onError,
    this.data = const {},
  });

  bool _isValidForm(List<Map<String, dynamic>> formData) {
    bool isValid = true;

    for (Map<String, dynamic> field in formData) {
      if (field["validator"] != null) {
        String? error = field["validator"]?.call(
          _controllers[field["data_model"]]?.text ?? "",
        );

        if (error != null) {
          isValid = false;
        }
      }
    }

    return isValid;
  }

  render() {
    for (Map<String, dynamic> formData in form) {
      TextEditingController controller = TextEditingController(
        text: data[formData["data_model"]] ?? "",
      );

      _controllers.putIfAbsent(formData["data_model"], () => controller);

      Widget widget = inputs[formData["field_type"]]?.call(
        _controllers[formData["data_model"]],
        formData["label"],
        hasError: (value) => _errors[formData["data_model"]] = value,
      ) as Widget;

      _widgets.add(
        Padding(
          padding: const EdgeInsets.only(
            bottom: kDefaultPadding,
          ),
          child: widget,
        ),
      );
    }

    _widgets.add(
      SizedBox(
        height: 40.0,
        child: ElevatedButton(
          onPressed: () {
            Map<String, dynamic> dataFields = {};

            dataFields.putIfAbsent("uid", () => data["uid"] ?? "");

            if (!_isValidForm(form)) {
              onError();
              return;
            }

            for (Map<String, dynamic> formData in form) {
              dataFields.putIfAbsent(
                formData["data_model"],
                () => _controllers[formData["data_model"]]!.text,
              );
            }

            onSubmitted(dataFields);
          },
          child: const Text("Submit"),
        ),
      ),
    );

    return ListView(
      shrinkWrap: true,
      children: _widgets,
    );
  }
}
