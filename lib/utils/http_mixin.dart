import 'package:younified/utils/exports/common_exports.dart';
import 'package:http/http.dart' as http;

mixin HttpMixin {
  // Future<Response> httpGet(String url,
  //     {bool authorization = true,
  //     Map<String, String>? authorizationObject}) async {
  //   final Map<String, String> headers = {"Languageid": languageId.value};

  //   if (authorization) {
  //     if (authorizationObject == null) {
  //     } else {
  //       headers.addAll(authorizationObject);
  //     }
  //   }
  //   final Response response = await http.get(url.toUri(), headers: headers);
  //   if (response.statusCode == 401) {
  //     StorageServices.setString('token', '');
  //     StorageServices.setString("lang", "");
  //     StorageServices.setString("langId", "");
  //     StorageServices.clearSharedPreferences();
  //     if (NavigationService.context.mounted) {}
  //     NavigationService.context.pushNamedAndRemoveUntil(Routes.loginScreen);
  //     NavigationService.context.appProvider.appNavIndex.value = 0;
  //   } else if (response.statusCode == 500) {
  //     if (NavigationService.context.mounted) {}
  //     NavigationService.context.showAppSnackBar(
  //         title: NavigationService.context.strings.somethingWentWrong,
  //         textColor: AppColors.redText);
  //   }
  //   return response;

  //   // return await http.get(url.toUri(), headers: authorizationObject);
  // }

  // Future<Response> httpPost(String url,
  //     {bool authorization = true,
  //     Object? body,
  //     Map<String, String>? authorizationObject}) async {
  //   "----------Languageid ${languageId.value.runtimeType}".toLog();
  //   final Map<String, String> headers = {"Languageid": languageId.value};
  //   if (authorization) {
  //     if (authorizationObject == null) {
  //     } else {
  //       headers.addAll(authorizationObject);
  //     }
  //   }
  //   final Response response =
  //       await http.post(url.toUri(), body: body, headers: headers);
  //   if (response.statusCode == 401) {
  //     StorageServices.setString('token', '');
  //     StorageServices.setString("lang", "");
  //     StorageServices.setString("langId", "");
  //     StorageServices.clearSharedPreferences();
  //     if (NavigationService.context.mounted) {}
  //     NavigationService.context.pushNamedAndRemoveUntil(Routes.loginScreen);
  //     NavigationService.context.appProvider.appNavIndex.value = 0;
  //   } else if (response.statusCode == 500) {
  //     if (NavigationService.context.mounted) {}
  //     NavigationService.context.showAppSnackBar(
  //         title: NavigationService.context.strings.somethingWentWrong,
  //         textColor: AppColors.redText);
  //   }
  //   return response;

  //   // return await http.post(url.toUri(),
  //   //     body: body, headers: authorizationObject);
  // }

}
