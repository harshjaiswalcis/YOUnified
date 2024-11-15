import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/app_services/queries.dart';
import 'package:younified/features/authentication/model/union_model.dart';
import 'package:younified/utils/exports/common_exports.dart';

class UnionProvider extends ChangeNotifier {
  UnionModel? unionData;
  String? accessToken;
  bool isLoading = false;
  String? errorMessage;

  Future<UnionModel?> fetchUnionByName(String name) async {
    isLoading = true;

    try {
      QueryResult result = await GraphQLService.client.query(
        QueryOptions(
          document: gql(Queries.unionByName),
          variables: {
            'name': name,
          },
        ),
      );

      if (result.hasException) {
        errorMessage = result.exception.toString();
        isLoading = false;
        return null;
      }

      final data = result.data?['unionByName'];
      if (data != null) {
        unionData = UnionModel.fromJson(data);
        isLoading = false;
        return unionData!;
      }
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
    }
    notifyListeners();
    return null;
  }
}
