import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uni_bike/app/utils/loading_overlay.dart';

import '../../../core/server_client.dart';
import '../../../core/string_const.dart';
import '../../../helpers/common_widget.dart';

class CreateRideProvider extends ChangeNotifier {
  final List<String> destinations = [
    'Outer circle',
    'Sj',
    'Cv raman',
    'Valmiky hostel ',
    'Tiruvallur stafium',
    'Rajiv gandhi stadium',
    'Narmadha',
    'Health centre ',
    "Ponlait",
    "Gate2",
    "Reading room",
    "Gate 1"
  ];
  String? startPoint;

  void selectedStartPoint(String? point) {
    startPoint = point;
    notifyListeners();
  }

  void selectedEndPoint(String? point) {
    endPoint = point;
    notifyListeners();
  }

  String? endPoint;

  String selectedGender = '';

  void genderSelect(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  TextEditingController phoneCntrlr = TextEditingController();
  TextEditingController timeCntrlr = TextEditingController();
  TextEditingController vehicleCntrlr = TextEditingController();

  Future<void> createRideFn({required BuildContext context}) async {
    if (vehicleCntrlr.text.isEmpty) {
      toast(context, title: "vehicle is empty", backgroundColor: Colors.red);
    } else if (timeCntrlr.text.isEmpty) {
      toast(context, title: "time is empty", backgroundColor: Colors.red);
    } else if (phoneCntrlr.text.isEmpty) {
      toast(context,
          title: "Phone number is empty", backgroundColor: Colors.red);
    } else if (startPoint == null) {
      toast(context,
          title: "Start point is empty", backgroundColor: Colors.red);
    } else if (endPoint == null) {
      toast(context, title: "End point is empty", backgroundColor: Colors.red);
    } else if (selectedGender.isEmpty) {
      toast(context, title: "Select any gender ", backgroundColor: Colors.red);
    } else {
      LoadingOverlay.of(context).show();

      final UserId = await StringConst.getUserID();
      try {
        List response =
            await ServerClient.post("https://unibikes.onrender.com/create-ride",
                data: {
                  "startPoint": startPoint,
                  "endPoint": endPoint,
                  "startTime": timeCntrlr.text,
                  "genderPreference": selectedGender,
                  "vehicleType": vehicleCntrlr.text,
                  "phoneNumber": phoneCntrlr.text,
                  "userId": UserId,
                },
                post: true);

        log("slot1111  ::${response.last}");
        log("slot222  ::${response.first}");
        if (response.first >= 200 && response.first < 300) {
          timeCntrlr.clear();
          phoneCntrlr.clear();
          vehicleCntrlr.clear();
          selectedGender = '';
          startPoint = null;
          endPoint = null;

          LoadingOverlay.of(context).hide();

          toast(context, title: "Success", backgroundColor: Colors.green);

          notifyListeners();
        } else {
          LoadingOverlay.of(context).hide();
          log('Failed to create ride: ${response.first}');
          toast(context,
              title: "Failed to create ride", backgroundColor: Colors.red);
        }
      } catch (e) {
        LoadingOverlay.of(context).hide();
        log('Error creating ride: $e');
        toast(context,
            title: "Error creating ride", backgroundColor: Colors.red);
      }
    }
  }
}
