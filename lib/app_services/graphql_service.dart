import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';

// class GraphQLService {
//   final String endpoint;

//   GraphQLService({required this.endpoint});

//   // Create a GraphQL client
//   GraphQLClient _client() {
//     log("111111111");
//     final HttpLink httpLink = HttpLink(endpoint);
//     return GraphQLClient(
//       link: httpLink,
//       cache: GraphQLCache(store: HiveStore()),
//     );
//   }

//   // Method to execute the query
//   Future<QueryResult> performQuery(String query) async {
//     log("333333333 $query");
//     final QueryOptions options = QueryOptions(
//       fetchPolicy: FetchPolicy.noCache,
//       document: gql(query),
//     );

//     final client = _client();
//     QueryResult<Object?> result121 = await client.query(options);
//     print('GraphQL Data: ${result121.exception}');
//     log("22222222 $options --- $client ------ ${client.query(options)}");
//     return await client.query(options);
//   }
// }

class GraphQLService {
  static HttpLink httpLink = HttpLink(
    Env.baseUrl,
  );

  static GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  );
}
