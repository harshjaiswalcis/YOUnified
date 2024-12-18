import 'dart:io';

import 'package:younified/utils/exports/common_exports.dart';
import 'package:younified/utils/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final TextEditingController userNameController =
      TextEditingController();
  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lastNameController =
      TextEditingController();
  static final TextEditingController statusController = TextEditingController();
  static final TextEditingController unitController = TextEditingController();
  static final TextEditingController employmentStatusController =
      TextEditingController();
  static final TextEditingController unionPositionController =
      TextEditingController();
  File? selectedImage;

  @override
  void initState() {
    userNameController.text = homeProvider.userData!.username;
    lastNameController.text = homeProvider.userData!.lastName;
    firstNameController.text = homeProvider.userData!.firstName;
    statusController.text = homeProvider.userData!.status;
    unitController.text = homeProvider.userData!.unit;
    employmentStatusController.text = homeProvider.userData!.employmentStatus;
    unionPositionController.text = homeProvider.userData!.unionPosition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        title: Text(
          context.strings.profile,
          style: context.textTheme.headlineLarge,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
        ),
        leadingWidth: 30,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () async {
              homeProvider
                  .updateUser(
                      firstNameController.text,
                      lastNameController.text,
                      userNameController.text,
                      statusController.text,
                      unitController.text,
                      employmentStatusController.text,
                      unionPositionController.text)
                  .then(
                (value) {
                  if (homeProvider.errorMessage == null) {
                    // context.pushNamed(Routes.profileScreen);
                    context.showAppSnackBar(
                      title: 'Profile Updated successfully',
                      textColor: AppColors.greenContainerbg,
                    );
                  } else {
                    context.showAppSnackBar(
                      title: homeProvider.errorMessage ?? 'Unknown error',
                      textColor: AppColors.redText,
                    );
                    homeProvider.errorMessage = null;
                  }
                },
              );
            },
            child: Text(
              context.strings.save,
              style: context.textTheme.labelSmall,
            ),
          ),
          const SizedBox(width: 26),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 12.0, bottom: 16),
        child: FloatingActionButton(
          onPressed: () => context.pushNamed(Routes.qrScreen),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(50), // This maintains circular shape
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              SvgPicture.asset(AppIcons.qr),
              const SizedBox(height: 2),
              Text(
                context.strings.qr,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
        child: SingleChildScrollView(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blueIconColor.withOpacity(0.12),
                  spreadRadius: 2,
                  blurRadius: 30,
                  offset: const Offset(0, 17),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20), // Spacing from the top
                  // Profile Picture with camera overlay
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            child: selectedImage == null
                                ? homeProvider
                                        .userData!.profile!.imageURL.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            "https://api.multiavatar.com/Binx Bond.png",
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                CircleAvatar(
                                          backgroundImage: imageProvider,
                                          radius: 60,
                                        ),
                                      )
                                    : const CircleAvatar(
                                        backgroundImage:
                                            AssetImage(AppIcons.emptyProfile),
                                        radius: 60,
                                      )
                                : CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: Image.file(
                                        selectedImage!,
                                        fit: BoxFit.cover,
                                        width:
                                            120, // Adjust the width as needed
                                        height:
                                            120, // Adjust the height as needed
                                      ),
                                    ),
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: InkWell(
                              onTap: () async {
                                final File? img =
                                    await ImagePickerService().getFromGallery();

                                setState(() {
                                  img.toString().toLog();
                                  selectedImage = img;
                                });
                                // if (selectedImage != null) {
                                //   await homeProvider
                                //       .uploadProfile(selectedImage!)
                                //       .then((value) {
                                //     if (homeProvider.errorMessage == null) {
                                //       context.showAppSnackBar(
                                //         title: value!,
                                //         textColor: AppColors.greenContainerbg,
                                //       );
                                //     } else {
                                //       context.showAppSnackBar(
                                //         title: homeProvider.errorMessage ??
                                //             'Unknown error',
                                //         textColor: AppColors.redText,
                                //       );
                                //       homeProvider.errorMessage = null;
                                //     }
                                //   });
                                // }
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.backGround,
                                    width: 1, // 1px border
                                  ),
                                ),
                                child: const CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.iconBgColor,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 20,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Name and Surname
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            firstNameController.text,
                            style: context.textTheme.titleLarge,
                          ),
                          Text(
                            lastNameController.text,
                            style: context.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          // Log Out Button
                          GestureDetector(
                            onTap: () {
                              StorageServices.delete('token');
                              StorageServices.delete('userId');
                              StorageServices.delete('unionId');
                              StorageServices.delete('imageURL');
                              StorageServices.delete('unionName');
                              context
                                  .pushNamedAndRemoveUntil(Routes.loginScreen);
                            },
                            child: SizedBox(
                              height: 40,
                              width: 115,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0x265783EF),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(AppIcons.logout),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      context.strings.logOut,
                                      style: context.textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Text Fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      controller: firstNameController,
                      style: context.textTheme.titleMedium,
                      decoration:
                          InputDecoration(hintText: context.strings.firstName),
                      // textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      controller: lastNameController,
                      style: context.textTheme.titleMedium,
                      decoration:
                          InputDecoration(hintText: context.strings.lastName),
                      // textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      controller: userNameController,
                      style: context.textTheme.titleMedium,
                      decoration:
                          InputDecoration(hintText: context.strings.username),
                      // textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      controller: statusController,
                      style: context.textTheme.titleMedium,
                      decoration:
                          InputDecoration(hintText: context.strings.status),
                      // textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      controller: unitController,
                      style: context.textTheme.titleMedium,
                      decoration:
                          InputDecoration(hintText: context.strings.unit),
                      // textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      controller: employmentStatusController,
                      style: context.textTheme.titleMedium,
                      decoration: InputDecoration(
                          hintText: context.strings.employmentStatus),
                      // textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      controller: unionPositionController,
                      style: context.textTheme.titleMedium,
                      decoration: InputDecoration(
                          hintText: context.strings.unionPosition),
                      // textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
