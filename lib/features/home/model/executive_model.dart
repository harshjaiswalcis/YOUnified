class ExecutivesResponse {
  final GetExecutives getExecutives;

  ExecutivesResponse({required this.getExecutives});

  factory ExecutivesResponse.fromJson(Map<String, dynamic> json) {
    return ExecutivesResponse(
      getExecutives: GetExecutives.fromJson(json['data']['getExecutives']),
    );
  }
}

class GetExecutives {
  final int count;
  final List<User> users;

  GetExecutives({required this.count, required this.users});

  factory GetExecutives.fromJson(Map<String, dynamic> json) {
    return GetExecutives(
      count: json['Count'] ?? 0, // Handle null by defaulting to 0
      users: (json['Users'] as List).map((e) => User.fromJson(e)).toList(),
    );
  }
}

class User {
  final String id;
  final Display display;
  final String extension;
  final Profile profile;
  final String firstName;
  final String lastName;
  final String unionPosition;

  User({
    required this.id,
    required this.display,
    required this.extension,
    required this.profile,
    required this.firstName,
    required this.lastName,
    required this.unionPosition,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      display: Display.fromJson(json['display']),
      extension: json['extension'],
      profile: Profile.fromJson(json['profile']),
      firstName: json['firstName'],
      lastName: json['lastName'],
      unionPosition: json['unionPosition'],
    );
  }
}

class Display {
  final bool email;
  final bool extension;
  final bool mobile;

  Display({required this.email, required this.extension, required this.mobile});

  factory Display.fromJson(Map<String, dynamic> json) {
    return Display(
      email: json['email'],
      extension: json['extension'],
      mobile: json['mobile'],
    );
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
}
