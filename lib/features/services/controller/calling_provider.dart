import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_queries/call_details_queries.dart';

class CallDetailsProvider extends ChangeNotifier {
  List<CallDetail> _calls = [];
  List<CallDetail> get calls => _calls;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCallDetails() async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await GraphQLService.client.query(
        QueryOptions(document: gql(CallDetailsQueries.getCallDetails)),
      );

      if (result.hasException) {
        _errorMessage = result.exception.toString();
        debugPrint('[CallDetailsProvider] GraphQL Error: $_errorMessage');
      } else if (result.data != null) {
        debugPrint('[CallDetailsProvider] result.data: ${result.data}');
        final response = CallDetailsResponse.fromJson(result.data!);
        _calls = response.data.getCallDetails;
        _errorMessage = null;
      } else {
        _errorMessage = 'No data received from server.';
        debugPrint('[CallDetailsProvider] No data received.');
      }
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint('[CallDetailsProvider] Exception: $_errorMessage');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
