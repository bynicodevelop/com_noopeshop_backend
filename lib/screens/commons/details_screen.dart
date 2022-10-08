import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/services/commons/navigation_common/navigation_common_bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class CommonDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> form;

  const CommonDetailsScreen({
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

          if (data.isEmpty) {
            return const Center(
              child: Text("No data found"),
            );
          }

          return ListView(
            shrinkWrap: true,
            children: (form["form"] as List<Map<String, dynamic>>)
                .map((formData) => ListTile(
                      title: Text(
                        formData["label"] as String,
                      ),
                      subtitle: Text(
                        data[formData["data_model"]] as String,
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
