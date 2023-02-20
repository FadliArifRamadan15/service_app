import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:service_app/app/routes/app_pages.dart';
import 'package:service_app/app/utils/style/AppColors.dart';

import '../../controller/auth_controller.dart';

class header extends StatelessWidget {
  const header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return SizedBox(
      height: Get.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'PonselMart',
                  style: TextStyle(fontSize: 25, color: AppColors.PrimaryText),
                ),
                Text(
                  'Service Gadgetmu disini!',
                  style: TextStyle(fontSize: 15, color: AppColors.PrimaryText),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: 'Sign Out',
                  content: const Text('Apa kau yakin ingin keluar?'),
                  cancel: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text('Tidak'),
                  ),
                  confirm: ElevatedButton(
                    onPressed: () => authC.logout(),
                    child: const Text('Ya'),
                  ),
                );
              },
              child: Row(
                children: const [
                  Text(
                    'Sign Out',
                    style: TextStyle(color: AppColors.PrimaryText),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Ionicons.log_out_outline, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
