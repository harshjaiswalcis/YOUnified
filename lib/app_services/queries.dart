class Queries {
  // unionByName
  static const String unionByName = '''
     query UnionByName(\$name: String!) {
      unionByName(name: \$name) {
        id
        name
        status
        bargainingUnits
        bannerURL
        callDropNumber
        domain
        bannedDomains
        theme
        twitter
        twitterLinks
        facebook
        facebookLinks
        instagram
        instagramLinks
        themeImage
        zoomID
        hostEmail
        defaultEmailPassword
      }
    }
  ''';
}
