class CallingModel {
  final String callingTitle;
  final DateTime startDate;
  final DateTime endDate;
  final String phoneNumber;

  CallingModel({
    required this.callingTitle,
    required this.startDate,
    required this.endDate,
    required this.phoneNumber,
  });

  // Factory constructor to create a CallingModel object from JSON
  factory CallingModel.fromJson(Map<String, dynamic> json) {
    return CallingModel(
      callingTitle: json['calling_title'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      phoneNumber: json['phone_number'],
    );
  }
}