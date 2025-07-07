import 'package:flutter/material.dart';
import '../const/app_assets.dart';
import '../const/app_colors.dart';
import '../const/app_dimens.dart';
import '../const/app_paddings.dart';
import '../utils/app_text_style.dart';

/// A fully customizable and reusable app bar widget for the app.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final double? height;
  final Widget? logo;
  final EdgeInsetsGeometry? padding;

  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.elevation,
    this.height,
    this.logo,
    this.padding,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height ?? AppDimens.bottomBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? AppColors.background,
      padding: padding ?? AppPaddings.h24.add(AppPaddings.v16),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading ?? const SizedBox(width: 40),
            Row(children: actions ?? []),
          ],
        ),
      ),
    );
  }
}
