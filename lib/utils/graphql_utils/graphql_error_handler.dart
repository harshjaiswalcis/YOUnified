import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';

class GraphQLErrorHandler {
  static List<String> extractErrorMessages(dynamic error) {
    List<String> messages = [];

    if (error is OperationException) {
      // Handle GraphQL operation exceptions
      if (error.graphqlErrors.isNotEmpty) {
        messages.addAll(
          error.graphqlErrors.map((e) => e.message),
        );
      }

      // Handle link exceptions
      if (error.linkException != null) {
        if (error.linkException is ServerException) {
          final serverError = error.linkException as ServerException;
          if (serverError.parsedResponse?.errors != null) {
            messages.addAll(
              serverError.parsedResponse!.errors!.map((e) => e.message),
            );
          }
        }
      }
    }

    // If no specific messages were found, add a generic message
    if (messages.isEmpty && error != null) {
      messages.add(error.toString());
    }

    return messages;
  }

  static void logError(dynamic error) {
    final messages = extractErrorMessages(error);
    for (final message in messages) {
      print(
          'GraphQL Error: $message'); // Replace with your preferred logging method
    }
  }

  //TOKEN EXPIRED
  static void handleTokenExpiry(BuildContext context, dynamic error) {
    final messages = extractErrorMessages(error);

    for (final message in messages) {
      if (message.toLowerCase().contains('token has expired')) {
        context.showAppSnackBar(
          title: 'Session expired. Please login again.',
          textColor: AppColors.redText,
        );

        // clear session
        StorageServices.delete('token');
        StorageServices.delete('userId');

        // navigate to login
        context.pushNamedAndRemoveUntil(Routes.loginScreen);

        return; // stop after handling
      }
    }
  }
}

// Usage example:
void handleQueryError(dynamic error) {
  try {
    GraphQLErrorHandler.logError(error);
  } catch (e) {
    print('Error handling GraphQL error: $e');
  }
}
