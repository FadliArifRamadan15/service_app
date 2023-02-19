import 'package:get/get.dart';

import '../modules/detail_android/bindings/detail_android_binding.dart';
import '../modules/detail_android/views/detail_android_view.dart';
import '../modules/detail_ipad/bindings/detail_ipad_binding.dart';
import '../modules/detail_ipad/views/detail_ipad_view.dart';
import '../modules/detail_iphone/bindings/detail_iphone_binding.dart';
import '../modules/detail_iphone/views/detail_iphone_view.dart';
import '../modules/detail_tablet/bindings/detail_tablet_binding.dart';
import '../modules/detail_tablet/views/detail_tablet_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/service/bindings/service_binding.dart';
import '../modules/service/views/service_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.leftToRight,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.leftToRight,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.SERVICE,
      page: () => ServiceView(),
      binding: ServiceBinding(),
      transition: Transition.leftToRight,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.leftToRight,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: _Paths.DETAIL_ANDROID,
      page: () => DetailAndroidView(),
      binding: DetailAndroidBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_IPHONE,
      page: () => DetailIphoneView(),
      binding: DetailIphoneBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TABLET,
      page: () => DetailTabletView(),
      binding: DetailTabletBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_IPAD,
      page: () => DetailIpadView(),
      binding: DetailIpadBinding(),
    ),
  ];
}
