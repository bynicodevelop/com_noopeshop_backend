import "package:com_noopeshop_backend/services/commons/create_common/create_common_bloc.dart";
import "package:com_noopeshop_backend/services/commons/update_common/update_common_bloc.dart";
import "package:com_noopeshop_backend/utils/form_generator.dart";
import "package:com_noopeshop_backend/utils/notifications.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class FormGeneratorComponent extends StatefulWidget {
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
  State<FormGeneratorComponent> createState() => _FormGeneratorComponentState();
}

class _FormGeneratorComponentState extends State<FormGeneratorComponent> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final FormGenerator formGenerator = FormGenerator(
      data: widget.data,
      form: widget.form["form"],
      onSubmitted: widget.onSubmitted,
      onError: () async {
        await sendNotification(
          context,
          "Please fix the errors",
        );
      },
    );

    return Stack(
      children: [
        MultiBlocListener(
          listeners: [
            BlocListener<CreateCommonBloc, CreateCommonState>(
              listener: (context, state) async {
                if (state is CreateCommonLoadingState) {
                  setState(() => _isLoading = !_isLoading);

                  return;
                }

                setState(() => _isLoading = !_isLoading);

                String message = "Created successfully";

                if (state is CreateCommonFailureState) {
                  message = "Error: ${state.code}";
                }

                await sendNotification(
                  context,
                  message,
                );
              },
            ),
            BlocListener<UpdateCommonBloc, UpdateCommonState>(
              listener: (context, state) async {
                if (state is UpdateCommonLoadingState) {
                  setState(() => _isLoading = !_isLoading);

                  return;
                }

                setState(() => _isLoading = !_isLoading);

                String message = "Update successfully";

                if (state is UpdateCommonFailureState) {
                  message = "Error: ${state.code}";
                }

                await sendNotification(
                  context,
                  message,
                );
              },
            ),
          ],
          child: formGenerator.render(),
        ),
        if (_isLoading)
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            color: Colors.white.withOpacity(0.5),
            child: const CircularProgressIndicator(),
          )
      ],
    );
  }
}
