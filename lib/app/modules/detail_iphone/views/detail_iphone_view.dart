import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:service_app/app/routes/app_pages.dart';
import 'package:service_app/app/utils/style/AppColors.dart';
import 'package:service_app/app/utils/widget/header.dart';
import 'package:service_app/app/utils/widget/sideBar.dart';

import '../../../controller/auth_controller.dart';
import '../controllers/detail_iphone_controller.dart';

class DetailIphoneView extends GetView<DetailIphoneController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.HOME),
                                child: Icon(
                                  Ionicons.arrow_back,
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
                                    'Service Kerusakan',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.PrimaryText),
                                  ),
                                  Text(
                                    'Iphonemu Disini',
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
                          Text(
                            'Detail Kerusakan',
                            style: TextStyle(
                                color: AppColors.PrimaryText, fontSize: 25),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(columns: [
                              DataColumn(label: Text('Kerusakan')),
                              DataColumn(label: Text('Lama Pengerjaan')),
                              DataColumn(label: Text('Biaya')),
                            ], rows: [
                              DataRow(cells: [
                                DataCell(Text('Ganti LCD')),
                                DataCell(Text('1 Jam')),
                                DataCell(Text('Rp. 200.000 - Rp. 6.500.000')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Terkena Air')),
                                DataCell(Text('6 Hari')),
                                DataCell(Text('Rp. 400.000 - Rp. 4.500.000')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Tidak Bisa di Charger')),
                                DataCell(Text('3 Hari')),
                                DataCell(Text('Rp. 400.000 - Rp. 4.500.000')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Stuck Logo Apple')),
                                DataCell(Text('3 Hari')),
                                DataCell(Text('Rp. 300.000 - Rp. 4.500.000')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Tombol Home Rusak')),
                                DataCell(Text('30 Menit')),
                                DataCell(Text('Rp. 150.000 - Rp. 450.000')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Tombol Power Rusak')),
                                DataCell(Text('30 Menit')),
                                DataCell(Text('Rp. 200.000 - Rp. 400.000')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Ganti Baterai')),
                                DataCell(Text('1 Jam')),
                                DataCell(Text('Rp. 200.000 - Rp. 2.500.000')),
                              ]),
                              DataRow(cells: [
                                DataCell(
                                    Text('Port Charger Goyang atau Rusak')),
                                DataCell(Text('50 Menit')),
                                DataCell(Text('Rp. 260.000 - Rp. 350.000')),
                              ]),
                            ]),
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
