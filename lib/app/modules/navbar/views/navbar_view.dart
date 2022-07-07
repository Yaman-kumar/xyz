import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NavbarView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NavbarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
