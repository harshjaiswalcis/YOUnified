class GenericResponse {
  final UserData user;

  GenericResponse({required this.user});

  factory GenericResponse.fromJson(Map<String, dynamic> json) {
    // Extract the 'User' key directly from the JSON
    final userData = json['User'];
    if (userData == null) {
      throw Exception('Key "User" not found in the response JSON.');
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
  final bool? callOpOut;
  final bool? emailOpOut;
  final bool? textOpOut;
  final bool? pushOpOut;
  final bool? regEmailOpOut;
  // final bool? unionOpOut;

  UserData({
    this.profile,
    this.callOpOut,
    this.emailOpOut,
    this.textOpOut,
    this.pushOpOut,
    this.regEmailOpOut,
    // this.unionOpOut,
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
      callOpOut: json['callOpOut'],
      emailOpOut: json['emailOpOut'],
      textOpOut: json['textOpOut'],
      pushOpOut: json['pushOpOut'],
      regEmailOpOut: json['regEmailOpOut'],
      // unionOpOut: json['unionOpOut'],
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
