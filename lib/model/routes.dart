import 'package:catapp/view/detail/detail_page.dart';
import 'package:catapp/view/home/home_page.dart';
import 'package:catapp/view/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart' as route;

final routes = [
  GetPage(
    name: '/',
    page: () => const SplashPage(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    transition: route.Transition.fadeIn,
    transitionDuration: const Duration(
      milliseconds: 1000,
    ),
  ),
  GetPage(
    name: '/detail_cat',
    page: () => const DetailPage(),
    transition: route.Transition.fadeIn,
    transitionDuration: const Duration(
      milliseconds: 1000,
    ),
  ),
];
