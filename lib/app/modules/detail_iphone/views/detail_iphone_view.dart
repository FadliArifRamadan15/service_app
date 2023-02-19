import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_iphone_controller.dart';

class DetailIphoneView extends GetView<DetailIphoneController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailIphoneView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailIphoneView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
