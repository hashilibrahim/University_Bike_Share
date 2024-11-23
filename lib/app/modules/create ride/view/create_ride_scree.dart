import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_bike/app/helpers/common_widget.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/modules/create%20ride/view%20model/create_ride_provider.dart';
import 'package:uni_bike/app/utils/extensions.dart';

import '../../../utils/app_constants.dart';

class CreateRideScreen extends StatefulWidget {
  const CreateRideScreen({super.key});

  @override
  State<CreateRideScreen> createState() => _CreateRideScreenState();
}

class _CreateRideScreenState extends State<CreateRideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppConstants.black,
        centerTitle: true,
        title: const commonTextWidget(
          color: AppConstants.white,
          text: "Create Ride",
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Consumer<CreateRideProvider>(
        builder: (context, provider, child) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const commonTextWidget(
                color: AppConstants.white,
                text: "Pickup point",
                fontSize: 14,
              ),
              const SizeBoxH(10),
              const DropDownWidget(
                isFromStartPoint: true,
              ),
              const SizeBoxH(30),
              const commonTextWidget(
                color: AppConstants.white,
                text: "End point ",
                fontSize: 14,
              ),
              const SizeBoxH(10),
              const DropDownWidget(),
              const SizeBoxH(30),
              const commonTextWidget(
                color: AppConstants.white,
                text: "Start time",
                fontSize: 14,
              ),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "Start time (24Hour Format)",
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: provider.timeCntrlr,
                radius1: 15,
                radius2: 15,
              ),
              const SizeBoxH(30),
              const commonTextWidget(
                color: AppConstants.white,
                text: "Gender Preference",
                fontSize: 14,
              ),
              const SizeBoxH(30),
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
                            provider.genderSelect("Any");
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
                                    provider.selectedGender == "Any"
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
              const SizeBoxH(30),
              const commonTextWidget(
                color: AppConstants.white,
                text: "Phone number",
                fontSize: 14,
              ),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "Phone Number",
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: provider.phoneCntrlr,
                radius1: 15,
                radius2: 15,
                maxLength: 10,
              ),
              const SizeBoxH(30),
              const commonTextWidget(
                color: AppConstants.white,
                text: "Vehicle",
                fontSize: 14,
              ),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "Vehicle",
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: provider.vehicleCntrlr,
                radius1: 15,
                radius2: 15,
              ),
              const SizeBoxH(40),
              CommonButton(
                onTap: () {
                  provider.createRideFn(context: context);
                },
                text: "Create Ride",
                width: Responsive.width * 100,
                height: Responsive.height * 6,
              ),
              const SizeBoxH(120),
            ],
          ),
        ),
      ),
    );
  }
}

class DropDownWidget extends StatelessWidget {
  final bool isFromStartPoint;
  const DropDownWidget({super.key, this.isFromStartPoint = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateRideProvider>(
      builder: (context, provider, child) => SizedBox(
        width: Responsive.width * 100,
        height: 60,
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 16,
                color: AppConstants.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  isFromStartPoint ? 'Select start point' : 'Select end point',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: isFromStartPoint
              ? context
                  .read<CreateRideProvider>()
                  .destinations
                  .map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }).toList()
              : context
                  .read<CreateRideProvider>()
                  .destinations
                  .reversed
                  .map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }).toList(),
          value: isFromStartPoint ? provider.startPoint : provider.endPoint,
          onChanged: (value) {
            isFromStartPoint
                ? provider.selectedStartPoint(value)
                : provider.selectedEndPoint(value);
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: Responsive.width * 100,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.transparent,
              ),
              color: AppConstants.drawerBgColor,
            ),
            elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: AppConstants.white,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: Responsive.width * 92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppConstants.drawerBgColor,
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 50,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}
