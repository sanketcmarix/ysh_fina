import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysh_fina/app/const/app_font.dart';
import '../const/const.dart';
import 'utils.dart';

extension StrExt on String? {
  String validate({String defaultValue = ""}) {
    return this ?? defaultValue;
  }
}

String? emptyValidator({String? value, required String errorMessage}) {
  if (value?.trim().isEmpty == true) {
    return errorMessage.firstCapitalize();
  }
  return null;
}

extension on String {
  String? firstCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension DoubleExtension on double {
  /// Vertical Spaced SizedBox
  Widget get toVSB {
    return SizedBox(height: this);
  }

  /// Horizontal Spaced SizedBox
  Widget get toHSB {
    return SizedBox(width: this);
  }

  /// All Circular BorderRadius
  BorderRadius get toAllBorderRadius {
    return BorderRadius.all(Radius.circular(this));
  }

  /// All EdgeInsets
  EdgeInsets get toAll {
    return EdgeInsets.all(this);
  }

  /// Vertical EdgeInsets
  EdgeInsets get toVertical {
    return EdgeInsets.symmetric(vertical: this);
  }

  /// Horizontal EdgeInsets
  EdgeInsets get toHorizontal {
    return EdgeInsets.symmetric(horizontal: this);
  }

  /// Horizontal EdgeInsets
  Radius get toRadius {
    return Radius.circular(this);
  }

  /// Top EdgeInsets
  EdgeInsets get toTop {
    return EdgeInsets.only(top: this);
  }

  /// bottom EdgeInsets
  EdgeInsets get toBottom {
    return EdgeInsets.only(bottom: this);
  }
}

extension IntExtension on int? {
  /// HTTP status code
  bool isSuccessful() => this! >= 200 && this! <= 206;

  bool isProgress() => this == 100;

  /// Validate given int is not null and returns given value if null.
  int validateInt({int defaultValue = 0}) {
    return this ?? defaultValue;
  }

  /// Validate given double is not null and returns given value if null.
  double validateDouble({double defaultValue = 0.0}) {
    return (this as double?) ?? defaultValue;
  }

  int validate({int defaultValue = 0}) {
    return this ?? defaultValue;
  }
}

extension StringExtension on String {
  /// UTF-8 encoded string
  String get utf8convertString {
    try {
      List<int> bytes = toString().codeUnits;
      return utf8.decode(bytes);
    } catch (e) {
      Logger.e("UTF-8 string convert error : ${e.toString()}");
      return this;
    }
  }

  /// SnackBar using GetX
  Future<void> get showGreenSnackBar async {
    Get.closeAllSnackbars();

    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Colors.green,
        borderRadius: 10.0,
        margin: const EdgeInsets.all(10),
        message: capitalizeFirst,
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 3000),
        messageText: Text(
          this,
          style: AppTextStyles.mediumTextStyle(
            fontSize: AppFontSizes.font14,
            fontColor: Colors.white,
          ),
        ),
      ),
    );
  }

  /// SnackBar using GetX
  Future<void> get showErrorSnackBar async {
    Get.closeAllSnackbars();

    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 10.0,
        margin: const EdgeInsets.all(10),
        message: capitalizeFirst,
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 3000),
        backgroundColor: Colors.red,
        messageText: Text(
          this,
          style: AppTextStyles.mediumTextStyle(
            fontSize: AppFontSizes.font14,
            fontColor: Colors.white,
          ),
        ),
      ),
    );
  }

  /// SnackBar using GetX
  Future<void> get showAlertSnackBar async {
    Get.closeAllSnackbars();

    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 10.0,
        margin: const EdgeInsets.all(10),
        message: capitalizeFirst,
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 5000),
        backgroundColor: Colors.redAccent,
        messageText: Text(
          this,
          style: AppTextStyles.mediumTextStyle(
            fontSize: AppFontSizes.font14,
            fontColor: Colors.white,
          ),
        ),
      ),
    );
  }

  /// SnackBar using GetX
  Future<void> get showInfoSnackBar async {
    Get.closeAllSnackbars();

    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 40.0,
        margin: const EdgeInsets.all(4),
        message: capitalizeFirst,
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        backgroundColor: AppColors.primary,
        borderColor: AppColors.primary,
        messageText: Text(
          this,
          style: AppTextStyles.mediumTextStyle(
            fontSize: AppFontSizes.font14,
            fontColor: Colors.white,
          ),
        ),
      ),
    );
  }


  Future<void> get showInternetSnackBar async {
    Get.closeAllSnackbars();

    Get.showSnackbar(
      GetSnackBar(
        message: capitalizeFirst,
        borderRadius: 10.0,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(14.0),
        isDismissible: true,
        snackStyle: SnackStyle.GROUNDED,
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.errorRed,
        duration: const Duration(milliseconds: 5000),
        messageText: Text(
          this,
          style: AppTextStyles.mediumTextStyle(
            fontSize: AppFontSizes.font14,
            fontColor: Colors.white,
          ),
        ),
      ),
    );
  }


}


