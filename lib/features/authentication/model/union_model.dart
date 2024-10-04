class UnionModel {
  final String id;
  final String name;
  final int status;
  final String? bargainingUnits;
  final String bannerURL;
  final String callDropNumber;
  final String domain;
  final String? bannedDomains;
  final String theme;
  final String twitter;
  final String? twitterLinks;
  final String facebook;
  final String? facebookLinks;
  final String instagram;
  final String? instagramLinks;
  final String themeImage;
  final String zoomID;
  final String? hostEmail;
  final String defaultEmailPassword;

  UnionModel({
    required this.id,
    required this.name,
    required this.status,
    this.bargainingUnits,
    required this.bannerURL,
    required this.callDropNumber,
    required this.domain,
    this.bannedDomains,
    required this.theme,
    required this.twitter,
    this.twitterLinks,
    required this.facebook,
    this.facebookLinks,
    required this.instagram,
    this.instagramLinks,
    required this.themeImage,
    required this.zoomID,
    this.hostEmail,
    required this.defaultEmailPassword,
  });

  // Factory method to create UnionModel from JSON
  factory UnionModel.fromJson(Map<String, dynamic> json) {
    return UnionModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      bargainingUnits: json['bargainingUnits'],
      bannerURL: json['bannerURL'],
      callDropNumber: json['callDropNumber'],
      domain: json['domain'],
      bannedDomains: json['bannedDomains'],
      theme: json['theme'],
      twitter: json['twitter'],
      twitterLinks: json['twitterLinks'],
      facebook: json['facebook'],
      facebookLinks: json['facebookLinks'],
      instagram: json['instagram'],
      instagramLinks: json['instagramLinks'],
      themeImage: json['themeImage'],
      zoomID: json['zoomID'],
      hostEmail: json['hostEmail'],
      defaultEmailPassword: json['defaultEmailPassword'],
    );
  }

  // Method to convert UnionModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'bargainingUnits': bargainingUnits,
      'bannerURL': bannerURL,
      'callDropNumber': callDropNumber,
      'domain': domain,
      'bannedDomains': bannedDomains,
      'theme': theme,
      'twitter': twitter,
      'twitterLinks': twitterLinks,
      'facebook': facebook,
      'facebookLinks': facebookLinks,
      'instagram': instagram,
      'instagramLinks': instagramLinks,
      'themeImage': themeImage,
      'zoomID': zoomID,
      'hostEmail': hostEmail,
      'defaultEmailPassword': defaultEmailPassword,
    };
  }
}