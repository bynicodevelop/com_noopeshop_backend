import "package:com_noopeshop_backend/components/forms/generator_form_component.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/services/commons/bloc/update_common_bloc.dart";
import "package:com_noopeshop_backend/services/commons/navigation_common/navigation_common_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class CommonEditScreen extends StatelessWidget {
  final Map<String, dynamic> form;

  const CommonEditScreen({
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
      body: BlocBuilder<NavigationCommonBloc, NavigationCommonState>(
        builder: (context, state) {
          final Map<String, dynamic> data =
              (state as NavigationCommonInitialState).data;

          return FormGeneratorComponent(
            form: form,
            data: data,
            onSubmitted: (dataFields) => context.read<UpdateCommonBloc>().add(
                  OnUpdateCommonEvent(
                    data: {
                      "collection": form["collection"],
                      "data": dataFields,
                    },
                  ),
                ),
          );
        },
      ),
    );
  }
}
