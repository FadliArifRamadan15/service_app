import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:service_app/app/utils/style/AppColors.dart';

import '../../../controller/auth_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  final authC = Get.find<AuthController>();

  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryBg,
      body: Container(
        //padding: EdgeInsets.only(top: 12),
        margin: EdgeInsets.fromLTRB(50, 150, 50, 170),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.yellow,
        ),
        child: SafeArea(
          child: Row(children: [
            // kuning
            !context.isPhone
                ? Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Selamat Datang',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              'Silahkan Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            // putih
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      context.isPhone
                          ? Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Selamat Datang',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  'Silahkan Login',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      Image.asset(
                        'assets/images/iconlogin.png',
                        height: Get.height * 0.35,
                      ),
                      FloatingActionButton.extended(
                        backgroundColor: AppColors.PrimaryBg,
                        onPressed: () => authC.signInWithGoogle(),
                        label: const Text(
                          'Masuk Akun Google',
                          style: TextStyle(color: Colors.grey),
                        ),
                        icon: const Icon(
                          Ionicons.logo_google,
                          color: Colors.grey,
                        ),
                      )
                    ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
