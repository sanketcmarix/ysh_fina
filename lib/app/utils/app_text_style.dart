import 'package:flutter/material.dart';

import '../const/const.dart';

/// CustomTextStyle provides a centralized way to apply text styles throughout the app.
/// It ensures consistency in font family, size, and color, while allowing customization where needed.
class AppTextStyles {
  /// Returns a medium weight text style.
  ///
  /// [fontSize] is required to specify the size of the text.
  /// [fontColor] is optional and defaults to [AppColors.textLightBlack].
  static TextStyle mediumTextStyle({
    required double fontSize,
    Color fontColor = AppColors.black,
    String fontFamily = AppConstants.krubMedium,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontStyle: FontStyle.normal,
      decorationThickness: 1,
      fontSize: fontSize,
      color: fontColor,
      decoration: textDecoration,
      decorationColor: fontColor,
    );
  }

  /// Returns a semi-bold weight text style.
  ///
  /// [fontSize] is required to specify the size of the text.
  /// [fontColor] is optional and defaults to [AppColors.textBlack].
  static TextStyle semiBoldTextStyle({
    required double fontSize,
    String fontFamily = AppConstants.krubSemiBold,
    Color fontColor = AppColors.black,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
        fontFamily: fontFamily,
        fontStyle: FontStyle.normal,
        fontSize: fontSize,
        color: fontColor,
        decoration: decoration);
  }

  /// Returns a bold weight text style.
  ///
  /// [fontSize] is required to specify the size of the text.
  /// [fontColor] is optional and defaults to [AppColors.textBlack].
  static TextStyle boldTextStyle({
    required double fontSize,
    String fontFamily = AppConstants.krubBold,
    Color fontColor = AppColors.black,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  /// Returns a regular weight text style.
  ///
  /// [fontSize] is required to specify the size of the text.
  /// [fontColor] is optional and defaults to [AppColors.textBlack].
  static TextStyle regularTextStyle({
    required double fontSize,
    Color fontColor = AppColors.black,
    TextDecoration textDecoration = TextDecoration.none,
    String fontFamily = AppConstants.krubRegular,
    double? fontHeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      color: fontColor,
      decoration: textDecoration,
      height: fontHeight,
      decorationColor: fontColor,
    );
  }

  /// Returns a light weight text style.
  ///
  /// [fontSize] is required to specify the size of the text.
  /// [fontColor] is optional and defaults to [AppColors.textBlack].
  static TextStyle lightTextStyle({
    required double fontSize,
    String fontFamily = AppConstants.krubLight,
    Color fontColor = AppColors.black,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  // Login view text styles
  static final boldWhite24 = boldTextStyle(fontSize: 24, fontColor: AppColors.white);
  static final regularWhite16 = regularTextStyle(fontSize: 16, fontColor: AppColors.white);
  static final boldBlack18 = boldTextStyle(fontSize: 18, fontColor: AppColors.black);
}
