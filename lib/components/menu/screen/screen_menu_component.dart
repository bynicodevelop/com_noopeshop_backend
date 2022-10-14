import "package:flutter/material.dart";

class ScreenMenuComponent extends StatelessWidget {
  final List<ElevatedButton> actions;

  const ScreenMenuComponent({
    super.key,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        ...actions,
      ],
    );
  }
}