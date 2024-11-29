class ExecutiveResponse {
  final ExecutiveData data;

  ExecutiveResponse({required this.data});

  factory ExecutiveResponse.fromJson(Map<String, dynamic> json) {
    return ExecutiveResponse(
      data: ExecutiveData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class ExecutiveData {
  final List<Executive> executives;

  ExecutiveData({required this.executives});

  factory ExecutiveData.fromJson(Map<String, dynamic> json) {
    return ExecutiveData(
      executives: (json['executives'] as List)
          .map((item) => Executive.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'executives': executives.map((e) => e.toJson()).toList(),
    };
  }
}

class Executive {
  final String id;
  final String position;
  final Display display;
  final String extension;
  final MemberData memberData;

  Executive({
    required this.id,
    required this.position,
    required this.display,
    required this.extension,
    required this.memberData,
  });

  factory Executive.fromJson(Map<String, dynamic> json) {
    return Executive(
      id: json['id'],
      position: json['position'],
      display: Display.fromJson(json['display']),
      extension: json['extension'],
      memberData: MemberData.fromJson(json['memberData']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'position': position,
      'display': display.toJson(),
      'extension': extension,
      'memberData': memberData.toJson(),
    };
  }
}

class Display {
  final bool email;
  final bool extension;
  final bool mobile;

  Display({
    required this.email,
    required this.extension,
    required this.mobile,
  });

  factory Display.fromJson(Map<String, dynamic> json) {
    return Display(
      email: json['email'],
      extension: json['extension'],
      mobile: json['mobile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'extension': extension,
      'mobile': mobile,
    };
  }
}

class MemberData {
  final Profile profile;
  final String firstName;
  final String lastName;
  final String unionPosition;

  MemberData({
    required this.profile,
    required this.firstName,
    required this.lastName,
    required this.unionPosition,
  });

  factory MemberData.fromJson(Map<String, dynamic> json) {
    return MemberData(
      profile: Profile.fromJson(json['profile']),
      firstName: json['firstName'],
      lastName: json['lastName'],
      unionPosition: json['unionPosition'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile': profile.toJson(),
      'firstName': firstName,
      'lastName': lastName,
      'unionPosition': unionPosition,
    };
  }
}

class Profile {
  final String email;
  final String phone;
  final String mobile;
  final String imageURL;

  Profile({
    required this.email,
    required this.phone,
    required this.mobile,
    required this.imageURL,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      email: json['email'],
      phone: json['phone'],
      mobile: json['mobile'],
      imageURL: json['imageURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'mobile': mobile,
      'imageURL': imageURL,
    };
  }
}
