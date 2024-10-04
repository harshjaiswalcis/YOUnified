import 'package:younified/features/authentication/model/union_model.dart';
import 'package:younified/utils/exports/common_exports.dart';

class UnionProvider extends ChangeNotifier {
  final GraphQLService _graphqlService = GraphQLService(endpoint: 'http://192.168.1.208:8080/graphql');
  // final GraphQLService _graphQLService = GraphQLService();
  UnionModel? _unionData;
  bool _loading = false;
  String? _error;

  UnionModel? get unionData => _unionData;
  bool get loading => _loading;
  String? get error => _error;

  // GraphQL query
  final String unionByNameQuery = """
    query UnionByName {
    unionByName(name: "sumiran biswas") {
        id
        name
        status
        bargainingUnits
        bannerURL
        callDropNumber
        domain
        bannedDomains
        theme
        twitter
        twitterLinks
        facebook
        facebookLinks
        instagram
        instagramLinks
        themeImage
        zoomID
        hostEmail
        defaultEmailPassword
    }
}
  """;

  // Fetch union by name
  // Future<void> fetchUnionByName(String name) async {
  //   _loading = true;
  //   _error = null;
  //   notifyListeners();

  //   // try {
  //         log("0 ${_graphqlService.performQuery(unionByNameQuery)}");
  //     final result = await _graphqlService.performQuery(unionByNameQuery);
      
  //         log("1 $result");
  //     if (result.hasException) {
  //       _error = result.exception.toString();
  //         log("2 $_error");
        
  //     } else {
  //         log("3 ${_graphqlService.performQuery(unionByNameQuery)}");

  //       final data = result.data?['unionByName'];
  //       if (data != null) {
  //         _unionData = UnionModel.fromJson(data);
  //         log("000000000 ${_unionData.toString()}");
  //       }
  //     }
  //   // } catch (e) {
  //   //   _error = e.toString();
  //   // }

  //   _loading = false;
  //   notifyListeners();
  // }

  // Fetch union by name
Future<void> fetchUnionByName(String name) async {
  _loading = true;
  _error = null;
  notifyListeners();

  try {
    final result = await _graphqlService.performQuery(
      unionByNameQuery
    ).timeout(const Duration(seconds: 30));

    if (result.hasException) {
      _error = result.exception.toString();
      log("121 ${result.source!.name} ${result.exception}");
      log("GraphQL Error: $_error");
    } else {
      final data = result.data?['unionByName'];
      if (data != null) {
        _unionData = UnionModel.fromJson(data);
        log("Union Data: $_unionData");
      }
    }
  } catch (e) {
    _error = e.toString();
    log("Exception: $_error");
  }

  _loading = false;
  notifyListeners();
}

}
