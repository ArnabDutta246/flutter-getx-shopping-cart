import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasta_shop_getx/pages/cart/controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border(
          top: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "TOTAL",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(
                    () {
                      return Text(
                        controller.totalAmountResult,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Obx(
              () => Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  icon: Icon(Icons.shopping_bag),
                  label: Text('Order Placed'),
                  onPressed: controller.isCartEmpty
                      ? () => controller.placedOrder()
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
