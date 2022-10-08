import "package:com_noopeshop_backend/services/commons/create_common/create_common_bloc.dart";
import "package:com_noopeshop_backend/utils/form_generator.dart";
import "package:com_noopeshop_backend/utils/notifications.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class FormGeneratorComponent extends StatelessWidget {
  final Map<String, dynamic> formData;

  const FormGeneratorComponent({
    super.key,
    required this.formData,
  });

  @override
  Widget build(BuildContext context) {
    final FormGenerator formGenerator = FormGenerator(
      formData: formData["form"],
      onSubmitted: (Map<String, dynamic> dataFields) {
        context.read<CreateCommonBloc>().add(
              OnCreateCommonEvent(
                data: {
                  "collection": formData["collection"],
                  "data": dataFields,
                },
              ),
            );
      },
      onError: () async {
        await sendNotification(
          context,
          "Please fix the errors",
        );
      },
    );

    return Row(
      children: [
        Expanded(
          child: BlocListener<CreateCommonBloc, CreateCommonState>(
            listener: (context, state) async {
              if (state is CreateCommonSuccessState) {
                await sendNotification(
                  context,
                  "Created successfully",
                );
              }
            },
            child: formGenerator.render(),
          ),
        ),
      ],
    );
  }
}
