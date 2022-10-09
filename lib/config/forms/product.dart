// ignore: depend_on_referenced_packages

Map<String, dynamic> productForm = {
  "collection": "products",
  "form": [
    {
      "field_name": "product_name",
      "data_model": "productName",
      "label": "Product Name *",
      "data_type": "string",
      "field_type": "text_input",
      "pretreatment": ["trim"],
      "validator": (String value) => value.isEmpty ? "required" : null,
    },
  ],
  "table": [
    {
      "field_name": "uid",
      "data_model": "uid",
      "label": "#",
      "formatter": (String value) => value.substring(0, 6),
    },
    {
      "field_name": "product_name",
      "data_model": "productName",
      "label": "Product Name",
    },
  ],
};
