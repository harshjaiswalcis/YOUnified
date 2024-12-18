class GenericResponse {
  final UserData user;

  GenericResponse({required this.user});

  factory GenericResponse.fromJson(Map<String, dynamic> json, String key) {
    // Ensure the specified key exists in the JSON
    final userData = json[key];
    if (userData == null) {
      throw Exception('Key "$key" not found in the response JSON.');
    }

    return GenericResponse(
      user: UserData.fromJson(userData),
    );
  }
}

class UserData {
  final String username;
  final String status;
  final String lastName;
  final String firstName;
  final String unit;
  final String employmentStatus;
  final String unionPosition;
  final UserProfile? profile;

  UserData({
    this.profile,
    required this.username,
    required this.status,
    required this.lastName,
    required this.firstName,
    required this.unit,
    required this.employmentStatus,
    required this.unionPosition,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json['username'] ?? '',
      status: json['status'] ?? '',
      lastName: json['lastName'] ?? '',
      firstName: json['firstName'] ?? '',
      unit: json['unit'] ?? '',
      employmentStatus: json['employmentStatus'] ?? '',
      unionPosition: json['unionPosition'] ?? '',
      profile: json['profile'] != null
          ? UserProfile.fromJson(json['profile'])
          : null,
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
