import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_bike/app/core/app_router.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/modules/home/view%20model/home_provider.dart';
import 'package:uni_bike/app/utils/app_constants.dart';
import 'package:uni_bike/app/utils/enums.dart';

import '../../../helpers/common_widget.dart';
import '../../../utils/extensions.dart';
import '../widget/active_rides_container.dart';
import 'my_ride_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().getAllRides(context: context, isFrom: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: AppConstants.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Image.asset(
            "assets/images/logoGif.gif",
            height: 80,
            width: 200,
            fit: BoxFit.cover,
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       StringConst.logout();
          //     },
          //     icon: const Icon(
          //       Icons.logout,
          //       color: AppConstants.red,
          //       size: 30,
          //     ),
          //   ),
          //   const SizeBoxV(10)
          // ],
          backgroundColor: AppConstants.black,
          toolbarHeight: Responsive.height * 20,
          bottom: provider.isFilterShow
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(100),
                  child: Column(
                    children: [
                      SizedBox(
                        width: Responsive.width * 90,
                        child: DropdownButtonFormField<String>(
                          dropdownColor: AppConstants.teleContainerBg,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppConstants.teleContainerBg,
                            hintText: "From",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          value: provider.startPointCntrlr.text.isNotEmpty
                              ? provider.startPointCntrlr.text
                              : null,
                          onChanged: (String? newValue) {
                            provider.startPointCntrlr.text = newValue!;
                          },
                          items:
                              provider.destinations.map((String destination) {
                            return DropdownMenuItem<String>(
                              value: destination,
                              child: Text(
                                destination,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizeBoxH(10),
                      SizedBox(
                        width: Responsive.width * 90,
                        child: DropdownButtonFormField<String>(
                          dropdownColor: AppConstants.teleContainerBg,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppConstants.teleContainerBg,
                            hintText: "To",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          value: provider.endPointCntrlr.text.isNotEmpty
                              ? provider.endPointCntrlr.text
                              : null,
                          onChanged: (String? newValue) {
                            provider.endPointCntrlr.text = newValue!;
                          },
                          items: provider.destinations.reversed
                              .map((String destination) {
                            return DropdownMenuItem<String>(
                              value: destination,
                              child: Text(
                                destination,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizeBoxH(10),
                      CommonBannerButtonWidget(
                        bgColor: AppConstants.transparent,
                        text: "Filter",
                        borderColor: AppConstants.appPrimaryColor,
                        textColor: AppConstants.appPrimaryColor,
                        width: Responsive.width * 30,
                        height: Responsive.height * 4,
                        onTap: () {
                          provider.getAllRides(context: context, isFrom: false);
                        },
                      ),
                      const SizeBoxH(10),
                    ],
                  ),
                )
              : PreferredSize(
                  preferredSize: const Size.fromHeight(0), child: Container()),
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizeBoxH(10),
              SizedBox(
                width: Responsive.width * 100,
                child: Row(
                  children: [
                    const SizeBoxV(15),
                    CommonBannerButtonWidget(
                      text: "All",
                      borderColor: Colors.transparent,
                      bgColor:
                          provider.selectedContainer == SelectedContainer.all
                              ? AppConstants.appPrimaryColor
                              : AppConstants.transparent,
                      textColor:
                          provider.selectedContainer == SelectedContainer.all
                              ? AppConstants.black
                              : AppConstants.subTextGrey,
                      fontSize: 12,
                      width: 90,
                      onTap: () {
                        context
                            .read<HomeProvider>()
                            .getAllRides(context: context, isFrom: true);
                        provider.removeFilter();
                        Provider.of<HomeProvider>(context, listen: false)
                            .updateSelectedContainer(SelectedContainer.all);
                      },
                    ),
                    const SizeBoxV(15),
                    CommonBannerButtonWidget(
                      text: "My Ride",
                      borderColor: Colors.transparent,
                      bgColor:
                          provider.selectedContainer == SelectedContainer.myRide
                              ? AppConstants.appPrimaryColor
                              : AppConstants.transparent,
                      textColor:
                          provider.selectedContainer == SelectedContainer.myRide
                              ? AppConstants.black
                              : AppConstants.subTextGrey,
                      fontSize: 12,
                      width: 90,
                      onTap: () {
                        context.read<HomeProvider>().getMyRideFn(ctx: context);
                        provider.removeFilter();
                        Provider.of<HomeProvider>(context, listen: false)
                            .updateSelectedContainer(SelectedContainer.myRide);
                      },
                    ),
                    const SizeBoxV(15),
                  ],
                ),
              ),
              SizeBoxH(Responsive.height * 2),
              provider.selectedContainer == SelectedContainer.myRide
                  ? provider.myRidesStatus == MyRidesStatus.loading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppConstants.appPrimaryColor,
                          ),
                        )
                      : provider.myRidesStatus == MyRidesStatus.loaded
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                final myRide =
                                    provider.getMyRidesModel.rides?[index];

                                return CommonInkwell(
                                    onTap: () {
                                      Routes.push(
                                          screen: MyRideDetailsScreen(
                                        data: myRide,
                                      ));
                                    },
                                    child: ActiveRidesContainer(
                                      isFromMyRide: true,
                                      data: myRide,
                                    ));
                              },
                              separatorBuilder: (context, index) =>
                                  const SizeBoxH(20),
                              itemCount:
                                  provider.getMyRidesModel.rides?.length ?? 0,
                            )
                          : const Text(
                              "No Rides Found",
                            )
                  : provider.getAllRidesStatus == GetAllRidesStatus.loading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppConstants.appPrimaryColor,
                          ),
                        )
                      : provider.getAllRidesStatus == GetAllRidesStatus.loaded
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                final allRide = provider
                                        .getAllRidesModel.rides?[
                                    (provider.getAllRidesModel.rides?.length ??
                                            0) -
                                        1 -
                                        index];
                                return CommonInkwell(
                                  onTap: () {},
                                  child: ActiveRidesContainer(
                                      isFromMyRide: false, data: allRide),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizeBoxH(20),
                              itemCount:
                                  provider.getAllRidesModel.rides?.length ?? 0,
                            )
                          : const Text("No Rides Found"),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonBannerButtonWidget extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final double width;
  final String text;
  final double fontSize;
  final void Function()? onTap;
  final double height;
  final double radius;
  const CommonBannerButtonWidget(
      {super.key,
      required this.bgColor,
      required this.text,
      required this.borderColor,
      required this.textColor,
      required this.width,
      this.height = 35,
      this.onTap,
      this.radius = 100,
      this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: bgColor,
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Center(
          child: commonTextWidget(
            color: textColor,
            text: text,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
