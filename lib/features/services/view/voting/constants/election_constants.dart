// lib/features/election/constants/election_constants.dart
class ElectionConstants {
  static const String appBarTitle = "Election Name";
  static const String questionsText = "Questions";
  static const int totalSteps = 3;

  static const Map<int, String> questions = {
    1: 'Favourite color?',
    2: 'Favourite season?',
    3: 'Which color combo?',
  };

  static const Map<int, String> selectionHints = {
    1: 'You may select 1 option',
    2: 'You must select 1 option',
    3: 'You may select multiple options',
  };
}
