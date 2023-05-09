import 'package:catapp/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cats'),
          ),
          body: Container(),
        );
      },
    );
  }
}
