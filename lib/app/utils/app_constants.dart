import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:uni_bike/app/modules/auth/vieww%20model/number_controller.dart';

import '../modules/auth/vieww model/auth_provider.dart';
import '../modules/bottom_nav/view model/bottom_nav_provider.dart';
import '../modules/create ride/view model/create_ride_provider.dart';
import '../modules/home/view model/home_provider.dart';

class AppConstants {
  //APP COLORS

  static const white = Color(0xFFFFFFFF);
  static const subTextGrey = Color(0xFFA5A5A5);
  static const appPrimaryColor = Color(0xFFFFDD11);
  static const transparent = Colors.transparent;
  static const black = Color(0xff000000);
  static final black10 = const Color(0xff000000).withOpacity(10);
  static const textFieldTextColor = Color(0xffCFCFCF);
  static final textFormFieldBg = const Color(0xff636363).withOpacity(10);
  static const drawerBgColor = Color(0xFF151515);
  static const red = Color(0xff95021d);
  static const darkYellow = Color(0xff302B0E);
  static final border = const Color(0xffFFFFFF).withOpacity(0.2);
  static const teleContainerBg = Color(0xff343434); //#2B2B2B
  static const searchColor = Color(0xff343434);
}

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: ((context) => AuthProvider()),
  ),
  ChangeNotifierProvider(
    create: ((context) => BottomNavProvider()),
  ),
  ChangeNotifierProvider(
    create: ((context) => HomeProvider()),
  ),
  ChangeNotifierProvider(
    create: ((context) => CreateRideProvider()),
  ),
  ChangeNotifierProvider(
    create: ((context) => NumberController()),
  ),
  // ChangeNotifierProvider(
  //   create: ((context) => FacilityRentalProvider()),
  // ),
  // ChangeNotifierProvider(
  //   create: ((context) => AuthProvider()),
  // ),
  // ChangeNotifierProvider(
  //   create: ((context) => PaymentProvider()),
  // ),
  // ChangeNotifierProvider(
  //   create: ((context) => PharmacyProvider()),
  // ),
  // ChangeNotifierProvider(
  //   create: ((context) => TelemedicineProvider()),
  // ),
  // ChangeNotifierProvider(
  //   create: ((context) => PharmaProvider()),
  // ),
];
