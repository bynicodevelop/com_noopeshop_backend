import "package:com_noopeshop_backend/components/data_table/data_table_component.dart";
import "package:com_noopeshop_backend/components/modals/import_eliexpress_product_modal_component.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/models/product_model.dart";
import "package:com_noopeshop_backend/services/products/list_products/list_products_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

List<List<Map<String, dynamic>>> table = [
  [
    {
      "label": "Title",
      "value": "product 1",
    },
    {
      "label": "Description",
      "value": "product 1 description",
    }
  ],
  [
    {
      "label": "Title",
      "value": "product 2",
    },
    {
      "label": "Description",
      "value": "product 2 description",
    }
  ],
  [
    {
      "label": "Title",
      "value": "product 3",
    },
    {
      "label": "Description",
      "value": "product 3 description",
    }
  ],
  [
    {
      "label": "Title",
      "value": "product 4",
    },
    {
      "label": "Description",
      "value": "product 4 description",
    }
  ],
  [
    {
      "label": "Title",
      "value": "product 5",
    },
    {
      "label": "Description",
      "value": "product 5 description",
    }
  ],
  [
    {
      "label": "Title",
      "value": "product 6",
    },
    {
      "label": "Description",
      "value": "product 6 description",
    }
  ],
];

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        kDefaultPadding,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        const ImportAliexpressProductModalComponent(),
                  );
                },
                child: const Text("Import Aliexpress Product"),
              ),
            ],
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: BlocBuilder<ListProductsBloc, ListProductsState>(
                bloc: context.read<ListProductsBloc>()
                  ..add(OnListProductsEvent()),
                builder: (context, state) {
                  if (state is ListProductsLoadingState ||
                      state is ListProductsInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ListProductsFailureState) {
                    return Center(
                      child: Text(state.code),
                    );
                  }

                  List<ProductModel> productModel =
                      (state as ListProductsSuccessState).products;

                  if (productModel.isEmpty) {
                    return const Center(
                      child: Text("No products found"),
                    );
                  }

                  return DataTableComponent(
                    table: productModel
                        .map((ProductModel e) => [
                              {
                                "label": const Text("Title"),
                                "value": Text(
                                  e.name,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                "checked": false,
                              },
                            ])
                        .toList(),
                    onEdit: (Map<String, dynamic> data) {
                      print(data);
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
