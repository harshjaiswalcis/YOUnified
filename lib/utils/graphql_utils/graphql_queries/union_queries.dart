class Queries {
  // unionByName
  static const String unionByName = '''
     query UnionByName(\$name: String!) {
      unionByName(name: \$name) {
        id
        name
        status
        unionID
        information {
          imageURL
        }
      }
    }
  ''';
}
