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
    {
      "field_name": "product_short_description",
      "data_model": "productShortName",
      "label": "Product Short Name *",
      "data_type": "string",
      "field_type": "text_input",
      "pretreatment": ["trim"],
      "validator": (String value) => value.isEmpty ? "required" : null,
    },
    {
      "field_name": "product_long_description",
      "data_model": "productLongName",
      "label": "Product Long Name *",
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
      // "formatter": (String value) =>
      //     value.isEmpty ? null : value.substring(0, 8),
    },
    {
      "field_name": "product_name",
      "data_model": "productName",
      "label": "Product Name",
    },
    {
      "field_name": "product_short_description",
      "data_model": "productShortName",
      "label": "Product Short Name",
    },
  ],
};
