class ExecutiveModel {
  String? imageUrl;
  String? name;
  String? role;
  String? email;
  String? officePhone;
  String? mobilePhone;

  ExecutiveModel({
    this.imageUrl,
    this.name,
    this.role,
    this.email,
    this.officePhone,
    this.mobilePhone,
  });

  factory ExecutiveModel.fromJson(Map<String, dynamic> json) {
    return ExecutiveModel(
      imageUrl: json['imageUrl'],
      name: json['name'],
      role: json['role'],
      email: json['email'],
      officePhone: json['officePhone'],
      mobilePhone: json['mobilePhone'],
    );
  }
}
