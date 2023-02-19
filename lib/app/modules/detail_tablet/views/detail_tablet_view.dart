import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_tablet_controller.dart';

class DetailTabletView extends GetView<DetailTabletController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailTabletView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailTabletView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
