import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/models/product_model.dart";
import "package:com_noopeshop_backend/repositories/graphql_repository.dart";
import "package:com_noopeshop_backend/utils/logger.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class ProductRepository {
  final GraphQLRepository graphQLRepository;

  const ProductRepository(
    this.graphQLRepository,
  );

  String? _extractProductId(String url) {
    final RegExp productIdRegex = RegExp(r"productId=(.*)");

    String? productId = productIdRegex.firstMatch(url)!.group(1);

    if (productId == null) {
      throw StandardException(
        code: "product_id_not_found",
        message: "Product id not found",
      );
    }

    return productId.trim();
  }

  Future<void> get() async {}

  Future<List<ProductModel>> list() async {
    QueryResult queryResult = await graphQLRepository.query(r"""
      query {
        products {
          uid,
          name,
          description,
          categories {
            uid,
            name
          }
          media {
            uid
          }
        }
    }""");

    Map<String, dynamic> data = queryResult.data!;

    // Convert to list of ProductModel
    List<ProductModel> productModels =
        List<Map<String, dynamic>>.from(data["products"]).map((product) {
      return ProductModel.fromJson(product);
    }).toList();

    return productModels;
  }

  Future<void> importFromAliexpress(String url) async {
    info("Importing product from AliExpress:", data: {
      "url": url,
    });

    String? productId = _extractProductId(url);

    info("Importing product id", data: {
      "productId": productId,
    });

    QueryResult queryResult = await graphQLRepository.query(r"""
      mutation ($productId: ID!) {
        scrapeProduct(productIdInput: $productId) {
          uid
      }
    }""", variables: {
      "productId": productId,
    });

    if (queryResult.hasException &&
        queryResult.exception!.graphqlErrors.isNotEmpty) {
      error(
        "Failed to import product from AliExpress",
        data: {
          "url": url,
          "productId": productId,
          "exception": queryResult.exception!.graphqlErrors.first.message,
        },
      );

      throw StandardException(
        code: "import_product_failed",
        message: "Import product failed",
      );
    }

    info("Imported product from AliExpress", data: {
      "url": url,
      "productId": productId,
    });
  }

  Future<void> create(Map<String, dynamic> data) async {}

  Future<void> update(Map<String, dynamic> data) async {}

  Future<void> createOrUpdate(Map<String, dynamic> data) async {}

  Future<void> delete(Map<String, dynamic> data) async {}
}
