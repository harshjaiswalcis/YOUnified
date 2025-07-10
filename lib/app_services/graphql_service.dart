// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:younified/utils/exports/common_exports.dart';

// class GraphQLService {
//   static final AuthLink authLink = AuthLink(
//     getToken: () async => 'Bearer ${StorageServices.getString('token')}',
//   );

//   static HttpLink httpLink = HttpLink(
//     Env.baseUrl,
//     defaultHeaders: {
//       'Content-Type': 'application/json',
//     },
//   );

//   static final Link link = authLink.concat(httpLink);

//   static GraphQLClient client = GraphQLClient(
//     link: link,
//     cache: GraphQLCache(),
//   );
// }

import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:younified/utils/exports/common_exports.dart';


/// Wrapper that adds timeout to all HTTP requests.
class TimeoutHttpClient extends http.BaseClient {
  final http.Client _inner;
  final Duration _timeout;

  TimeoutHttpClient({http.Client? inner, Duration? timeout})
      : _inner = inner ?? http.Client(),
        _timeout = timeout ?? const Duration(seconds: 30);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request).timeout(_timeout);
  }
}

class GraphQLService {
  static final GraphQLClient client = _createClient();

  static GraphQLClient _createClient() {
    final httpClient = TimeoutHttpClient(timeout: const Duration(seconds: 30));

    final HttpLink httpLink = HttpLink(
      Env.baseUrl,
      httpClient: httpClient,
      defaultHeaders: {
        'Content-Type': 'application/json',
      },
    );

    final AuthLink authLink = AuthLink(
      getToken: () {
        final token = StorageServices.getString('token');
        return token != null ? 'Bearer $token' : '';
      },
    );

    final Link link = authLink.concat(httpLink);

    return GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
  }
}