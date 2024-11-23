import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_bike/app/helpers/common_widget.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/modules/home/view%20model/home_provider.dart';
import 'package:uni_bike/app/utils/enums.dart';
import 'package:uni_bike/app/utils/extensions.dart';

import '../../../core/string_const.dart';
import '../../../utils/app_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getProfileFn(ctx: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.black,
      resizeToAvoidBottomInset: false,
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return provider.profileStatus == ProfileStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : provider.profileStatus == ProfileStatus.loaded
                  ? Container(
                      height: Responsive.height * 100,
                      width: Responsive.width * 100,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const SizeBoxH(80),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.memory(
                              const Base64Decoder().convert(
                                provider.profileModel["profilePicture"] ?? "",
                              ),
                              fit: BoxFit.cover,
                              width: Responsive.width * 25,
                              height: Responsive.height * 13,
                            ),
                          ),
                          const SizeBoxH(30),
                          Container(
                            width: Responsive.width * 100,
                            height: Responsive.height * 6,
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.width * 5),
                            decoration: BoxDecoration(
                              color: AppConstants.drawerBgColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: commonTextWidget(
                                  color: AppConstants.white,
                                  text: provider.profileModel["fullName"]
                                      .toString()),
                            ),
                          ),
                          const SizeBoxH(10),
                          Container(
                            width: Responsive.width * 100,
                            height: Responsive.height * 6,
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.width * 5),
                            decoration: BoxDecoration(
                              color: AppConstants.drawerBgColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: commonTextWidget(
                                  color: AppConstants.white,
                                  text: provider.profileModel["mobileNumber"]
                                      .toString()),
                            ),
                          ),
                          const SizeBoxH(10),
                          Container(
                            width: Responsive.width * 100,
                            height: Responsive.height * 6,
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.width * 5),
                            decoration: BoxDecoration(
                              color: AppConstants.drawerBgColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: commonTextWidget(
                                color: AppConstants.white,
                                text: provider.profileModel["gender"] ?? "",
                              ),
                            ),
                          ),
                          const SizeBoxH(10),
                          Container(
                            width: Responsive.width * 100,
                            height: Responsive.height * 6,
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.width * 5),
                            decoration: BoxDecoration(
                              color: AppConstants.drawerBgColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: commonTextWidget(
                                color: AppConstants.white,
                                text: provider.profileModel["departMent"] ?? "",
                              ),
                            ),
                          ),
                          const SizeBoxH(10),
                          Container(
                            width: Responsive.width * 100,
                            height: Responsive.height * 6,
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.width * 5),
                            decoration: BoxDecoration(
                              color: AppConstants.drawerBgColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: commonTextWidget(
                                color: AppConstants.white,
                                text: provider.profileModel["collegeId"] ?? "",
                              ),
                            ),
                          ),
                          const SizeBoxH(10),
                          Container(
                            width: Responsive.width * 100,
                            height: Responsive.height * 6,
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.width * 5),
                            decoration: BoxDecoration(
                              color: AppConstants.drawerBgColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: commonTextWidget(
                                color: AppConstants.white,
                                text: provider.profileModel["departMent"] ?? "",
                              ),
                            ),
                          ),
                          const SizeBoxH(10),
                          const SizeBoxH(20),
                          CommonButton(
                            onTap: () {
                              StringConst.logout();
                            },
                            text: "Logout",
                            width: Responsive.width * 100,
                            height: Responsive.height * 6,
                            bgColor: Colors.red,
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: Text("No Data"),
                    );
        },
      ),
    );
  }
}
