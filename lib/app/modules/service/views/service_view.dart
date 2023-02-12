import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/app/utils/style/AppColors.dart';
import 'package:service_app/app/utils/widget/SideBar.dart';
import 'package:service_app/app/utils/widget/header.dart';
import '../controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.PrimaryBg,
      body: Row(
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
                              child: const CircleAvatar(
                                foregroundImage: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_960_720.jpg'),
                                radius: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                // content/isi page
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    margin: !context.isPhone
                        ? const EdgeInsets.all(10)
                        : const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: !context.isPhone
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      //height: 200,
                      child: Container(
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.SecondaryBg),
                        //padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            const Text(
                              'PONSELMART',
                              style: TextStyle(fontSize: 40),
                            ),
                            const Text(
                              'Jl. Petratean No. 62 Cirebon',
                              style: TextStyle(fontSize: 20),
                            ),
                            Image.asset(
                              'assets/images/Maps.png',
                              height: Get.height * 0.52,
                            ),
                            SizedBox(
                              width: 200,
                              height: 45,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Whatsapp",
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
