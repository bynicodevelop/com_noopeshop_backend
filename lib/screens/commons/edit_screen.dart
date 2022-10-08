import "package:flutter/material.dart";

class CommonEditScreen extends StatelessWidget {
  final Map<String, dynamic> form;
  final Map<String, dynamic> data;

  const CommonEditScreen({
    super.key,
    required this.form,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Container(),
    );
  }
}
