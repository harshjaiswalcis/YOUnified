import 'dart:io';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:younified/features/home/model/executive_model.dart';
import 'package:younified/features/home/model/login_with_token.dart';
import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/graphql_utils/graphql_mutations/home_mutations.dart';

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
  UserData? userData;

  /// -------------------- EXECUTIVE FETCHING --------------------
  Future<GetExecutives?> fetchExecutive() async {
    final result = await appProvider.fetchData<GetExecutives?>(
      query: gql(HomeModulesQueries.getExecutives),
      variables: {
        "unionId": StorageServices.getString('unionId'),
        "page": 1,
        "limit": 3
      },
      parse: _parseExecutiveData,
    );
    return result;
  }

  GetExecutives? _parseExecutiveData(Map<String, dynamic>? data) {
    final executivesData = data?['getExecutives'];
    return executivesData != null
        ? GetExecutives.fromJson(executivesData)
        : null;
  }

  /// -------------------- PROFILE FETCHING --------------------
  Future<UserData?> fetchProfile() async {
    StorageServices.getString('token').toLog();
    final result = await appProvider.fetchData<UserData?>(
      query: gql(HomeModulesQueries.profile),
      variables: {
        'token': StorageServices.getString('token'),
      },
      parse: _parseFetchProfile,
    );
    if (result != null) {
      userData = result;
    }
    return result;
  }

  UserData? _parseFetchProfile(Map<String, dynamic>? data) {
    final userDataMap = data?['loginWithToken']?['User'];
    return userDataMap != null ? UserData.fromJson(userDataMap) : null;
  }

  /// -------------------- UPDATE USER --------------------
  Future<UserData?> updateUser(
    String firstname,
    String lastname,
    String username,
    String status,
    String unit,
    String employmentStatus,
    String unionPosition,
  ) async {
    final result = await appProvider.fetchData<UserData?>(
      query: gql(HomeMutations.updateUser),
      variables: {
        "input": {
          "firstName": firstname,
          "lastName": lastname,
          "status": status,
          "unit": unit,
          "employmentStatus": employmentStatus,
          "unionPosition": unionPosition,
          "profile": {"email": username}
        }
      },
      parse: _parseupdateProfile,
    );
    if (result != null) {
      userData = result;
    }
    return result;
  }

  UserData? _parseupdateProfile(Map<String, dynamic>? data) {
    final userDataMap = data?['updateUser'];
    return userDataMap != null ? UserData.fromJson(userDataMap) : null;
  }

  Future<String?> uploadProfile(
    File image,
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      QueryResult result = await GraphQLService.client.query(
        QueryOptions(
          document: gql(HomeMutations.uploadProfile),
          variables: {
            "unionId": StorageServices.getString('unionId'),
            "userId": StorageServices.getString('userId'),
            "file": image,
          },
          fetchPolicy: FetchPolicy.noCache,
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
        log(result.data.toString());
        isLoading = false;
        notifyListeners();
        return "Profile Picture upload successfully";
      }
    } catch (e) {
      errorMessage = e.toString();
      log(errorMessage!);
      isLoading = false;
      notifyListeners();
    }

    return null;
  }
}
