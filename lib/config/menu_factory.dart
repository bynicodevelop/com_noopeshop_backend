import "package:com_noopeshop_backend/components/pages/wrapper_page_component.dart";
import "package:com_noopeshop_backend/screens/products/edit_screen.dart";
import "package:com_noopeshop_backend/screens/products/list_screen.dart";
import "package:flutter/material.dart";

final menuFactory = [
  {
    "id": "products",
    "label": "Products",
    "icon": Icons.add_box_outlined,
    "screen": const WrapperPageComponent(
      list: ProductListScreen(),
      edit: EditScreen(),
    ),
    "default": true,
  },
];
