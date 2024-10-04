import 'package:cached_network_image/cached_network_image.dart';
import 'package:younified/utils/exports/common_exports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // onTap: () => context.pushNamed(Routes.notificationScreen),
            child: Text(context.strings.save, style: context.textTheme.labelSmall,),
          ),
          const SizedBox(width: 26),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 12.0, bottom: 16),
        child: FloatingActionButton(
          onPressed: () {},
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
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://api.multiavatar.com/Binx Bond.png",
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                backgroundImage: imageProvider,
                                radius: 60,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
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
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Name and Surname
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: context.textTheme.titleLarge,
                          ),
                          Text(
                            'Surname',
                            style: context.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          // Log Out Button
                          SizedBox(
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
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Text Fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      // controller: emailController,
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
                      // controller: emailController,
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
                      // controller: emailController,
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
                      // controller: emailController,
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
                      // controller: emailController,
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
                      // controller: emailController,
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
                      // controller: emailController,
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
