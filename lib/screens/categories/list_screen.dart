import "package:com_noopeshop_backend/components/menu/screen/screen_menu_component.dart";
import "package:com_noopeshop_backend/components/pages/bloc/wrapper_page_bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScreenMenuComponent(
          actions: [
            ElevatedButton(
              onPressed: () => context.read<WrapperPageBloc>().add(
                    const OnWrapperPageEvent(
                      model: {},
                      name: "create",
                    ),
                  ),
              child: const Text("Add"),
            ),
          ],
        ),
      ],
    );
  }
}
