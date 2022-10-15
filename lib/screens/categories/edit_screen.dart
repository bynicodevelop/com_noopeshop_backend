import "package:com_noopeshop_backend/components/forms/inputs/text/text_input_form_component.dart";
import "package:com_noopeshop_backend/components/forms/inputs/textarea/textarea_input_forms_component.dart";
import "package:com_noopeshop_backend/components/menu/screen/screen_menu_component.dart";
import "package:com_noopeshop_backend/components/pages/bloc/wrapper_page_bloc.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/models/category_model.dart";
import "package:com_noopeshop_backend/services/categories/update_categories/update_categories_bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class CategoriesEditScreen extends StatefulWidget {
  const CategoriesEditScreen({super.key});

  @override
  State<CategoriesEditScreen> createState() => _CategoriesEditScreenState();
}

class _CategoriesEditScreenState extends State<CategoriesEditScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WrapperPageBloc, WrapperPageState>(
      builder: (context, state) {
        CategoryModel categoryModel = CategoryModel.fromJson(
          (state as WrapperPageInitialState).model,
        );

        _nameController.text = categoryModel.name;
        _descriptionController.text = categoryModel.description;

        return Column(
          children: [
            ScreenMenuComponent(
              actions: [
                ElevatedButton(
                  onPressed: () => context.read<EditCategoriesBloc>().add(
                        OnEditCategoriesEvent(
                          model: categoryModel
                              .copyWith(
                                name: _nameController.text,
                                description: _descriptionController.text,
                              )
                              .toJson(),
                        ),
                      ),
                  child: const Text("Save"),
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                IconButton(
                  splashRadius: kDefaultPadding * 1.2,
                  onPressed: () => context.read<WrapperPageBloc>().add(
                        OnWrapperPageEvent(
                          model: categoryModel.toJson(),
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
                const SizedBox(
                  height: kDefaultPadding,
                ),
                TextareaInputFormComponent(
                  controller: _descriptionController,
                  label: "Description",
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
