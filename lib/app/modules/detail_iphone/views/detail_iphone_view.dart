import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:service_app/app/routes/app_pages.dart';
import 'package:service_app/app/utils/style/AppColors.dart';
import 'package:service_app/app/utils/widget/header.dart';
import 'package:service_app/app/utils/widget/sideBar.dart';

import '../controllers/detail_iphone_controller.dart';

class DetailIphoneView extends GetView<DetailIphoneController> {
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
                                    'Androidmu Disini',
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
                                DataCell(Text('Baterai Cepat Habis')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Layar LCD HP-mu Pecah')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Kerusakan Port Charger')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Kerusakan Kamera')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Kerusakan Speaker')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Kerusakan Software')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Touchscreen Error')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Baterai Kembung')),
                                DataCell(Text('')),
                                DataCell(Text('')),
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
