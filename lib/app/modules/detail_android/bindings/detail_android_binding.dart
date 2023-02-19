import 'package:get/get.dart';

import '../controllers/detail_android_controller.dart';

class DetailAndroidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAndroidController>(
      () => DetailAndroidController(),
    );
  }
}
