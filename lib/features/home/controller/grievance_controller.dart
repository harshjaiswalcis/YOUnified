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

  Future<void> fetchGrievances(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await GraphQLService.client.query(
        QueryOptions(document: gql(GrievanceQueries.getAllGrievance)),
      );

      if (result.hasException) {
        final messages =
            GraphQLErrorHandler.extractErrorMessages(result.exception!);
        _errorMessage = messages.join('\n');
        GraphQLErrorHandler.logError(result.exception);

        GraphQLErrorHandler.handleTokenExpiry(context, result.exception!);

        context.showAppSnackBar(
          title: _errorMessage ?? 'Unknown error',
          textColor: AppColors.redText,
        );
      } else if (result.data != null) {
        debugPrint('[GrievanceProvider] GraphQL Data: ${result.data}');
        final response = GrievanceListResponse.fromJson(result.data!);
        _grievances = response.data.getAllGrievance;
        _errorMessage = null;
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

  Future<GrievanceDetail?> getGrievanceById(
      BuildContext context, String id) async {
    try {
      final result = await GraphQLService.client.query(
        QueryOptions(
          document: gql(GrievanceQueries.getGrievanceById),
          variables: {'id': id},
        ),
      );

      if (result.hasException) {
        final messages =
            GraphQLErrorHandler.extractErrorMessages(result.exception!);
        final errorMessage = messages.join('\n');
        GraphQLErrorHandler.logError(result.exception);

        GraphQLErrorHandler.handleTokenExpiry(context, result.exception!);

        context.showAppSnackBar(
          title: errorMessage.isNotEmpty ? errorMessage : 'Unknown error',
          textColor: AppColors.redText,
        );

        debugPrint('[getGrievanceById] GraphQL Error: $errorMessage');
        return null;
      }

      if (result.data != null) {
        debugPrint('[getGrievanceById] GraphQL Success: ${result.data}');
        final data = result.data!['getGrievanceById'];
        return GrievanceDetail.fromJson(data);
      } else {
        debugPrint('[getGrievanceById] No data received.');
        return null;
      }
    } catch (e) {
      debugPrint('[getGrievanceById] Exception: $e');
      context.showAppSnackBar(
        title: e.toString(),
        textColor: AppColors.redText,
      );
      return null;
    }
  }
}
