import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_queries/union_queries.dart';

class UnionProvider extends ChangeNotifier {
  UnionModel? unionData;
  bool isLoading = false;
  String? errorMessage;

  Future<UnionModel?> fetchUnionByName(String name) async {
    isLoading = true;
    notifyListeners();

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
        // Extract GraphQL errors
        if (result.exception?.graphqlErrors.isNotEmpty ?? false) {
          final firstError = result.exception!.graphqlErrors.first;
          errorMessage = firstError.message; // Get "internal system error"
        } else {
          // Fallback if no graphqlErrors exist
          errorMessage = "Unknown error occurred.";
        }

        log(errorMessage!);
        isLoading = false;
        notifyListeners();
        return null;
      }

      final data = result.data?['unionByName'];
      if (data != null) {
        unionData = UnionModel.fromJson(data);
        StorageServices.setString('unionId', unionData!.id);
        StorageServices.setString('unionName', unionData!.name);
        StorageServices.setString(
            'imageURL', unionData!.information!.imageURL!);
        isLoading = false;
        notifyListeners();
        return unionData!;
      }
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
    return null;
  }
}
