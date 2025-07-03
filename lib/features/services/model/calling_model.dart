class CallDetailsResponse {
  final CallDetailsData data;

  CallDetailsResponse({required this.data});

  factory CallDetailsResponse.fromJson(Map<String, dynamic> json) {
    return CallDetailsResponse(
      data: CallDetailsData.fromJson(json),
    );
  }
}

class CallDetailsData {
  final List<CallDetail> getCallDetails;

  CallDetailsData({required this.getCallDetails});

  factory CallDetailsData.fromJson(Map<String, dynamic> json) {
    return CallDetailsData(
      getCallDetails: (json['getCallDetails'] as List)
          .map((item) => CallDetail.fromJson(item))
          .toList(),
    );
  }
}

class CallDetail {
  final String id;
  final String startTime;
  final String endDate;
  final String phone;
  final String script;
  final String creatorID;
  final String title;

  CallDetail({
    required this.id,
    required this.startTime,
    required this.endDate,
    required this.phone,
    required this.script,
    required this.creatorID,
    required this.title,
  });

  factory CallDetail.fromJson(Map<String, dynamic> json) {
    return CallDetail(
      id: json['id'],
      startTime: json['startTime'],
      endDate: json['endDate'],
      phone: json['phone'],
      script: json['script'],
      creatorID: json['creatorID'],
      title: json['title'],
    );
  }
}
