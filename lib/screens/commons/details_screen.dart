import "package:flutter/material.dart";

class CommonDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> form;
  final Map<String, dynamic> data;

  const CommonDetailsScreen({
    super.key,
    required this.form,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
    );
  }
}
