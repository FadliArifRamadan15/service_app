import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_ipad_controller.dart';

class DetailIpadView extends GetView<DetailIpadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailIpadView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailIpadView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
