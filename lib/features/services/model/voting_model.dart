class VotingModel {
  final String electionName;
  final int endsInDays;
  final String endDate;
  final String receiptId;
  final bool votingOpen;

  VotingModel({
    required this.electionName,
    required this.endsInDays,
    required this.endDate,
    required this.receiptId,
    required this.votingOpen,
  });

  // Factory constructor to create an VotingModel object from JSON
  factory VotingModel.fromJson(Map<String, dynamic> json) {
    return VotingModel(
      electionName: json['election_name'],
      endsInDays: json['ends_in_days'],
      endDate: json['end_date'],
      receiptId: json['receipt_id'],
      votingOpen: json['voting_open'],
    );
  }

  // Method to convert an VotingModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'election_name': electionName,
      'ends_in_days': endsInDays,
      'end_date': endDate,
      'receipt_id': receiptId,
      'voting_open': votingOpen,
    };
  }
}