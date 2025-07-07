import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_tab_bar_controller.dart';

class BottomTabBarView extends GetView<BottomTabBarController> {
  const BottomTabBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomTabBarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BottomTabBarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
