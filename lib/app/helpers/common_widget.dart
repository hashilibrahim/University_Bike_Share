// ignore_for_file: camel_case_types

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_constants.dart';
import '../utils/extensions.dart';

class CommonInkwell extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final double? borderRadius;
  final Color? splashColor;
  const CommonInkwell(
      {super.key,
      required this.child,
      required this.onTap,
      this.borderRadius,
      this.splashColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      splashColor: splashColor ?? Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      focusColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}

class commonTextWidget extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final TextAlign align;
  final double letterSpacing;
  final FontWeight fontWeight;
  final int? maxLines;
  final double? height;
  final TextOverflow? overFlow;
  final double? wordSpacing;

  const commonTextWidget({
    super.key,
    required this.color,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0.5,
    this.maxLines,
    this.align = TextAlign.center,
    this.overFlow,
    this.height,
    this.wordSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text,
      textAlign: align,
      style: TextStyle(
          height: height,
          color: color,
          fontSize: fontSize,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          overflow: overFlow,
          wordSpacing: wordSpacing),
    );
  }
}

class CommonButton extends StatelessWidget {
  final void Function() onTap;
  final Color bgColor;
  final Color textColor;
  final String text;
  final double width;
  final Color borderColor;
  final double height;
  final double size;
  final BorderRadiusGeometry? borderRadius;
  final double radius;
  final bool isLoading;

  const CommonButton({
    super.key,
    required this.onTap,
    this.bgColor = AppConstants.appPrimaryColor,
    this.textColor = AppConstants.black,
    this.borderColor = AppConstants.black,
    required this.text,
    required this.width,
    this.borderRadius,
    this.size = 18,
    this.radius = 100,
    required this.height,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: 15),
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
            color: bgColor,
            border: Border.all(color: borderColor)),
        child: Center(
          child: isLoading
              ? const CupertinoActivityIndicator(
                  radius: 15,
                  color: AppConstants.white,
                )
              : commonTextWidget(
                  color: textColor,
                  text: text,
                  fontWeight: FontWeight.w700,
                  fontSize: size,
                ),
        ),
      ),
    );
  }
}

class CommonTextFormField extends StatelessWidget {
  final Color bgColor;
  final String hintText;
  final Color hintTextColor;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final Widget? suffixIcon;
  final double radius1;
  final double radius2;
  final String counterText;
  final bool readOnly;

  const CommonTextFormField(
      {super.key,
      required this.bgColor,
      required this.hintText,
      this.hintTextColor = AppConstants.textFieldTextColor,
      required this.keyboardType,
      required this.textInputAction,
      this.validator,
      this.maxLength,
      required this.controller,
      this.contentPadding,
      this.obscureText = false,
      this.suffixIcon,
      this.radius1 = 100,
      this.radius2 = 100,
      this.counterText = '',
      this.readOnly = false,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: const TextStyle(
        color: AppConstants.white,
        fontSize: 14,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      maxLines: maxLines,
      readOnly: readOnly,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius1),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius2),
          borderSide: BorderSide.none,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: suffixIcon,
        fillColor: bgColor,
        filled: true,
        labelText: hintText,
        labelStyle: TextStyle(
          color: hintTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
      validator: validator,
      maxLength: maxLength,
      controller: controller,
    );
  }
}

class commonNetworkImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final bool isTopCurved;
  final double radius;
  final BoxFit fit;

  const commonNetworkImage({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    this.isTopCurved = true,
    this.radius = 10,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      // color: const Color(0xff161616),
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: isTopCurved
                ? BorderRadius.circular(radius)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        );
      },
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: AppConstants.appPrimaryColor,
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
          height: height,
          width: width,
          child: const Icon(
            Icons.image_not_supported,
            size: 40,
            color: Colors.grey,
          )),
    );
  }
}

class estoreCommonNetworkImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final bool isTopCurved;

  const estoreCommonNetworkImage({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    this.isTopCurved = true,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: isTopCurved
                ? BorderRadius.circular(10)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: isTopCurved
              ? BorderRadius.circular(10)
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
        ),
        child: const Center(
          child: Center(
            child: CircularProgressIndicator(
              color: AppConstants.appPrimaryColor,
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
          height: height,
          width: width,
          child: const Icon(
            Icons.image_not_supported,
            size: 40,
            color: Colors.grey,
          )),
    );
  }
}

bool _isToastShowing = false;

void toast(
  BuildContext context, {
  String? title,
  int duration = 2,
  Color? backgroundColor,
}) {
  log("tittle is $title");
  if (_isToastShowing) return;

  _isToastShowing = true;

  final scaffold = ScaffoldMessenger.of(context);
  scaffold
      .showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          duration: Duration(seconds: duration),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          width: Responsive.width * 90,
          content: Container(
            height: Responsive.height * 3,
            alignment: Alignment.center,
            child: Text(
              title ?? 'Something went wrong',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: backgroundColor == const Color(0xFFFFDD11)
                      ? AppConstants.black
                      : Colors.white),
            ),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      )
      .closed
      .then((reason) {
    _isToastShowing = false;
  });
}




// void successtoast({title, duration = 2}) {
//   HapticFeedback.lightImpact();
//   Get.showSnackbar(GetSnackBar(
//     icon: Image.asset(
//       AppImages.logo,
//       height: 20,
//       width: 20,
//     ),
//     backgroundColor: AppConstants.appPrimaryColor,
//     message: title != '' ? title : 'Something went wrong',
//     duration: Duration(seconds: duration),
//     snackStyle: SnackStyle.FLOATING,
//     margin: const EdgeInsets.all(20),
//     borderRadius: 10,
//     isDismissible: true,
//     dismissDirection: DismissDirection.down,
//   ));
// }

// void showLoading() {
//   Get.dialog(Padding(
//     padding: EdgeInsets.all(31.wp),
//     child: Dialog(
//       backgroundColor: AppConstants.appPrimaryColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//       child: const Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CircularProgressIndicator(
//               color: AppConstants.black,
//             )
//           ],
//         ),
//       ),
//     ),
//   ));
// }

// void hideLoading() {
//   if (Get.isDialogOpen ?? false) {
//     Get.back();
//   }
// }
