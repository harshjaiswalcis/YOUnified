import 'package:younified/utils/exports/common_exports.dart';

class HomeController {

  // HOME LIST DATA
  static final List<Map<String, String>> homeList = [
    {
      "image": AppIcons.document,
      "title": "DOCUMENTS",
      "subtitle": "See your \ndocuments here."
    },
    {
      "image": AppIcons.executive,
      "title": "executives",
      "subtitle": "Find executives \nhere."
    },
    {
      "image": AppIcons.profile,
      "title": "profile",
      "subtitle": "Manage your \nprofile from here."
    },{
      "image": AppIcons.note,
      "title": "grievances",
      "subtitle": "See grievances \nhere."
    },
    {
      "image": AppIcons.perk,
      "title": "Perks",
      "subtitle": "Check out the \navailable perks."
    }
  ];

  //MAPPING
  static final List<HomeListModel> homeListData = homeList
    .map((mapData) => HomeListModel.fromMap(mapData))
    .toList();


  // HOME LIST DATA
  static final List<Map<String, String>> executiveList = [
  {
    "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
    "name": "Lina Vecchio",
    "role": "Administrator",
    "email": "lina.vecchio@unionstrategiesinc.com",
    "officePhone": "(647) 776 - 0950 EXT.879",
    "mobilePhone": "(416) 571 - 4706"
  },
  {
    "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
    "name": "Fred Vecchio",
    "role": "President",
    "email": "fvecchio@unionstrategiesinc.com",
    "officePhone": "(647) 776 - 0950 EXT.874",
    "mobilePhone": "(416) 571 - 4706"
  },
  {
    "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
    "name": "Leeanne Ward",
    "role": "Director of Operations",
    "email": "leeanne.ward@unionstrategiesinc.com",
    "officePhone": "(647) 776 - 0950 EXT.884",
    "mobilePhone": "(416) 571 - 4706"
  },
  {
    "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
    "name": "Lina Vecchio",
    "role": "Administrator",
    "email": "lina.vecchio@unionstrategiesinc.com",
    "officePhone": "(647) 776 - 0950 EXT.879",
    "mobilePhone": "(416) 571 - 4706"
  },
  {
    "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
    "name": "Fred Vecchio",
    "role": "President",
    "email": "fvecchio@unionstrategiesinc.com",
    "officePhone": "(647) 776 - 0950 EXT.874",
    "mobilePhone": "(416) 571 - 4706"
  },
  {
    "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
    "name": "Leeanne Ward",
    "role": "Director of Operations",
    "email": "leeanne.ward@unionstrategiesinc.com",
    "officePhone": "(647) 776 - 0950 EXT.884",
    "mobilePhone": "(416) 571 - 4706"
  }
];

  //MAPPING
  static final List<ExecutiveModel> executiveListData = executiveList
    .map((mapData) => ExecutiveModel.fromJson(mapData))
    .toList();
}
