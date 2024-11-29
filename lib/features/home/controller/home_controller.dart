import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_error_handler.dart';

class HomeProvider extends ChangeNotifier {
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
    },
    {
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
  static final List<HomeListModel> homeListData =
      homeList.map((mapData) => HomeListModel.fromMap(mapData)).toList();

  // // EXECUTIVE LIST DATA
  // static final List<Map<String, String>> executiveList = [
  //   {
  //     "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
  //     "name": "Lina Vecchio",
  //     "role": "Administrator",
  //     "email": "lina.vecchio@unionstrategiesinc.com",
  //     "officePhone": "(647) 776 - 0950 EXT.879",
  //     "mobilePhone": "(416) 571 - 4706"
  //   },
  //   {
  //     "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
  //     "name": "Fred Vecchio",
  //     "role": "President",
  //     "email": "fvecchio@unionstrategiesinc.com",
  //     "officePhone": "(647) 776 - 0950 EXT.874",
  //     "mobilePhone": "(416) 571 - 4706"
  //   },
  //   {
  //     "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
  //     "name": "Leeanne Ward",
  //     "role": "Director of Operations",
  //     "email": "leeanne.ward@unionstrategiesinc.com",
  //     "officePhone": "(647) 776 - 0950 EXT.884",
  //     "mobilePhone": "(416) 571 - 4706"
  //   },
  //   {
  //     "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
  //     "name": "Lina Vecchio",
  //     "role": "Administrator",
  //     "email": "lina.vecchio@unionstrategiesinc.com",
  //     "officePhone": "(647) 776 - 0950 EXT.879",
  //     "mobilePhone": "(416) 571 - 4706"
  //   },
  //   {
  //     "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
  //     "name": "Fred Vecchio",
  //     "role": "President",
  //     "email": "fvecchio@unionstrategiesinc.com",
  //     "officePhone": "(647) 776 - 0950 EXT.874",
  //     "mobilePhone": "(416) 571 - 4706"
  //   },
  //   {
  //     "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
  //     "name": "Leeanne Ward",
  //     "role": "Director of Operations",
  //     "email": "leeanne.ward@unionstrategiesinc.com",
  //     "officePhone": "(647) 776 - 0950 EXT.884",
  //     "mobilePhone": "(416) 571 - 4706"
  //   }
  // ];

  // // //MAPPING
  // static final List<ExecutiveModel> executiveListData =
  //     executiveList.map((mapData) => ExecutiveModel.fromJson(mapData)).toList();

  // PERK LIST DATA
  static final List<Map<String, dynamic>> perkList = [
    {
      "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
      "title": "Lorem ipsum HOTEL",
      "subtitle": "Dolor sit amet consectetur",
      "price": "\$15",
      "duration": "/hour",
      "rating": 4,
      "category": "New & Local"
    },
    {
      "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
      "title": "Salon & Spa",
      "subtitle": "Dolor sit amet conse",
      "price": "\$20",
      "duration": "/hour",
      "rating": 4,
      "category": "Health + Fitness"
    },
    {
      "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
      "title": "Gym membership",
      "subtitle": "Dolor sit amet conse",
      "price": "\$50",
      "duration": "/week",
      "rating": 4,
      "category": "Health + Fitness"
    },
    {
      "imageUrl": "https://api.multiavatar.com/Binx Bond.png",
      "title": "Travel Package",
      "subtitle": "Dolor sit amet conse",
      "price": "\$100",
      "duration": "/day",
      "rating": 4,
      "category": "Travel"
    }
  ];

//MAPPING
  static final List<PerkModel> perkListData =
      perkList.map((mapData) => PerkModel.fromJson(mapData)).toList();

  // UnionModel? unionData;
  bool isLoading = false;
  String? errorMessage;

  Future<ExecutiveData?> fetchExecutive() async {
    isLoading = true;

    try {
      QueryResult result = await GraphQLService.client.query(
        QueryOptions(
          document: gql(HomeModulesQueries.executive),
          variables: {
            'unionId': StorageServices.getString('unionId'),
            'category': '',
          },
        ),
      );

      if (result.hasException) {
        List<String> errorMessages =
            GraphQLErrorHandler.extractErrorMessages(result.exception);
        errorMessage = errorMessages.isNotEmpty
            ? errorMessages.first
            : "Unknown error occurred.";

        log(errorMessage!);
        isLoading = false;
        notifyListeners();
        return null;
      }

      if (result.data != null) {
        final executives = ExecutiveData.fromJson(result.data!);
        isLoading = false;
        notifyListeners();
        return executives;
      }
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
    return null;
  }
}
