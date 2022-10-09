import "package:validators/validators.dart";

// ignore: depend_on_referenced_packages
import "package:cross_file/cross_file.dart";

Map<String, dynamic> userForm = {
  "collection": "users",
  "form": [
    {
      "field_name": "display_name",
      "data_model": "displayName",
      "label": "Display Name *",
      "data_type": "string",
      "field_type": "text_input",
      "pretreatment": ["trim", "toLowerCase"],
      "validator": (String value) => value.isEmpty ? "required" : null,
    },
    {
      "field_name": "email",
      "data_model": "email",
      "label": "E-mail *",
      "data_type": "string",
      "pretreatment": ["trim", "toLowerCase"],
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
    },
    {
      "field_name": "photoURL",
      "data_model": "photoURL",
      "data_type": "files",
      "label": "Avatar",
      "field_type": "upload_input",
      "pretreatment": ["uploadPhotoUrl"],
      "validator": (List<XFile> value) => null,
    }
  ],
  "table": [
    {
      "field_name": "uid",
      "data_model": "uid",
      "label": "#",
      "formatter": (String value) => value.substring(0, 6),
    },
    {
      "field_name": "display_name",
      "data_model": "displayName",
      "label": "Display Name",
    },
    {
      "field_name": "email",
      "data_model": "email",
      "label": "E-mail",
    },
    {
      "field_name": "actions",
      "data_model": "actions",
      "label": "Actions",
    },
  ],
};
