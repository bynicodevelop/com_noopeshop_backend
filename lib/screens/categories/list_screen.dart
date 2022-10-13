import "package:com_noopeshop_backend/components/data_table/data_table_component.dart";
import "package:flutter/material.dart";

List<List<Map<String, dynamic>>> table = [
  [
    {
      "label": "Title",
      "value": "product 1",
    },
    {
      "label": "Description",
      "value": "product 1 description",
    }
  ],
  [
    {
      "label": "Title",
      "value": "product 2",
    },
    {
      "label": "Description",
      "value": "product 2 description",
    }
  ],
  [
    {
      "label": "Title",
      "value": "product 3",
    },
    {
      "label": "Description",
      "value": "product 3 description",
    }
  ],
  [
    {
      "label": "Title",
      "value": "product 4",
    },
    {
      "label": "Description",
      "value": "product 4 description",
    }
  ],
  [
    {
      "label": "Title",
      "value": "product 5",
    },
    {
      "label": "Description",
      "value": "product 5 description",
    }
  ],
  [
    {
      "label": "Title",
      "value": "product 6",
    },
    {
      "label": "Description",
      "value": "product 6 description",
    }
  ],
];

class CateoriesListScreen extends StatelessWidget {
  const CateoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: DataTableComponent(
          table: table,
        ),
      ),
    );
  }
}
