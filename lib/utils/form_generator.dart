import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/config/form_mapper.dart";
import "package:flutter/material.dart";

class FormGenerator {
  final List<Map<String, dynamic>> formData;
  final Function(Map<String, dynamic>) onSubmitted;
  final Function() onError;

  final Map<String, dynamic> _controllers = {};
  final Map<String, dynamic> _errors = {};
  final List<Widget> _widgets = [];

  FormGenerator({
    required this.formData,
    required this.onSubmitted,
    required this.onError,
  });

  render() {
    for (Map<String, dynamic> data in formData) {
      TextEditingController controller = TextEditingController();

      _controllers.putIfAbsent(data["data_model"], () => controller);

      if (data["validator"] != null) {
        _errors.putIfAbsent(data["data_model"], () => true);
      }

      Widget widget = inputs[data["field_type"]]?.call(
        _controllers[data["data_model"]],
        data["label"],
        hasError: (value) => _errors[data["data_model"]] = value,
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

            // check if there are any errors
            List<String> fieldsInError = _errors.keys
                .where((element) => _errors[element] == true)
                .toList();

            if (fieldsInError.isNotEmpty) {
              onError();
              return;
            }

            for (Map<String, dynamic> data in formData) {
              dataFields.putIfAbsent(
                data["data_model"],
                () => _controllers[data["data_model"]]!.text,
              );
            }

            onSubmitted(dataFields);
          },
          child: const Text("Submit"),
        ),
      ),
    );

    return ListView(
      children: _widgets,
    );
  }
}
