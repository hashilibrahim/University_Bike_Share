import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_bike/app/core/app_router.dart';
import 'package:uni_bike/app/helpers/common_widget.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/modules/auth/vieww%20model/auth_provider.dart';
import 'package:uni_bike/app/utils/extensions.dart';

import '../../../utils/app_constants.dart';

class CreateProfileScreen extends StatefulWidget {
  final String phoneNumber;
  const CreateProfileScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  void initState() {
    super.initState();
    log("widget.phoneNumber   ::     ${widget.phoneNumber}");
    context.read<AuthProvider>().phoneCntrlr.text = widget.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.black,
      resizeToAvoidBottomInset: false,
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) => Container(
          height: Responsive.height * 100,
          width: Responsive.width * 100,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizeBoxH(80),
              CommonInkwell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: Responsive.height * 20,
                        width: Responsive.width * 100,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: AppConstants.drawerBgColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const commonTextWidget(
                                  color: AppConstants.white,
                                  text: "Open with",
                                  fontSize: 14,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Routes.back();
                                  },
                                  child: const commonTextWidget(
                                    color: AppConstants.red,
                                    text: "Cancel",
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            SizeBoxH(Responsive.height * 1.5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GalleryOrCameraWidget(
                                  icon: "assets/images/cameraIcon.png",
                                  title: "Camera",
                                  onTap: () {
                                    provider.changeProfilePhoto(false, context);
                                  },
                                ),
                                GalleryOrCameraWidget(
                                  icon: "assets/images/galleryIcon.png",
                                  title: "Gallery",
                                  onTap: () {
                                    provider.changeProfilePhoto(true, context);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: provider.thumbnailImage == null
                      ? Image.asset(
                          "assets/images/cameraIcon.png",
                          width: Responsive.width * 25,
                          height: Responsive.height * 13,
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          const Base64Decoder().convert(provider.encodeImage),
                          fit: BoxFit.cover,
                          width: Responsive.width * 25,
                          height: Responsive.height * 13,
                        ),
                ),
              ),
              const SizeBoxH(30),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "Full name",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: provider.nameCntrlr,
              ),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "phone number",
                keyboardType: TextInputType.phone,
                maxLength: 10,
                readOnly: true,
                textInputAction: TextInputAction.next,
                controller: provider.phoneCntrlr,
              ),
              const SizeBoxH(10),
              Container(
                width: Responsive.width * 100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CommonInkwell(
                          onTap: () {
                            provider.genderSelect("male");
                          },
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: AppConstants.appPrimaryColor,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: AppConstants.black,
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor:
                                    provider.selectedGender == "male"
                                        ? AppConstants.appPrimaryColor
                                        : AppConstants.black,
                              ),
                            ),
                          ),
                        ),
                        const SizeBoxV(10),
                        const commonTextWidget(
                          color: AppConstants.white,
                          text: "Male",
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CommonInkwell(
                          onTap: () {
                            provider.genderSelect("female");
                          },
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: AppConstants.appPrimaryColor,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: AppConstants.black,
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor:
                                    provider.selectedGender == "female"
                                        ? AppConstants.appPrimaryColor
                                        : AppConstants.black,
                              ),
                            ),
                          ),
                        ),
                        const SizeBoxV(10),
                        const commonTextWidget(
                          color: AppConstants.white,
                          text: "Female",
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CommonInkwell(
                          onTap: () {
                            provider.genderSelect("others");
                          },
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: AppConstants.appPrimaryColor,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: AppConstants.black,
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor:
                                    provider.selectedGender == "others"
                                        ? AppConstants.appPrimaryColor
                                        : AppConstants.black,
                              ),
                            ),
                          ),
                        ),
                        const SizeBoxV(10),
                        const commonTextWidget(
                          color: AppConstants.white,
                          text: "Others",
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "Departments",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: provider.departmnetCntrlr,
              ),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "Hostel Name",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: provider.branchCntrlr,
              ),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "College Id",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: provider.idCntrlr,
              ),
              const Spacer(),
              CommonButton(
                onTap: () {
                  provider.createUserFn(context: context);
                },
                text: "Submit",
                width: Responsive.width * 100,
                height: Responsive.height * 6,
              ),
              const SizeBoxH(30)
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryOrCameraWidget extends StatelessWidget {
  final String icon;
  final String title;
  final void Function() onTap;
  const GalleryOrCameraWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            icon,
            height: 50,
          ),
          const SizeBoxH(10),
          commonTextWidget(
            color: AppConstants.white,
            text: title,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
