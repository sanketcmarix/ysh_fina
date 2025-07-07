import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/app_strings.dart';
import '../../../const/app_colors.dart';
import '../../../utils/app_text_style.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.notifications, style: AppTextStyles.boldTextStyle(fontSize: 20)),
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: Center(
        child: Text(AppStrings.noNotifications, style: AppTextStyles.regularTextStyle(fontSize: 16)),
      ),
    );
  }
}
