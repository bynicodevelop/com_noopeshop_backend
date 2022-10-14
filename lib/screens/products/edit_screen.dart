import "package:com_noopeshop_backend/components/forms/inputs/text/text_input_form_component.dart";
import "package:com_noopeshop_backend/components/forms/inputs/textarea/textarea_input_forms_component.dart";
import "package:com_noopeshop_backend/components/pages/bloc/wrapper_page_bloc.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/models/product_model.dart";
import "package:com_noopeshop_backend/services/products/edit_product/edit_product_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
        print("EditScreen: state: ${(state as WrapperPageInitialState).model}");
        ProductModel productModel = ProductModel.fromJson(
          (state).model,
        );

        _nameController.text = productModel.name;
        _descriptionController.text = productModel.description;

        return Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID : ${productModel.uid}"),
                    const SizedBox(
                      height: kDefaultPadding / 3,
                    ),
                    Text("ID produit : ${productModel.productId}"),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    context.read<EditProductBloc>().add(
                          OnEditProductEvent(
                            productModel: productModel.copyWith(
                              name: _nameController.text,
                              description: _descriptionController.text,
                            ),
                          ),
                        );
                  },
                  child: const Text("Save"),
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                IconButton(
                  iconSize: kDefaultPadding * 1.2,
                  splashRadius: kDefaultPadding * 1.2,
                  onPressed: () {
                    context.read<WrapperPageBloc>().add(
                          OnWrapperPageEvent(
                            model: productModel.toJson(),
                            name: "list",
                          ),
                        );
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
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
              ),
            )
          ],
        );
      },
    );
  }
}
