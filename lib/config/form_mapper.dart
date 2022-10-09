import "package:com_noopeshop_backend/components/forms/inputs/email/email_input_form_component.dart";
import "package:com_noopeshop_backend/components/forms/inputs/text/text_input_form_component.dart";
import "package:com_noopeshop_backend/components/forms/inputs/upload/upload_input_form_component.dart";
import "package:flutter/material.dart";

Map<String, dynamic> inputs = {
  "text_input": (
    TextEditingController controller,
    String label, {
    String? Function(String)? validator,
    Function(bool)? hasError,
  }) =>
      TextInputFormComponent(
        controller: controller,
        label: label,
        validator:
            validator ?? (String value) => value.isEmpty ? "required" : null,
        hasError: hasError,
      ),
  "email_input": (
    TextEditingController controller,
    String label, {
    String? Function(String)? validator,
    Function(bool)? hasError,
  }) =>
      EmailInputFormComponent(
        controller: controller,
        label: label,
        validator: validator,
        hasError: hasError,
      ),
  "upload_input": (
    TextEditingController controller,
    String label, {
    String? Function(String)? validator,
    Function(bool)? hasError,
  }) =>
      UploadInputFormComponent(
        controller: controller,
        label: label,
        // validator:
        //     validator ?? (String value) => value.isEmpty ? "required" : null,
        // hasError: hasError,
      ),
};
