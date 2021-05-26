import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasta_shop_getx/pages/cart/controller.dart';

import 'cartItem.dart';

class CartList extends StatelessWidget {
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.appMainController.cartItems.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 60,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    "On Items Added Yet!!",
                    style: TextStyle(fontSize: 23),
                  )
                ],
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(14),
              itemCount: controller.appMainController.cartItems.length,
              separatorBuilder: (context, index) => Divider(height: 25),
              itemBuilder: (context, index) {
                return CartItem(controller.appMainController.cartItems[index]);
              },
            );
    });
  }
}
