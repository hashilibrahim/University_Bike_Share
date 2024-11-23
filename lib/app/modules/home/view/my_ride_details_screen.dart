import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/modules/create%20ride/model/get_all-rides_moidel.dart';
import 'package:uni_bike/app/modules/home/view%20model/home_provider.dart';
import 'package:uni_bike/app/modules/home/view/home_screen.dart';
import 'package:uni_bike/app/utils/extensions.dart';

import '../../../core/app_router.dart';
import '../../../helpers/common_widget.dart';
import '../../../utils/app_constants.dart';
import '../widget/active_rides_container.dart';

class MyRideDetailsScreen extends StatefulWidget {
  final Ride? data;
  const MyRideDetailsScreen({
    super.key,
    this.data,
  });

  @override
  State<MyRideDetailsScreen> createState() => _MyRideDetailsScreenState();
}

class _MyRideDetailsScreenState extends State<MyRideDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getMyRideFn(ctx: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.black,
      appBar: AppBar(
        backgroundColor: AppConstants.black,
        leading: IconButton(
          onPressed: () => Routes.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppConstants.white,
            size: 18,
          ),
        ),
        title: const commonTextWidget(
          color: AppConstants.white,
          align: TextAlign.start,
          text: "My ride details",
          overFlow: TextOverflow.ellipsis,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizeBoxH(30),
            ActiveRidesContainer(
              data: widget.data,
              isFromMyRide: true,
            ),
            const SizeBoxH(30),
            const commonTextWidget(
              color: AppConstants.white,
              align: TextAlign.start,
              text: "People who Shown interest",
              overFlow: TextOverflow.ellipsis,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const SizeBoxH(10),
            ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                final showIntrestData = widget.data?.showIntrests?[index];
                return Container(
                  width: Responsive.width * 100,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppConstants.drawerBgColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              const Base64Decoder().convert(
                                  showIntrestData?.profilePicture ?? ""),
                              fit: BoxFit.cover,
                              width: Responsive.width * 25,
                              height: Responsive.height * 13,
                            ),
                          ),
                          const SizeBoxV(10),
                          Expanded(
                            child: SizedBox(
                              height: Responsive.height * 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  commonTextWidget(
                                    color: AppConstants.white,
                                    align: TextAlign.start,
                                    text: showIntrestData?.fullName ?? "Name",
                                    overFlow: TextOverflow.ellipsis,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/eventLocationIcon.png",
                                            height: 12,
                                          ),
                                          const SizeBoxV(5),
                                          commonTextWidget(
                                            color: AppConstants.white,
                                            align: TextAlign.start,
                                            text: widget.data?.startPoint ??
                                                "Ponlait",
                                            overFlow: TextOverflow.ellipsis,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      const commonTextWidget(
                                        color: AppConstants.appPrimaryColor,
                                        align: TextAlign.start,
                                        text: "To",
                                        overFlow: TextOverflow.ellipsis,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Row(
                                        children: [
                                          commonTextWidget(
                                            color: AppConstants.white,
                                            text: widget.data?.endPoint ??
                                                "Main Gate",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          const SizeBoxV(5),
                                          Image.asset(
                                            "assets/images/eventLocationIcon.png",
                                            height: 14,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  commonTextWidget(
                                    color: AppConstants.white,
                                    align: TextAlign.start,
                                    text: showIntrestData?.gender ?? "Female",
                                    overFlow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizeBoxH(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CommonBannerButtonWidget(
                            bgColor: AppConstants.transparent,
                            text: "Deny",
                            borderColor: AppConstants.red,
                            textColor: AppConstants.red,
                            width: Responsive.width * 20,
                            height: Responsive.height * 4,
                            radius: 12,
                          ),
                          const SizeBoxV(10),
                          CommonBannerButtonWidget(
                            bgColor: AppConstants.transparent,
                            text: "Accept",
                            borderColor: AppConstants.appPrimaryColor,
                            textColor: AppConstants.appPrimaryColor,
                            width: Responsive.width * 20,
                            height: Responsive.height * 4,
                            radius: 12,
                          ),
                          // const SizeBoxV(10),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizeBoxH(15),
              itemCount: widget.data?.showIntrests?.length ?? 0,
            ),
            const SizeBoxH(30),
          ],
        ),
      ),
    );
  }
}
