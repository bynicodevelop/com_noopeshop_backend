import "package:com_noopeshop_backend/components/menu/screen/screen_menu_component.dart";
import "package:flutter/material.dart";

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ScreenMenuComponent(
          actions: [
            ElevatedButton(
              onPressed: null,
              child: Text("Add"),
            ),
          ],
        ),
      ],
    );
  }
}
