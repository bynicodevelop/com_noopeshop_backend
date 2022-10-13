import "package:com_noopeshop_backend/screens/categories/list_screen.dart";
import "package:flutter/material.dart";

final menuFactory = [
  {
    "id": "products",
    "label": "Products",
    "icon": Icons.add_box_outlined,
    "screen": const CateoriesListScreen(),
    "default": true,
  },
];
