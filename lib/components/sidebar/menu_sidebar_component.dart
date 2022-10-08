import "package:com_noopeshop_backend/config/menu_factory.dart";
import "package:flutter/material.dart";

class MenuSidebasComponent extends StatelessWidget {
  const MenuSidebasComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: menuFactory.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            menuFactory[index]["icon"] as IconData,
          ),
          title: Text(
            menuFactory[index]["label"] as String,
          ),
        );
      },
    );
  }
}
