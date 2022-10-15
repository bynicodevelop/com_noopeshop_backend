import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLRepository {
  late GraphQLClient _client;

  GraphQLRepository() {
    final Policies policies = Policies(
      fetch: FetchPolicy.networkOnly,
    );

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(
        "http://localhost:5001/e-commerce-empire/us-central1/api",
      ),
      defaultPolicies: DefaultPolicies(
        watchQuery: policies,
        query: policies,
        mutate: policies,
      ),
    );
  }

  Future<QueryResult> query(
    String query, {
    Map<String, dynamic> variables = const {},
  }) async {
    return await _client.query(
      QueryOptions(
        document: gql(query),
        variables: variables,
      ),
    );
  }

  Future<QueryResult> mutate(
    String mutation, {
    Map<String, dynamic> variables = const {},
  }) async {
    return await _client.mutate(
      MutationOptions(
        document: gql(mutation),
        variables: variables,
      ),
    );
  }
}
