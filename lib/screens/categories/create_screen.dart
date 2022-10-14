import "package:com_noopeshop_backend/components/menu/screen/screen_menu_component.dart";
import "package:com_noopeshop_backend/components/pages/bloc/wrapper_page_bloc.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class CategoriesCreateScreen extends StatelessWidget {
  const CategoriesCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScreenMenuComponent(
          actions: [
            IconButton(
              splashRadius: kDefaultPadding * 1.2,
              onPressed: () => context.read<WrapperPageBloc>().add(
                    const OnWrapperPageEvent(
                      model: {},
                      name: "list",
                    ),
                  ),
              icon: const Icon(
                Icons.close,
              ),
            ),
          ],
        ),
        const Text("CategoriesCreateScreen"),
      ],
    );
  }
}
