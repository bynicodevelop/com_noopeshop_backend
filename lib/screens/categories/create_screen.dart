import "package:com_noopeshop_backend/components/forms/inputs/text/text_input_form_component.dart";
import "package:com_noopeshop_backend/components/forms/inputs/textarea/textarea_input_forms_component.dart";
import "package:com_noopeshop_backend/components/menu/screen/screen_menu_component.dart";
import "package:com_noopeshop_backend/components/pages/bloc/wrapper_page_bloc.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/services/categories/create_category/create_category_bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class CategoriesCreateScreen extends StatefulWidget {
  const CategoriesCreateScreen({super.key});

  @override
  State<CategoriesCreateScreen> createState() => _CategoriesCreateScreenState();
}

class _CategoriesCreateScreenState extends State<CategoriesCreateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScreenMenuComponent(
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please enter a name",
                      ),
                    ),
                  );
                  return;
                }

                context.read<CreateCategoryBloc>().add(
                      OnCreateCategoryEvent(
                        data: {
                          "name": _nameController.text,
                          "description": _descriptionController.text,
                        },
                      ),
                    );
              },
              child: const Text("Save"),
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
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
        ListView(
          shrinkWrap: true,
          children: [
            TextInputFormComponent(
              controller: _nameController,
              label: "Name",
            ),
            TextareaInputFormComponent(
              controller: _descriptionController,
              label: "Description",
            ),
          ],
        ),
      ],
    );
  }
}
