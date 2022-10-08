import "package:validators/validators.dart";

Map<String, dynamic> userForm = {
  "collection": "users",
  "form": [
    {
      "field_name": "display_name",
      "data_model": "displayName",
      "label": "Display Name *",
      "field_type": "text_input",
      "validator": (String value) => value.isEmpty ? "required" : null,
    },
    {
      "field_name": "email",
      "data_model": "email",
      "label": "E-mail *",
      "field_type": "email_input",
      "validator": (String value) {
        if (value.isEmpty) {
          return "required";
        }

        if (!isEmail(value)) {
          return "invalid email";
        }

        return null;
      },
    }
  ]
};
