class GrievanceListResponse {
  final GrievanceData data;

  GrievanceListResponse({required this.data});

  factory GrievanceListResponse.fromJson(Map<String, dynamic> json) {
    return GrievanceListResponse(
      data: GrievanceData.fromJson(json),
    );
  }
}

class GrievanceData {
  final List<Grievance> getAllGrievance;

  GrievanceData({required this.getAllGrievance});

  factory GrievanceData.fromJson(Map<String, dynamic> json) {
    return GrievanceData(
      getAllGrievance: (json['getAllGrievance'] as List)
          .map((item) => Grievance.fromJson(item))
          .toList(),
    );
  }
}

class Grievance {
  final String id;
  final String title;
  final String lastUpdatedAt;
  final String caseNumber;
  final String status;
  final String createdAt;

  Grievance({
    required this.id,
    required this.title,
    required this.lastUpdatedAt,
    required this.caseNumber,
    required this.status,
    required this.createdAt,
  });

  factory Grievance.fromJson(Map<String, dynamic> json) {
    return Grievance(
      id: json['id'],
      title: json['title'],
      lastUpdatedAt: json['lastUpdatedAt'],
      caseNumber: json['caseNumber'],
      status: json['status'],
      createdAt: json['createdAt'],
    );
  }
}
