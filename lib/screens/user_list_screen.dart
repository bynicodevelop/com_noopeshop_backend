import "package:flutter/material.dart";

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add User"),
            ),
          ],
        ),
        ListView(
          shrinkWrap: true,
          children: const [],
        )
      ],
    );
  }
}
