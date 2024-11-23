import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uni_bike/app/core/server_client.dart';

import '../../../core/app_router.dart';
import '../../../core/string_const.dart';
import '../../../helpers/common_widget.dart';
import '../../bottom_nav/view/bottom_nav_screen.dart';
import '../view/create-profile_screen.dart';

class NumberController extends ChangeNotifier {
  bool isLoading = false;
  Future<void> phoneNumberAuth({
    required String numb,
    required BuildContext ctx,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      String url = "https://unibikes.onrender.com/register";
      List response = await ServerClient.post(
        url,
        data: {
          "mobileNumber": numb,
        },
      );
      log("response.first   ::     ${response.first}");
      log("response.last    ::    ${response.last}");
      if (response.first >= 200 && response.first < 300) {
        final bool = response.last['isRegistered'];
        StringConst.addUserPhone(userToken: response.last['mobileNumber']);

        final PhoneNumber = response.last['mobileNumber'];

        log("bool   ::     $bool");
        if (!bool) {
          Routes.push(
              screen: CreateProfileScreen(
            phoneNumber: PhoneNumber,
          ));
        } else {
          Routes.push(screen: UniBikeBottomNav());
          StringConst.setUserId(userId: response.last['id']);
          toast(ctx, title: "Success", backgroundColor: Colors.green);
        }
      } else {
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Something went wrong! Try again.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
