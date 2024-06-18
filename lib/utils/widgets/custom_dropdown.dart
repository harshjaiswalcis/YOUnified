// import 'package:younified/utils/exports/common_exports.dart';

// typedef ChangeValue = void Function(
//     {required String value, required BuildContext context});

// class CustomDropDown extends StatelessWidget {
//   final ChangeValue changeValue;
//   final List<ProductList> dataList;
//   final String currentSelection;

//   const CustomDropDown(
//       {super.key,
//       required this.currentSelection,
//       required this.dataList,
//       required this.changeValue});

//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     final List<DropdownMenuItem<String>> items = [];
//     for (final ProductList dataController in dataList) {
//       items.add(DropdownMenuItem(
//           value: dataController.id,
//           child: SizedBox(child: Text(dataController.name))));
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButtonFormField(
//             isExpanded: true,
//             hint: SizedBox(
//                 child: Text(
//               currentSelection,
//               overflow: TextOverflow.ellipsis,
//             )),
//             value: currentSelection,
//             isDense: true,
//             decoration: const InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               filled: true,
//             ),
//             items: getDropDownMenuItems(),
//             onChanged: (value) {
//               changeValue(context: context, value: value.toString());
//             },
//             style: const TextStyle(
//               fontSize: 18,
//               color: AppColors.greyText,
//               overflow: TextOverflow.ellipsis,
//             ),
//             dropdownColor: AppColors.white.withOpacity(0.9),
//             focusColor: AppColors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class GenderDropDown extends StatelessWidget {
//   final ChangeValue changeValue;
//   final List<GenderModel> dataList;
//   final String currentSelection;

//   const GenderDropDown(
//       {super.key,
//       required this.currentSelection,
//       required this.dataList,
//       required this.changeValue});

//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     final List<DropdownMenuItem<String>> items = [];
//     for (final GenderModel dataController in dataList) {
//       items.add(DropdownMenuItem(
//           value: dataController.id,
//           child: SizedBox(child: Text(dataController.name))));
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButtonFormField(
//             isExpanded: true,
//             hint: SizedBox(
//                 child: Text(
//               currentSelection,
//               style: context.textTheme.titleMedium,
//               overflow: TextOverflow.ellipsis,
//             )),
//             value: currentSelection,
//             isDense: true,
//             decoration: const InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               filled: true,
//             ),
//             items: getDropDownMenuItems(),
//             onChanged: (value) {
//               changeValue(context: context, value: value.toString());
//             },
//             style: context.textTheme.titleMedium!
//                 .copyWith(overflow: TextOverflow.ellipsis),
//             dropdownColor: AppColors.white.withOpacity(0.9),
//             focusColor: AppColors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // COUNTRY DROP DOWN
// class CountryDropDown extends StatelessWidget {
//   final List<CountryListData> dataList;
//   final String currentSelection;

//   const CountryDropDown({
//     super.key,
//     required this.currentSelection,
//     required this.dataList,
//   });

//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     final List<DropdownMenuItem<String>> items = [];
//     for (final CountryListData dataController in dataList) {
//       items.add(DropdownMenuItem(
//           value: dataController.id,
//           child: SizedBox(child: Text(dataController.name))));
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButtonFormField(
//             isExpanded: true,
//             hint: SizedBox(
//                 child: Text(
//               currentSelection,
//               style: context.textTheme.titleMedium,
//               overflow: TextOverflow.ellipsis,
//             )),
//             value: currentSelection,
//             isDense: true,
//             decoration: const InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               filled: true,
//             ),
//             items: getDropDownMenuItems(),
//             onChanged: (value) async {
//               final CountryListData data =
//                   dataList.firstWhere((element) => element.id == value);
//               shopProvider.countryPhoneCode.value = data.countryDialingCode;
//               shopProvider.dropDownCountrySelected.value = value!;
//               await shopProvider.areaCode(value);
//             },
//             style: context.textTheme.titleMedium!
//                 .copyWith(overflow: TextOverflow.ellipsis),
//             dropdownColor: AppColors.white.withOpacity(0.9),
//             focusColor: AppColors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
// class CountryDropDownBilling extends StatelessWidget {
//   final List<CountryListData> dataList;
//   final String currentSelection;

//   const CountryDropDownBilling({
//     super.key,
//     required this.currentSelection,
//     required this.dataList,
//   });

//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     final List<DropdownMenuItem<String>> items = [];
//     for (final CountryListData dataController in dataList) {
//       items.add(DropdownMenuItem(
//           value: dataController.id,
//           child: SizedBox(child: Text(dataController.name))));
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButtonFormField(
//             isExpanded: true,
//             hint: SizedBox(
//                 child: Text(
//               currentSelection,
//               style: context.textTheme.titleMedium,
//               overflow: TextOverflow.ellipsis,
//             )),
//             value: currentSelection,
//             isDense: true,
//             decoration: const InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               filled: true,
//             ),
//             items: getDropDownMenuItems(),
//             onChanged: (value) async {
//               final CountryListData data =
//                   dataList.firstWhere((element) => element.id == value);
//               shopProvider.bCountryPhoneCode.value = data.countryDialingCode;
//               shopProvider.bDropDownCountrySelected.value = value!;
//               await shopProvider.areaCodeForBilling(value);
//             },
//             style: context.textTheme.titleMedium!
//                 .copyWith(overflow: TextOverflow.ellipsis),
//             dropdownColor: AppColors.white.withOpacity(0.9),
//             focusColor: AppColors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

// //AREA ZONE DROP DOWN
// class AreaZoneDropDown extends StatelessWidget {
//   final ChangeValue changeValue;
//   final List<AreaCodeData> dataList;
//   final String currentSelection;

//   const AreaZoneDropDown(
//       {super.key,
//       required this.currentSelection,
//       required this.dataList,
//       required this.changeValue});

//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     final List<DropdownMenuItem<String>> items = [];
//     for (final AreaCodeData dataController in dataList) {
//       items.add(DropdownMenuItem(
//           value: dataController.id,
//           child: SizedBox(child: Text(dataController.name))));
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButtonFormField(
//             isExpanded: true,
//             hint: SizedBox(
//                 child: Text(
//               currentSelection,
//               style: context.textTheme.titleMedium,
//               overflow: TextOverflow.ellipsis,
//             )),
//             value: currentSelection,
//             isDense: true,
//             decoration: const InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               filled: true,
//             ),
//             items: getDropDownMenuItems(),
//             onChanged: (value) {
//               changeValue(context: context, value: value.toString());
//             },
//             style: context.textTheme.titleMedium!
//                 .copyWith(overflow: TextOverflow.ellipsis),
//             dropdownColor: AppColors.white.withOpacity(0.9),
//             focusColor: AppColors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
// class AreaZoneDropDownBilling extends StatelessWidget {
//   final ChangeValue changeValue;
//   final List<AreaCodeData> dataList;
//   final String currentSelection;

//   const AreaZoneDropDownBilling(
//       {super.key,
//       required this.currentSelection,
//       required this.dataList,
//       required this.changeValue});

//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     final List<DropdownMenuItem<String>> items = [];
//     for (final AreaCodeData dataController in dataList) {
//       items.add(DropdownMenuItem(
//           value: dataController.id,
//           child: SizedBox(child: Text(dataController.name))));
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButtonFormField(
//             isExpanded: true,
//             hint: SizedBox(
//                 child: Text(
//               currentSelection,
//               style: context.textTheme.titleMedium,
//               overflow: TextOverflow.ellipsis,
//             )),
//             value: currentSelection,
//             isDense: true,
//             decoration: const InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 borderSide: BorderSide(color: Colors.white, width: 0),
//               ),
//               filled: true,
//             ),
//             items: getDropDownMenuItems(),
//             onChanged: (value) {
//               changeValue(context: context, value: value.toString());
//             },
//             style: context.textTheme.titleMedium!
//                 .copyWith(overflow: TextOverflow.ellipsis),
//             dropdownColor: AppColors.white.withOpacity(0.9),
//             focusColor: AppColors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PhoneCodeDropDown extends StatelessWidget {
//   // final ChangeValue changeValue;
//   final List<CountryListData> dataList;
//   final String currentSelection;

//   const PhoneCodeDropDown({
//     super.key,
//     required this.currentSelection,
//     // required this.changeValue,
//     required this.dataList,
//   });

//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     final List<DropdownMenuItem<String>> items = [];
//     for (final CountryListData dataController in dataList) {
//       items.add(DropdownMenuItem(
//           value: dataController.countryDialingCode,
//           child: SizedBox(child: Text(dataController.countryDialingCode))));
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Center(
//         child: DropdownButtonHideUnderline(
//           child: SizedBox(
//             height: 50,
//             child: DropdownButtonFormField(
//               isExpanded: true,
//               hint: SizedBox(
//                   child: Text(
//                 currentSelection,
//                 style: context.textTheme.titleMedium,
//                 overflow: TextOverflow.ellipsis,
//               )),
//               value: currentSelection,
//               isDense: true,
//               decoration: const InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(16)),
//                   borderSide: BorderSide(color: Colors.white, width: 0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(16)),
//                   borderSide: BorderSide(color: Colors.white, width: 0),
//                 ),
//                 filled: true,
//               ),
//               items: getDropDownMenuItems(),
//               onChanged: (value) {
//                 shopProvider.countryPhoneCode.value = value!;
//               },
//               style: context.textTheme.titleMedium!
//                   .copyWith(overflow: TextOverflow.ellipsis),
//               dropdownColor: AppColors.white.withOpacity(0.9),
//               focusColor: AppColors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class PhoneCodeDropDownBilling extends StatelessWidget {
//   // final ChangeValue changeValue;
//   final List<CountryListData> dataList;
//   final String currentSelection;

//   const PhoneCodeDropDownBilling({
//     super.key,
//     required this.currentSelection,
//     // required this.changeValue,
//     required this.dataList,
//   });

//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     final List<DropdownMenuItem<String>> items = [];
//     for (final CountryListData dataController in dataList) {
//       items.add(DropdownMenuItem(
//           value: dataController.countryDialingCode,
//           child: SizedBox(child: Text(dataController.countryDialingCode))));
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Center(
//         child: DropdownButtonHideUnderline(
//           child: SizedBox(
//             height: 50,
//             child: DropdownButtonFormField(
//               isExpanded: true,
//               hint: SizedBox(
//                   child: Text(
//                 currentSelection,
//                 style: context.textTheme.titleMedium,
//                 overflow: TextOverflow.ellipsis,
//               )),
//               value: currentSelection,
//               isDense: true,
//               decoration: const InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(16)),
//                   borderSide: BorderSide(color: Colors.white, width: 0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(16)),
//                   borderSide: BorderSide(color: Colors.white, width: 0),
//                 ),
//                 filled: true,
//               ),
//               items: getDropDownMenuItems(),
//               onChanged: (value) {
//                 shopProvider.bCountryPhoneCode.value = value!;
//               },
//               style: context.textTheme.titleMedium!
//                   .copyWith(overflow: TextOverflow.ellipsis),
//               dropdownColor: AppColors.white.withOpacity(0.9),
//               focusColor: AppColors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
