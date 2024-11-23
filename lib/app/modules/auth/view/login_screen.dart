import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_bike/app/core/app_router.dart';
import 'package:uni_bike/app/helpers/common_widget.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/modules/auth/vieww%20model/number_controller.dart';
import 'package:uni_bike/app/utils/app_constants.dart';
import 'package:uni_bike/app/utils/extensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneCntrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberController>(
      builder: (context, controller, child) {
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
          ),
          body: Container(
            height: Responsive.height * 100,
            width: Responsive.width * 100,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizeBoxH(40),
                const commonTextWidget(
                  color: AppConstants.white,
                  align: TextAlign.start,
                  text: "Enter Your Phone Number",
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  maxLines: 2,
                  wordSpacing: 4,
                ),
                SizeBoxH(Responsive.height * 15),
                Row(
                  children: [
                    const commonTextWidget(
                      color: AppConstants.white,
                      text: "+91",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(width: Responsive.width * 2),
                    Expanded(
                      child: CommonTextFormField(
                        bgColor: AppConstants.drawerBgColor,
                        hintText: "phone number",
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        controller: phoneCntrlr,
                        maxLength: 10,
                      ),
                    ),
                  ],
                ),
                SizeBoxH(Responsive.height * 5),
                CommonButton(
                  isLoading: controller.isLoading,
                  onTap: () {
                    if (phoneCntrlr.text.isEmpty ||
                        phoneCntrlr.text.length != 10) {
                      toast(
                        context,
                        title: "Enter valid phone Number",
                        backgroundColor: Colors.red,
                      );
                    } else {
                      controller.phoneNumberAuth(
                        numb: phoneCntrlr.text,
                        ctx: context,
                      );
                    }
                  },
                  text: "Continue",
                  width: Responsive.width * 100,
                  height: Responsive.height * 6,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
