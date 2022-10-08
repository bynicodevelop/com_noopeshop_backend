import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/services/commons/delete_commons/delete_commons_bloc.dart";
import "package:com_noopeshop_backend/services/users/create_user/create_user_bloc.dart";
import "package:com_noopeshop_backend/utils/form_generator.dart";
import "package:com_noopeshop_backend/utils/notifications.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";
import "package:show_confirm_modal/show_confirm_modal.dart";

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
          flex: 4,
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
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: kDefaultPadding * 2,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Fermer"),
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                BlocListener<DeleteCommonsBloc, DeleteCommonsState>(
                  listener: (context, state) async {
                    if (state is DeleteCommonsErrorState) {
                      sendNotification(
                        context,
                        "Error: ${state.code}",
                      );
                    }
                  },
                  child: SizedBox(
                    height: kDefaultPadding * 2,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        showConfirm(
                          context: context,
                          onCancel: () => print("Cancel"),
                          onConfirm: () =>
                              context.read<DeleteCommonsBloc>().add(
                                    OnDeleteCommonsEvent(
                                      form: formData,
                                    ),
                                  ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text("Delete"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
