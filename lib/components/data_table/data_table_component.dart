import "package:flutter/material.dart";

class DataTableComponent extends StatelessWidget {
  final List<List<Map<String, dynamic>>> table;

  const DataTableComponent({
    super.key,
    required this.table,
  });

  List<DataColumn> _headerTable(
    BuildContext context,
    List<List<Map<String, dynamic>>> data,
  ) =>
      data[0].map((e) => DataColumn(label: Text(e["label"]))).toList();

  List<DataRow> _bodyTable(
    BuildContext context,
    List<List<Map<String, dynamic>>> data,
  ) {
    List<DataRow> rows = data.map((List<Map<String, dynamic>> item) {
      return DataRow(
        onLongPress: () {},
        cells: item.map((Map<String, dynamic> table) {
          return DataCell(
            Text(
              table["value"],
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
          );
        }).toList(),
      );
    }).toList();

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: _headerTable(
        context,
        table,
      ),
      rows: _bodyTable(
        context,
        table,
      ),
    );
  }
}
