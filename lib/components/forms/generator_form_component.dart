import "package:com_noopeshop_backend/config/forms/user.dart";
import "package:com_noopeshop_backend/services/users/create_user/create_user_bloc.dart";
import "package:com_noopeshop_backend/utils/form_generator.dart";
import "package:com_noopeshop_backend/utils/notifications.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class FormGeneratorComponent extends StatelessWidget {
  const FormGeneratorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final FormGenerator formGenerator = FormGenerator(
      formData: userForm,
      onError: () async {
        sendNotification(
          context,
          "Please fill all the fields",
        );
      },
      onSubmitted: (Map<String, dynamic> data) {
        context.read<CreateUserBloc>().add(
              OnCreateUserEvent(
                data: data,
              ),
            );
      },
    );

    return formGenerator.render();
  }
}
