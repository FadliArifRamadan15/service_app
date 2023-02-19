import 'package:get/get.dart';

import '../controllers/detail_tablet_controller.dart';

class DetailTabletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTabletController>(
      () => DetailTabletController(),
    );
  }
}
