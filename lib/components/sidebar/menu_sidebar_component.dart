import "package:flutter/material.dart";

class MenuSidebasComponent extends StatelessWidget {
  const MenuSidebasComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          onTap: () {},
          title: const Text("Users"),
          leading: const Icon(Icons.people),
        ),
      ],
    );
  }
}
