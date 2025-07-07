import 'package:flutter/material.dart';
import '../const/app_dimens.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const CommonButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = AppDimens.dimen20,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding ?? const EdgeInsets.symmetric(vertical: AppDimens.dimen16),
          elevation: 8,
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: textStyle,
              ),
      ),
    );
  }
}

