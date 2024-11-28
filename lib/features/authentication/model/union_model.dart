class UnionModel {
  final String id;
  final int status;
  final String name;
  final String unionID;
  final UnionInformation? information;

  UnionModel({
    required this.id,
    required this.name,
    required this.status,
    required this.unionID,
    required this.information,
  });

  // Factory method to create UnionModel from JSON
  factory UnionModel.fromJson(Map<String, dynamic> json) {
    return UnionModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      unionID: json['unionID'],
      information: json['information'] != null
          ? UnionInformation.fromJson(json['information'])
          : null,
    );
  }

  // Method to convert UnionModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'unionID': unionID,
      'information': information?.toJson(),
    };
  }
}

class UnionInformation {
  final String? imageURL;

  UnionInformation({this.imageURL});

  factory UnionInformation.fromJson(Map<String, dynamic> json) {
    return UnionInformation(
      imageURL: json['imageURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageURL': imageURL,
    };
  }
}
