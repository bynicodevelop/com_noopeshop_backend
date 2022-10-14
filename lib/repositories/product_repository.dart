import "package:com_noopeshop_backend/models/product_model.dart";
import "package:com_noopeshop_backend/repositories/graphql_repository.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class ProductRepository {
  final GraphQLRepository graphQLRepository;

  const ProductRepository(
    this.graphQLRepository,
  );

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

    print(productModels);

    return productModels;
  }

  Future<void> create(Map<String, dynamic> data) async {}

  Future<void> update(Map<String, dynamic> data) async {}

  Future<void> createOrUpdate(Map<String, dynamic> data) async {}

  Future<void> delete(Map<String, dynamic> data) async {}
}
