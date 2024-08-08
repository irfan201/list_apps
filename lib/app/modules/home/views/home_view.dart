import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:list_apps/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                height: 250,
                width: 250,
                'https://biiscorp.com/wp-content/uploads/2022/03/biiscorp-jasa-pembuatan-software-dan-implementasi-erp-orange-2048x426.png'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF13a09c),
                foregroundColor: Colors.white,
                minimumSize: const Size(250, 50),
              ),
              onPressed: () {
                Get.toNamed(Routes.LIST_USER);
              },
              child: const Text('Go to List', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
