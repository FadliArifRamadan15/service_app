import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:service_app/app/utils/style/AppColors.dart';
import 'package:service_app/app/utils/widget/SideBar.dart';
import 'package:service_app/app/utils/widget/header.dart';
import '../../../controller/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.PrimaryBg,
      body: SafeArea(
        child: Row(
          children: [
            // sideBar
            !context.isPhone
                ? const Expanded(
                    flex: 2,
                    child: SideBar(),
                  )
                : const SizedBox(),
            // header
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  !context.isPhone
                      ? const header()
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _drawerKey.currentState!.openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: AppColors.PrimaryText,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'PonselMart',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.PrimaryText),
                                  ),
                                  Text(
                                    'Service Gadgetmu disini!',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.PrimaryText),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: GestureDetector(
                                  onTap: () => Get.toNamed(Routes.PROFILE),
                                  child: CircleAvatar(
                                    foregroundImage: NetworkImage(
                                        authC.auth.currentUser!.photoURL!),
                                    radius: 25,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  // content/isi page
                  Expanded(
                    child: Container(
                      padding: !context.isPhone
                          ? const EdgeInsets.all(50)
                          : const EdgeInsets.all(30),
                      margin: !context.isPhone
                          ? const EdgeInsets.all(10)
                          : const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: !context.isPhone
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(25),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Keuntungan Service',
                            style: TextStyle(
                                color: AppColors.PrimaryText, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // keuntungan service
                          SizedBox(
                            height: 200,
                            child: ListView(
                              clipBehavior: Clip.antiAlias,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.SecondaryBg),
                                  margin: const EdgeInsets.all(20),
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Ionicons.time_outline),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        '1. Dapat Estimasi Waktu',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      const Text(
                                        'Lama Pengerjaan Service',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.SecondaryBg),
                                  margin: const EdgeInsets.all(20),
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Ionicons.cash_outline),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        '2. Bisa Cek Biaya Service',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      const Text(
                                        'Dapat Melihat Berapa Biayanya',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.SecondaryBg),
                                  margin: const EdgeInsets.all(20),
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Ionicons.chatbubbles_outline),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        '3. Dapat Konsultasi Teknisi',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      const Text(
                                        'Teknisi Handal',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    'Daftar Service',
                                    style: TextStyle(
                                        color: AppColors.PrimaryText,
                                        fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        Get.toNamed(Routes.DETAIL_ANDROID),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      height: 150,
                                      decoration: const BoxDecoration(
                                          color: AppColors.SecondaryBg),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Ionicons.logo_android, size: 60),
                                          Text(
                                            "Android",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        Get.toNamed(Routes.DETAIL_IPHONE),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      height: 150,
                                      decoration: const BoxDecoration(
                                          color: AppColors.SecondaryBg),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Ionicons.logo_apple, size: 60),
                                          Text(
                                            "Iphone",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        Get.toNamed(Routes.DETAIL_TABLET),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      height: 150,
                                      decoration: const BoxDecoration(
                                          color: AppColors.SecondaryBg),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Ionicons.tablet_landscape_sharp,
                                              size: 60),
                                          Text(
                                            "Tablet",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        Get.toNamed(Routes.DETAIL_IPAD),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      height: 150,
                                      decoration: const BoxDecoration(
                                          color: AppColors.SecondaryBg),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Ionicons.tablet_landscape_sharp,
                                            size: 60,
                                          ),
                                          Text(
                                            "Ipad",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
