import "package:com_noopeshop_backend/config/forms/catagories.dart";
import "package:com_noopeshop_backend/config/forms/product.dart";
import "package:com_noopeshop_backend/config/forms/user.dart";
import "package:com_noopeshop_backend/screens/common_screen.dart";
import "package:flutter/material.dart";

final menuFactory = [
  {
    "id": "users",
    "label": "Users",
    "icon": Icons.person,
    "screen": CommonScreen(
      form: userForm,
    ),
    "default": true,
  },
  {
    "id": "categories",
    "label": "Categories",
    "icon": Icons.category,
    "screen": CommonScreen(
      form: catagoriesForm,
    )
  },
  {
    "id": "products",
    "label": "Products",
    "icon": Icons.add_box_outlined,
    "screen": CommonScreen(
      form: productForm,
    )
  },
];
