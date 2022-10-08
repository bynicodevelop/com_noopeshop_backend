import "package:flutter/material.dart";

class CommonDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> form;

  const CommonDetailsScreen({
    super.key,
    required this.form,
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
