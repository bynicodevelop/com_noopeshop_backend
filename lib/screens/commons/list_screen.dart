import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/services/commons/delete_common/delete_commons_bloc.dart";
import "package:com_noopeshop_backend/services/commons/list_common/list_common_bloc.dart";
import "package:com_noopeshop_backend/services/commons/navigation_common/navigation_common_bloc.dart";
import "package:com_noopeshop_backend/utils/notifications.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:show_confirm_modal/show_confirm_modal.dart";

class CommonListScreen extends StatelessWidget {
  final Map<String, dynamic> form;

  const CommonListScreen({
    super.key,
    required this.form,
  });

  IconButton _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    Color color = Colors.black87,
  }) {
    return IconButton(
      splashRadius: kDefaultPadding * 1.4,
      iconSize: kDefaultPadding,
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: onPressed,
    );
  }

  Widget _detailsButton(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    return _buildIconButton(
      icon: Icons.open_in_new_outlined,
      onPressed: () async => context.read<NavigationCommonBloc>().add(
            OnNavigationCommonEvent(
              screenName: "details",
              data: data,
            ),
          ),
    );
  }

  Widget _editButton(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    return _buildIconButton(
      icon: Icons.edit,
      onPressed: () async => context.read<NavigationCommonBloc>().add(
            OnNavigationCommonEvent(
              screenName: "edit",
              data: data,
            ),
          ),
    );
  }

  Widget _deleteButton(
    BuildContext context,
    Map<String, dynamic> data,
  ) =>
      BlocListener<DeleteCommonBloc, DeleteCommonState>(
        listener: (context, state) async {
          if (state is DeleteCommonSuccessState) {
            context.read<ListCommonBloc>().add(
                  OnListCommonEvent(
                    form: form,
                  ),
                );

            await sendNotification(
              context,
              "Deleted successfully",
            );
          }
        },
        child: _buildIconButton(
          icon: Icons.delete,
          onPressed: () async => showConfirm(
            context: context,
            onCancel: () => {},
            onConfirm: () => context.read<DeleteCommonBloc>().add(
                  OnDeleteCommonEvent(
                    form: form,
                    data: data,
                  ),
                ),
          ),
          color: Colors.red,
        ),
      );

  List<DataColumn> _headerTable(
    BuildContext context,
  ) =>
      List<Map<String, dynamic>>.from(form["table"])
          .map((Map<String, dynamic> table) {
        return DataColumn(
          label: Text(
            table["label"],
            style: Theme.of(context).textTheme.subtitle2,
          ),
        );
      }).toList();

  DataRow _emptyTable(
    BuildContext context,
    List<Map<String, dynamic>> tableCols,
  ) =>
      DataRow(
        cells: tableCols
            .map(
              (e) => DataCell(
                Text(
                  "--",
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
            )
            .toList(),
      );

  List<DataRow> _bodyTable(
    BuildContext context,
    List<Map<String, dynamic>> list,
  ) {
    List<Map<String, dynamic>> tableCols =
        List<Map<String, dynamic>>.from(form["table"]);

    List<DataRow> rows = list.map((Map<String, dynamic> item) {
      return DataRow(
        onLongPress: () {},
        cells: tableCols.map((Map<String, dynamic> table) {
          if (table["data_model"] == "actions") {
            return DataCell(
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _detailsButton(
                      context,
                      item,
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    _editButton(
                      context,
                      item,
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    _deleteButton(
                      context,
                      item,
                    ),
                  ],
                ),
              ),
            );
          }

          return DataCell(
            Text(
              table["formatter"] != null
                  ? table["formatter"].call(item[table["data_model"]])
                  : item[table["data_model"]],
            ),
          );
        }).toList(),
      );
    }).toList();

    if (rows.isEmpty) {
      rows.add(
        _emptyTable(
          context,
          tableCols,
        ),
      );
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    if (form.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text("No data"),
        ),
      );
    }

    return BlocBuilder<ListCommonBloc, ListCommonState>(
      bloc: context.read<ListCommonBloc>()
        ..add(OnListCommonEvent(
          form: form,
        )),
      builder: (context, state) {
        final List<Map<String, dynamic>> list =
            (state as ListCommonInitialState).list;

        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                columns: _headerTable(
                  context,
                ),
                rows: _bodyTable(
                  context,
                  list,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
