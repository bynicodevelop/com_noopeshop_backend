import "package:com_noopeshop_backend/components/forms/generator_form_component.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/services/commons/create_common/create_common_bloc.dart";
import "package:com_noopeshop_backend/services/commons/navigation_common/navigation_common_bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class CommonCreateScreen extends StatelessWidget {
  final Map<String, dynamic> form;

  const CommonCreateScreen({
    super.key,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
            ),
            onPressed: () => context.read<NavigationCommonBloc>().add(
                  const OnNavigationCommonEvent(
                    screenName: "list",
                    data: {},
                  ),
                ),
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: FormGeneratorComponent(
            form: form,
            onSubmitted: (dataFields) => context.read<CreateCommonBloc>().add(
                  OnCreateCommonEvent(
                    data: {
                      "collection": form["collection"],
                      "data": dataFields,
                    },
                  ),
                )),
      ),
    );
  }
}
