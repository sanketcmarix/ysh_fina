import 'package:get/get.dart';

import '../controllers/bottom_tab_bar_controller.dart';

class BottomTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomTabBarController>(
      () => BottomTabBarController(),
    );
  }
}
