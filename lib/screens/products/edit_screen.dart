import "package:com_noopeshop_backend/components/forms/inputs/text/text_input_form_component.dart";
import "package:com_noopeshop_backend/components/pages/bloc/wrapper_page_bloc.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/models/product_model.dart";
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

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WrapperPageBloc, WrapperPageState>(
      builder: (context, state) {
        ProductModel productModel = ProductModel.fromJson(
          (state as WrapperPageInitialState).model,
        );

        _nameController.text = productModel.name;

        return Column(
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  iconSize: kDefaultPadding * 1.2,
                  splashRadius: kDefaultPadding * 1.2,
                  onPressed: () {
                    context.read<WrapperPageBloc>().add(
                          const OnWrapperPageEvent(
                            model: {},
                            name: "list",
                          ),
                        );
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                TextInputFormComponent(
                  controller: _nameController,
                  label: "Name",
                )
              ],
            )
          ],
        );
      },
    );
  }
}
