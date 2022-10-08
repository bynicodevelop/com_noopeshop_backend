import "package:com_noopeshop_backend/screens/commons/details_screen.dart";
import "package:com_noopeshop_backend/screens/commons/list_screen.dart";
import "package:flutter/material.dart";

class CommonScreen extends StatefulWidget {
  final Map<String, dynamic> form;

  const CommonScreen({
    super.key,
    required this.form,
  });

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.form.isEmpty) {
      return const Center(
        child: Text("Configuration form not found"),
      );
    }

    return PageView(
      children: [
        CommonListScreen(
          form: widget.form,
        ),
        CommonDetailsScreen(
          form: widget.form,
        )
      ],
    );
  }
}
