import "package:com_noopeshop_backend/components/forms/inputs/email/email_input_form_component.dart";
import "package:com_noopeshop_backend/components/forms/inputs/text/text_input_form_component.dart";
import "package:com_noopeshop_backend/components/forms/inputs/upload/upload_input_form_component.dart";
import "package:flutter/material.dart";

// ignore: depend_on_referenced_packages

Map<String, dynamic> inputs = {
  "text_input": (
    ValueNotifier<String> controller,
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
    ValueNotifier<String> controller,
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
    ValueNotifier<List<dynamic>> data,
    String label, {
    String? Function(String)? validator,
    Function(bool)? hasError,
  }) =>
      UploadInputFormComponent(
        data: data,
        label: label,
        // validator:
        //     validator ?? (String value) => value.isEmpty ? "required" : null,
        // hasError: hasError,
      ),
};
