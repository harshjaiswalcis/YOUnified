// import 'dart:io';

// import 'package:flutter/services.dart';
// // import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:younified/utils/app_extensions.dart';

// class ImagePickerService {
//   Future<File?> getFromGallery() async {
//     try {
//       final XFile? pickedFile = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//         maxWidth: 1800,
//         maxHeight: 1800,
//       );
//       if (pickedFile != null) {
//         final File img = File(pickedFile.path);
//         // img = await cropImage(image: img);

//         img.toLog();
//         return img;
//       }
//     } on PlatformException catch (e) {
//       e.toString().toLog();
//     }
//     return null;
//   }

//   /// Get from camera
//   Future<File?> getFromCamera() async {
//     try {
//       final XFile? pickedFile = await ImagePicker().pickImage(
//         source: ImageSource.camera,
//         maxWidth: 1800,
//         maxHeight: 1800,
//       );
//       if (pickedFile != null) {
//         final File img = File(pickedFile.path);
//         // img = await cropImage(image: img);
//         img.toLog();
//         return img;
//       }
//     } on PlatformException catch (e) {
//       e.toString().toLog();
//     }
//     return null;
//   }

//   // Future<File?> cropImage({required File image}) async {
//   //   CroppedFile? croppedImage = await ImageCropper()
//   //       .cropImage(sourcePath: image.path, cropStyle: CropStyle.circle);

//   //   if (croppedImage == null) return null;
//   //   return File(croppedImage.path);
//   // }
// }
