import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/features/home/model/grievance_model.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_queries/grievance_queries.dart';

class GrievanceProvider extends ChangeNotifier {
  List<Grievance> _grievances = [];
  List<Grievance> get grievances => _grievances;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchGrievances() async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await GraphQLService.client.query(
        QueryOptions(document: gql(GrievanceQueries.getAllGrievance)),
      );

      if (result.hasException) {
        _errorMessage = result.exception.toString();
        debugPrint('[GrievanceProvider] GraphQL Error: $_errorMessage');
      } else if (result.data != null) {
        final response = GrievanceListResponse.fromJson(result.data!);
        _grievances = response.data.getAllGrievance;
        _errorMessage = null; // Clear error on success
      } else {
        _errorMessage = 'No data received from server.';
        debugPrint('[GrievanceProvider] No data received.');
      }
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint('[GrievanceProvider] Exception: $_errorMessage');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
