import "package:com_noopeshop_backend/config/constants.dart";
import "package:flutter/material.dart";

class DataTableComponent extends StatefulWidget {
  final List<List<Map<String, dynamic>>> table;
  final Function(Map<String, dynamic>)? onEdit;

  const DataTableComponent({
    super.key,
    required this.table,
    this.onEdit,
  });

  @override
  State<DataTableComponent> createState() => _DataTableComponentState();
}

class _DataTableComponentState extends State<DataTableComponent> {
  List<DataColumn> _headerTable(
    BuildContext context,
    List<List<Map<String, dynamic>>> data,
  ) {
    if (data.isEmpty) return [];

    List<DataColumn> headerColumn = data.first
        .map((e) => DataColumn(
              label: e["label"],
            ))
        .toList();

    if (widget.onEdit != null) {
      headerColumn.add(
        const DataColumn(
          label: Text(""),
        ),
      );
    }

    return headerColumn;
  }

  List<DataRow> _bodyTable(
    BuildContext context,
    List<List<Map<String, dynamic>>> data,
  ) {
    if (data.isEmpty) return [];

    List<DataRow> rows = data.map((List<Map<String, dynamic>> item) {
      List<DataCell> cells = item
          .map((e) => DataCell(
                e["value"],
              ))
          .toList();

      List<Widget> events = [];

      if (widget.onEdit != null) {
        events.add(
          IconButton(
            iconSize: kDefaultPadding * 1.2,
            splashRadius: kDefaultPadding * 1.2,
            icon: const Icon(Icons.edit),
            onPressed: () {
              widget.onEdit!(item.first);
            },
          ),
        );
      }

      if (events.isNotEmpty) {
        cells.add(
          DataCell(
            Row(
              children: events,
            ),
          ),
        );
      }

      return DataRow(
        onLongPress: () {},
        onSelectChanged: (value) {
          setState(() => item.first["checked"] = value);
        },
        selected: item.first["checked"],
        cells: cells,
      );
    }).toList();

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: _headerTable(
        context,
        widget.table,
      ),
      rows: _bodyTable(
        context,
        widget.table,
      ),
    );
  }
}
