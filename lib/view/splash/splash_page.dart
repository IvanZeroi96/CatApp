import 'package:catapp/controller/splash/splash_controller.dart';
import 'package:catapp/model/colors.dart';
import 'package:catapp/model/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (getX) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CAColors.red,
                    CAColors.white,
                  ],
                  stops: [0.1, 0.8],
                  tileMode: TileMode.clamp,
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(Common().baseUrlLogoCat),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
