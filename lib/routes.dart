import 'package:get/route_manager.dart';
import 'package:pasta_shop_getx/pages/cart/index.dart';
import 'pages/intro/index.dart';
import 'pages/cart/index.dart';
import 'pages/home/index.dart';
import 'pages/details/index.dart';

routes() => [
      GetPage(
          name: "/",
          page: () => IntroPage(),
          transition: Transition.rightToLeft),
      GetPage(
          name: "/home",
          page: () => HomePage(),
          transition: Transition.rightToLeft),
      GetPage(
          name: "/products/:id",
          page: () => ProductDetails(),
          transition: Transition.fade),
      GetPage(
          name: "/cart",
          page: () => CartPage(),
          transition: Transition.rightToLeft),
    ];
