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

class GrievanceDetail {
  final String id;
  final String title;
  final String? details;
  final String createdAt;
  final String lastUpdatedAt;
  final String caseNumber;
  final String? employer;
  final String? description;
  final String? supervisor;
  final String? dateFiled;
  final String status;
  final String? classification;
  final String? unit;
  final String? claim;
  final String? request;
  final String? dateOfSettlement;
  final bool favourOfSettlement;
  final String? particulars;
  final List<dynamic> memberIDs;
  final String createdByID;
  final String lastUpdatedByID;
  final String assignedToID;

  final UserSummary? steward;
  final UserSummary? subSteward;
  final List<Update>? updates;
  final List<UserSummary>? members; // adjust type if you know it
  final List<Doc>? documents; // adjust type if you know it

  final SignatureInfo? grievor;
  final SignatureInfo? unionRep;
  final SignatureInfo? unionOfficer;

  GrievanceDetail({
    required this.id,
    required this.title,
    this.details,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.caseNumber,
    this.employer,
    this.description,
    this.supervisor,
    this.dateFiled,
    required this.status,
    this.classification,
    this.unit,
    this.claim,
    this.request,
    this.dateOfSettlement,
    required this.favourOfSettlement,
    this.particulars,
    required this.memberIDs,
    required this.createdByID,
    required this.lastUpdatedByID,
    required this.assignedToID,
    this.steward,
    this.subSteward,
    this.updates,
    this.members,
    this.documents,
    this.grievor,
    this.unionRep,
    this.unionOfficer,
  });

  factory GrievanceDetail.fromJson(Map<String, dynamic> json) {
    return GrievanceDetail(
      id: json['id'],
      title: json['title'] ?? '',
      details: json['details'],
      createdAt: json['createdAt'],
      lastUpdatedAt: json['lastUpdatedAt'],
      caseNumber: json['caseNumber'],
      employer: json['employer'],
      description: json['description'],
      supervisor: json['supervisor'],
      dateFiled: json['dateFiled'],
      status: json['status'] ?? '',
      classification: json['classification'],
      unit: json['unit'],
      claim: json['claim'],
      request: json['request'],
      dateOfSettlement: json['dateOfSettlement'],
      favourOfSettlement: json['favourOfSettlement'] ?? false,
      particulars: json['particulars'],
      memberIDs: json['memberIDs'] ?? [],
      createdByID: json['createdByID'],
      lastUpdatedByID: json['lastUpdatedByID'],
      assignedToID: json['assignedToID'],
      steward: json['steward'] != null
          ? UserSummary.fromJson(json['steward'])
          : null,
      subSteward: json['subSteward'] != null
          ? UserSummary.fromJson(json['subSteward'])
          : null,
      updates: json['updates'] != null
          ? (json['updates'] as List).map((e) => Update.fromJson(e)).toList()
          : null,
      members: json['members'] != null
          ? (json['members'] as List)
              .map((e) => UserSummary.fromJson(e))
              .toList()
          : null,
      documents: json['documents'] != null
          ? (json['documents'] as List).map((e) => Doc.fromJson(e)).toList()
          : null,
      grievor: json['grievor'] != null
          ? SignatureInfo.fromJson(json['grievor'])
          : null,
      unionRep: json['unionRep'] != null
          ? SignatureInfo.fromJson(json['unionRep'])
          : null,
      unionOfficer: json['unionOfficer'] != null
          ? SignatureInfo.fromJson(json['unionOfficer'])
          : null,
    );
  }
}

class UserSummary {
  final String id;
  final String firstName;
  final String lastName;

  UserSummary({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory UserSummary.fromJson(Map<String, dynamic> json) {
    return UserSummary(
      id: json['id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }
}

class Doc {
  final String id;
  final String name;
  final String url;

  Doc({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Doc.fromJson(Map<String, dynamic> json) {
    return Doc(
      id: json['id'],
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}

class Update {
  final String updateID;
  final String content;
  final String updatedAt;
  final UserUpdatedBy updatedBy;

  Update({
    required this.updateID,
    required this.content,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      updateID: json['updateID'],
      content: json['content'],
      updatedAt: json['updatedAt'],
      updatedBy: UserUpdatedBy.fromJson(json['updatedBy']),
    );
  }
}

class UserUpdatedBy {
  final String id;
  final String firstName;
  final String lastName;
  final UserProfile profile;

  UserUpdatedBy({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profile,
  });

  factory UserUpdatedBy.fromJson(Map<String, dynamic> json) {
    return UserUpdatedBy(
      id: json['id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      profile: UserProfile.fromJson(json['profile']),
    );
  }
}

class UserProfile {
  final String imageURL;

  UserProfile({required this.imageURL});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      imageURL: json['imageURL'] ?? '',
    );
  }
}

class GrievanceResponse {
  final GrievanceDetail data;

  GrievanceResponse({required this.data});

  factory GrievanceResponse.fromJson(Map<String, dynamic> json) {
    return GrievanceResponse(
      data: GrievanceDetail.fromJson(json['getGrievanceById']),
    );
  }
}

class SignatureInfo {
  final String userId;
  final String sign; // base64 image string

  SignatureInfo({
    required this.userId,
    required this.sign,
  });

  factory SignatureInfo.fromJson(Map<String, dynamic> json) {
    return SignatureInfo(
      userId: json['userId'] ?? '',
      sign: json['sign'] ?? '',
    );
  }
}
