// ignore: depend_on_referenced_packages

Map<String, dynamic> catagoriesForm = {
  "collection": "categories",
  "form": [
    {
      "field_name": "categories_name",
      "data_model": "categoriesName",
      "label": "Product Name *",
      "data_type": "string",
      "field_type": "text_input",
      "pretreatment": ["trim"],
      "validator": (String value) => value.isEmpty ? "required" : null,
    },
    {
      "field_name": "categories_short_description",
      "data_model": "categoriesShortName",
      "label": "Product Short Name *",
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
      "field_name": "categories_name",
      "data_model": "categoriesName",
      "label": "Product Name",
    },
    {
      "field_name": "categories_short_description",
      "data_model": "categoriesShortName",
      "label": "Product Short Name",
    },
  ],
};
