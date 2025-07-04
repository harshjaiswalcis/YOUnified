import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_queries/union_queries.dart';

class UnionProvider extends ChangeNotifier {
  UnionModel? unionData;
  bool isLoading = false;
  String? errorMessage;

  Future<UnionModel?> fetchUnionByName(String name) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await appProvider.fetchData<UnionModel?>(
        query: gql(Queries.unionByName),
        variables: {'name': name},
        parse: _parseUnionByName,
      );

      if (result == null) {
        errorMessage = 'Union not found';
      }

      return result;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  UnionModel? _parseUnionByName(Map<String, dynamic>? data) {
    final unionData = data?['unionByName'];
    if (unionData != null) {
      final unionModel = UnionModel.fromJson(unionData);
      StorageServices.setString('unionId', unionModel.id);
      StorageServices.setString('unionName', unionModel.name);
      StorageServices.setString(
          'imageURL', unionModel.information?.imageURL ?? '');
      return unionModel;
    }
    return null;
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
