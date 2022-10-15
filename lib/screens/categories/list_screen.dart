import "package:com_noopeshop_backend/components/data_table/data_table_component.dart";
import "package:com_noopeshop_backend/components/menu/screen/screen_menu_component.dart";
import "package:com_noopeshop_backend/components/pages/bloc/wrapper_page_bloc.dart";
import "package:com_noopeshop_backend/models/category_model.dart";
import "package:com_noopeshop_backend/services/categories/list_categories/list_categories_bloc.dart";
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
        SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: BlocBuilder<ListCategoriesBloc, ListCategoriesState>(
                bloc: context.read<ListCategoriesBloc>()
                  ..add(OnListCategoriesEvent()),
                builder: (BuildContext context, state) {
                  print(state);

                  if (state is ListCategoriesLoadingState ||
                      state is ListCategoriesInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ListCategoriesFailureState) {
                    return Center(
                      child: Text(state.code),
                    );
                  }

                  List<CategoryModel> categoryModel =
                      (state as ListCategoriesLoadedState).categories;

                  if (categoryModel.isEmpty) {
                    return const Center(
                      child: Text("No category found"),
                    );
                  }

                  return DataTableComponent(
                    table: categoryModel
                        .map((CategoryModel e) => [
                              {
                                "label": const Text("Title"),
                                "value": Text(
                                  e.name,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                "checked": false,
                                "model": e,
                              },
                            ])
                        .toList(),
                    onSelected: (List<Map<String, dynamic>> selected) {},
                    onEdit: (Map<String, dynamic> data) async {
                      context.read<WrapperPageBloc>().add(
                            OnWrapperPageEvent(
                              model: (data["model"] as CategoryModel).toJson(),
                              name: "edit",
                            ),
                          );
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }
}
