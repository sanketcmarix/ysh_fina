import 'package:flutter/material.dart';
import '../const/app_dimens.dart';
import '../utils/app_text_style.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: AppTextStyles.regularWhite16,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.regularWhite16,
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor ?? Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.dimen16),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      onChanged: (_) {
        // To trigger rebuild for textAlign
        (context as Element).markNeedsBuild();
      },
    );
  }
}
