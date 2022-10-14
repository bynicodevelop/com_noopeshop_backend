import "package:com_noopeshop_backend/services/products/import_aliexpress_product/import_aliexpress_product_bloc.dart";
import "package:com_noopeshop_backend/services/products/list_products/list_products_bloc.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class ImportAliexpressProductModalComponent extends StatefulWidget {
  const ImportAliexpressProductModalComponent({super.key});

  @override
  State<ImportAliexpressProductModalComponent> createState() =>
      _ImportAliexpressProductModalComponentState();
}

class _ImportAliexpressProductModalComponentState
    extends State<ImportAliexpressProductModalComponent> {
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      _urlController.text =
          "https://fr.aliexpress.com/item/32989626288.html?pdp_ext_f=%7B%22ship_from%22:%22%22,%22sku_id%22:%2267156105923%22%7D&&scm=1007.33820.271950.0&scm_id=1007.33820.271950.0&scm-url=1007.33820.271950.0&pvid=8afc034c-d5c0-49ba-b6e1-48cbf51f0844&utparam=%257B%2522process_id%2522%253A%2522open_57_000000000066001%2522%252C%2522x_object_type%2522%253A%2522product%2522%252C%2522pvid%2522%253A%25228afc034c-d5c0-49ba-b6e1-48cbf51f0844%2522%252C%2522belongs%2522%253A%255B%257B%2522id%2522%253A%25221110328%2522%252C%2522type%2522%253A%2522dataset%2522%257D%255D%252C%2522pageSize%2522%253A%252220%2522%252C%2522language%2522%253A%2522fr%2522%252C%2522scm%2522%253A%25221007.33820.271950.0%2522%252C%2522countryId%2522%253A%2522FR%2522%252C%2522tpp_buckets%2522%253A%252221669%25230%2523265320%252331_21669%25234190%252319160%2523260_15324%25230%2523132599%25236%2522%252C%2522x_object_id%2522%253A%252232989626288%2522%257D&pdp_npi=2%40dis%21EUR%21%E2%82%AC%2010%2C96%21%E2%82%AC%207%2C02%21%21%21%21%21%402103239b16655710642778956ea219%2167156105923%21gsd&spm=a2g0o.superdeal.productlist.item0,productId=32989626288";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Import Aliexpress Product"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            const Text("Enter the product URL:"),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                hintText: "https://www.aliexpress.com/item/4000000000000.html",
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        MultiBlocListener(
            listeners: [
              BlocListener<ImportAliexpressProductBloc,
                  ImportAliexpressProductState>(
                listener: ((context, state) {
                  if (state is ImportAliexpressProductSuccessState) {
                    context.read<ListProductsBloc>().add(
                          OnListProductsEvent(),
                        );
                  }
                }),
              ),
              BlocListener<ListProductsBloc, ListProductsState>(
                listener: ((context, state) {
                  if (state is ListProductsSuccessState) {
                    Navigator.pop(context);
                  }
                }),
              ),
            ],
            child: TextButton(
              child: const Text("Import"),
              onPressed: () {
                context.read<ImportAliexpressProductBloc>().add(
                      OnImportAliexpressProductEvent(
                        _urlController.text,
                      ),
                    );
              },
            ))
      ],
    );
  }
}
