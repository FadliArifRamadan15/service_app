import 'package:get/get.dart';

import '../controllers/detail_iphone_controller.dart';

class DetailIphoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailIphoneController>(
      () => DetailIphoneController(),
    );
  }
}
