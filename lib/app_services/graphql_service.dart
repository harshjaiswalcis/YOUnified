import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';

class GraphQLService {
  static final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${StorageServices.getString('token')}',
  );

  static HttpLink httpLink = HttpLink(
    Env.baseUrl,
    defaultHeaders: {
      'Content-Type': 'application/json',
    },
  );

  static final Link link = authLink.concat(httpLink);

  static GraphQLClient client = GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  );
}
