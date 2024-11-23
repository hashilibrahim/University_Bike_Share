import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../modules/auth/view/splash_screen.dart';
import 'app_router.dart';

class StringConst {
  static const storage = FlutterSecureStorage();

  static String token = "userToken";
  static String eStoreToken = "eStorToken";
  static String facilityLoginUserId = "facilityLoginUserId";
  static String isFromMemberLogin = "";
  // static String showCase = 'Show Case';

  static Future<void> logout() async {
    await storage.deleteAll();
    Routes.pushRemoveUntil(screen: const SplashScreen());
  }

  static Future<String> getUserPhone() async {
    return await storage.read(key: token) ?? "";
  }

  static Future<void> addUserPhone({required String userToken}) async {
    await storage.write(key: token, value: userToken);
  }

  static Future<String> getIsFromMemberLogin() async {
    return await storage.read(key: isFromMemberLogin) ?? "";
  }

  static Future<void> addIsFromMemberLogin(
      {required String loginTrueOrFalse}) async {
    await storage.write(key: isFromMemberLogin, value: loginTrueOrFalse);
  }

  static Future<String> getUserID() async {
    return await storage.read(key: 'userId') ?? "";
  }

  static Future<void> setUserId({required String userId}) async {
    await storage.write(key: 'userId', value: userId);
  }

  static Future<void> addFacilityUserId({required String userId}) async {
    await storage.write(key: facilityLoginUserId, value: userId);
  }

  static Future<String> getFacilityUserId() async {
    return await storage.read(key: facilityLoginUserId) ?? "";
  }
  // static Future<void> addOpenTime({required String openTimes}) async {
  //   await storage.write(key: openTime, value: openTimes);
  // }

  // static Future<void> addCloseTime({required String closeTimes}) async {
  //   await storage.write(key: closeTime, value: closeTimes);
  // }

  // Api's

  // Estore

  // static String updateName = "${baseUrl}user/nameUpdate";
  // static String addingToCart = "${baseUrl}cart/create";
  // static String getCartList = "${baseUrl}cart/getCart";
  // static String deleteCart = "${baseUrl}cart/removeCart";
  // static String getCarousal = "${baseUrl}carousel";
  // static String updateCart = "${baseUrl}cart/updateCart";
  // static String postBooking = "${baseUrl}booking/create";
  // static String getBooking = "${baseUrl}booking/myBookings";

  // static String vendorLogin = "${baseUrl}hotel/login";
  // static String vendorFoodItems = "${baseUrl}food/getFood";
  // static String vendorHideFood = "${baseUrl}food/hideFood";
  // static String vendorBookings = "${baseUrl}booking/get";
  // static String vendorUpdateBooking = "${baseUrl}booking/accept";
  // static String vendorAcceptedOrder = "${baseUrl}booking/vendorBookings";
  // static String orderCompleted = "${baseUrl}booking/orderComplete";
  // static String timeChange = "${baseUrl}hotel/timeChange";

  // // Hash Images
  // static String latitude = "latitude";
  // static String longitude = "longitude";
}
