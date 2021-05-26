import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pasta_shop_getx/pages/cart/controller.dart';
import 'package:pasta_shop_getx/pages/cart/widget/cartList.dart';
import 'package:pasta_shop_getx/pages/cart/widget/cartTotal.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Text(
              "Your Cart",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black87,
              ),
            ),
            actions: [],
          ),
          body: CartList(),
          bottomNavigationBar: CartTotal(),
        );
      },
    );
  }
}
