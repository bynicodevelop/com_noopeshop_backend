import "package:com_noopeshop_backend/services/users/create_user/create_user_bloc.dart";
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
        context.read<CreateUserBloc>().add(
              OnCreateUserEvent(
                data: dataFields,
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
          child: BlocListener<CreateUserBloc, CreateUserState>(
            listener: (context, state) async {
              if (state is CreateUserSuccessState) {
                await sendNotification(
                  context,
                  "User created successfully",
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
