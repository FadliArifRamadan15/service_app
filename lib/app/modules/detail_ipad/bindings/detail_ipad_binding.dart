import 'package:get/get.dart';

import '../controllers/detail_ipad_controller.dart';

class DetailIpadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailIpadController>(
      () => DetailIpadController(),
    );
  }
}
