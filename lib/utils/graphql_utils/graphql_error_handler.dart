import 'package:graphql_flutter/graphql_flutter.dart';

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
}

// Usage example:
void handleQueryError(dynamic error) {
  try {
    GraphQLErrorHandler.logError(error);
  } catch (e) {
    print('Error handling GraphQL error: $e');
  }
}
