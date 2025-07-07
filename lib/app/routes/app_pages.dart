import 'package:get/get.dart';

import '../modules/dashboard/bottomTabBar/bindings/bottom_tab_bar_binding.dart';
import '../modules/dashboard/bottomTabBar/views/bottom_tab_bar_view.dart';
import '../modules/modules.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: Routes.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_TAB_BAR,
      page: () => const BottomTabBarView(),
      binding: BottomTabBarBinding(),
    ),
  ];
}

class AppNavigator {
  static void toLogin() => Get.toNamed(Routes.LOGIN);
  static void offAllToLogin() => Get.offAllNamed(Routes.LOGIN);
  static void toHome() => Get.toNamed(Routes.HOME);
  static void offAllToHome() => Get.offAllNamed(Routes.HOME);
  // Add more as needed
}
