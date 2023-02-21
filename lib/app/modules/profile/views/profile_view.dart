import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:service_app/app/utils/style/AppColors.dart';
import 'package:service_app/app/utils/widget/SideBar.dart';
import 'package:service_app/app/utils/widget/header.dart';
import '../../../controller/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>();

  bool isObscurePassword = true;
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
                              GestureDetector(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: 'Sign Out',
                                    content: const Text(
                                        'Apa kau yakin ingin keluar?'),
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
                                      style: TextStyle(
                                          color: AppColors.PrimaryText),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Ionicons.log_out_outline,
                                        color: Colors.grey),
                                  ],
                                ),
                              ),
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
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: ListView(
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 4, color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            authC.auth.currentUser!.photoURL!),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            buildTextField('Nama Lengkap',
                                authC.auth.currentUser!.displayName!, false),
                            buildTextField(
                                'Email', authC.auth.currentUser!.email!, false),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String LabelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: LabelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
