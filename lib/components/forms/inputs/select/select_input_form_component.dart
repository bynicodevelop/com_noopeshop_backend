import "package:com_noopeshop_backend/config/constants.dart";
import "package:flutter/material.dart";

class SelectInputFormComponent extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final List<Map<String, dynamic>> itemSelected;

  const SelectInputFormComponent({
    super.key,
    required this.items,
    required this.itemSelected,
  });

  @override
  State<SelectInputFormComponent> createState() =>
      _SelectInputFormComponentState();
}

class _SelectInputFormComponentState extends State<SelectInputFormComponent> {
  final List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();

    for (Map<String, dynamic> item in widget.items) {
      final bool selected = widget.itemSelected
          .where((element) => element["uid"] == item["uid"])
          .isNotEmpty;

      _items.add({
        ...item,
        "selected": selected,
      });
    }
  }

  Widget _buildDialog(
    BuildContext context,
  ) {
    return AlertDialog(
      title: const Text("Choisir une catégorie"),
      content: SizedBox(
        width: (MediaQuery.of(context).size.width - 450) / 2,
        child: ListView(
          shrinkWrap: true,
          children: _items
              .map(
                (item) => CheckboxListTile(
                  value: item["selected"],
                  onChanged: (value) {},
                  title: Text(item["name"] ?? ""),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Ok"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kDefaultPadding * 2.2,
      child: ElevatedButton(
        onPressed: () async => showDialog(
          context: context,
          builder: (context) => _buildDialog(
            context,
          ),
        ),
        child: const Text("Categories"),
      ),
    );
  }
}
