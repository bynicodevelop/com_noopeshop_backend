import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/screens/commons/details_screen.dart";
import "package:com_noopeshop_backend/screens/commons/edit_screen.dart";
import "package:com_noopeshop_backend/services/commons/delete_common/delete_commons_bloc.dart";
import "package:com_noopeshop_backend/services/commons/list_common/list_common_bloc.dart";
import "package:com_noopeshop_backend/utils/material_page_route_without_animation.dart";
import "package:com_noopeshop_backend/utils/notifications.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:show_confirm_modal/show_confirm_modal.dart";

class CommonListScreen extends StatelessWidget {
  final Map<String, dynamic> formData;

  const CommonListScreen({
    super.key,
    required this.formData,
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
      onPressed: () async => Navigator.push(
        context,
        MaterialPageRouteWithoutAnimation(
          builder: (context) => CommonDetailsScreen(
            form: formData,
            data: data,
          ),
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
      onPressed: () async => Navigator.push(
        context,
        MaterialPageRouteWithoutAnimation(
          builder: (context) => CommonEditScreen(
            form: formData,
            data: data,
          ),
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
                    formData: formData,
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
                    form: formData,
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
      List<Map<String, dynamic>>.from(formData["table"])
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
        List<Map<String, dynamic>>.from(formData["table"]);

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
    return BlocBuilder<ListCommonBloc, ListCommonState>(
      bloc: context.read<ListCommonBloc>()
        ..add(OnListCommonEvent(
          formData: formData,
        )),
      builder: (context, state) {
        final List<Map<String, dynamic>> list =
            (state as ListCommonInitialState).list;

        return DataTable(
          columnSpacing: 0,
          columns: _headerTable(
            context,
          ),
          rows: _bodyTable(
            context,
            list,
          ),
        );
      },
    );
  }
}
