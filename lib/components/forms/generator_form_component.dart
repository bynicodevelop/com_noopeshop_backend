import "package:com_noopeshop_backend/services/commons/bloc/update_common_bloc.dart";
import "package:com_noopeshop_backend/services/commons/create_common/create_common_bloc.dart";
import "package:com_noopeshop_backend/utils/form_generator.dart";
import "package:com_noopeshop_backend/utils/notifications.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class FormGeneratorComponent extends StatelessWidget {
  final Map<String, dynamic> form;
  final Map<String, dynamic> data;

  final Function(Map<String, dynamic>) onSubmitted;

  const FormGeneratorComponent({
    super.key,
    required this.form,
    required this.onSubmitted,
    this.data = const {},
  });

  @override
  Widget build(BuildContext context) {
    final FormGenerator formGenerator = FormGenerator(
      data: data,
      form: form["form"],
      onSubmitted: onSubmitted,
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
          child: MultiBlocListener(
            listeners: [
              BlocListener<CreateCommonBloc, CreateCommonState>(
                listener: (context, state) async {
                  if (state is CreateCommonSuccessState) {
                    await sendNotification(
                      context,
                      "Created successfully",
                    );
                  }
                },
              ),
              BlocListener<UpdateCommonBloc, UpdateCommonState>(
                listener: (context, state) async {
                  if (state is UpdateCommonSuccessState) {
                    await sendNotification(
                      context,
                      "Updated successfully",
                    );
                  }
                },
              ),
            ],
            child: formGenerator.render(),
          ),
        ),
      ],
    );
  }
}
