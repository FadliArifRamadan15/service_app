import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/app/routes/app_pages.dart';
import 'package:service_app/app/utils/style/AppColors.dart';
import 'package:service_app/app/utils/widget/SideBar.dart';
import 'package:service_app/app/utils/widget/header.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/auth_controller.dart';
import '../controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final authC = Get.find<AuthController>();

  ServiceView({super.key});

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
                                height: Get.height * 0.04,
                              ),
                              const Text(
                                'PONSELMART',
                                style: TextStyle(fontSize: 40),
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              const Text(
                                'Jl. Ciremai Raya No.32',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Text(
                                'Harjamukti Cirebon',
                                style: TextStyle(fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () => maps(),
                                child: Image.asset(
                                  'assets/images/Maps.jpg',
                                  height: Get.height * 0.495,
                                ),
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
                                  onPressed: whatsapp,
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
      ),
    );
  }
}

whatsapp() async {
  var contact = "+6281212129919";
  var androidUrl =
      "whatsapp://send?phone=$contact&text=Hallo PONSELMART, Saya mau konsultasi tentang service ponsel.";

  await launchUrl(Uri.parse(androidUrl));
}

maps() async {
  var androidUrl = "https://goo.gl/maps/8LK7nFnfhyfm38obA";

  await launchUrl(Uri.parse(androidUrl));
}
