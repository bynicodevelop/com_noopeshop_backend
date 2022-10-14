import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/repositories/graphql_repository.dart";
import "package:com_noopeshop_backend/utils/logger.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class CategoryRepository {
  final GraphQLRepository graphQLRepository;

  const CategoryRepository(
    this.graphQLRepository,
  );

  Future<void> get() async {}

  Future<void> list() async {}

  Future<void> create(Map<String, dynamic> data) async {
    QueryResult result = await graphQLRepository.mutate(
      r"""
        mutation($categoryInput: CategoryInput!) {
            createCategory(categoryInput: $categoryInput) {
                __typename
                ... on Category {
                    uid
                    name,
                    description
                }
                ... on CategoryNotFoundError {
                    code
                }
            }
        }
      """,
      variables: {
        "categoryInput": {
          "name": data["name"],
          "description": data["description"],
        },
      },
    );

    print(result);

    if (result.hasException) {
      throw StandardException(
        code: "unknown",
        message: result.exception.toString(),
      );
    }

    if (result.data!["createCategory"]["__typename"] ==
        "CategoryNotFoundError") {
      throw StandardException(
        code: result.data!["createCategory"]["code"],
        message: "Category not found",
      );
    }

    info(
      "Category created",
      data: result.data!["createCategory"],
    );
  }

  Future<void> update(Map<String, dynamic> data) async {}

  Future<void> createOrUpdate(Map<String, dynamic> data) async {}

  Future<void> delete(Map<String, dynamic> data) async {}
}
