import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/services/commons/delete_commons/delete_commons_bloc.dart";
import "package:com_noopeshop_backend/services/commons/list_common/list_common_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:show_confirm_modal/show_confirm_modal.dart";

class CommonListScreen extends StatelessWidget {
  final Map<String, dynamic> formData;

  const CommonListScreen({
    super.key,
    required this.formData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCommonBloc, ListCommonState>(
      bloc: context.read<ListCommonBloc>()
        ..add(OnListCommonEvent(
          formData: formData,
        )),
      builder: (context, state) {
        final List<Map<String, dynamic>> list =
            (state as ListCommonInitialState).list;

        final List<DataColumn> headers =
            List<Map<String, dynamic>>.from(formData["table"])
                .map((Map<String, dynamic> table) {
          return DataColumn(
            label: Expanded(
              child: Text(
                table["label"],
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                textAlign: table["data_model"] == "actions"
                    ? TextAlign.end
                    : TextAlign.start,
              ),
            ),
          );
        }).toList();

        final List<DataRow> rows = list.map((Map<String, dynamic> item) {
          return DataRow(
            onLongPress: () {},
            cells: List<Map<String, dynamic>>.from(formData["table"])
                .map((Map<String, dynamic> table) {
              if (table["data_model"] == "actions") {
                return DataCell(
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        ),
                        const SizedBox(
                          width: kDefaultPadding,
                        ),
                        IconButton(
                          onPressed: () async => showConfirm(
                            context: context,
                            onCancel: () => {},
                            onConfirm: () =>
                                context.read<DeleteCommonBloc>().add(
                                      OnDeleteCommonsEvent(
                                        form: formData,
                                        formData: item,
                                      ),
                                    ),
                          ),
                          icon: const Icon(
                            Icons.delete,
                          ),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                );
              }

              return DataCell(
                Text(
                  item[table["data_model"]],
                ),
              );
            }).toList(),
          );
        }).toList();

        return DataTable(
          columnSpacing: 0,
          columns: [
            ...headers,
          ],
          rows: [
            ...rows,
          ],
        );
      },
    );
  }
}
