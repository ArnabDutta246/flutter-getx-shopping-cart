import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasta_shop_getx/models/cartIemsModel.dart';
import 'package:pasta_shop_getx/pages/cart/controller.dart';

class CartItem extends StatelessWidget {
  final CartController cartController = Get.find();
  final CartItemModel cartItem;

  CartItem(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  this.cartItem.product.image,
                ),
              ),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  cartItem.product.name,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Obx(
                      () {
                        return Text(
                          "${cartItem.getQuantity.toString()}x ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    Text(
                      "${this.cartItem.product.price.toString()}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RawMaterialButton(
                constraints: BoxConstraints.tight(Size(36, 36)),
                onPressed: () =>
                    cartController.decrementQuantity(this.cartItem),
                elevation: 2.0,
                fillColor: Colors.orange,
                child: Icon(
                  Icons.remove,
                  size: 18.0,
                ),
                padding: EdgeInsets.all(3.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                constraints: BoxConstraints.tight(Size(36, 36)),
                onPressed: () =>
                    cartController.incrementQuantity(this.cartItem),
                elevation: 2.0,
                fillColor: Colors.orange,
                child: Icon(
                  Icons.add,
                  size: 18.0,
                ),
                padding: EdgeInsets.all(3.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                constraints: BoxConstraints.tight(Size(36, 36)),
                onPressed: () => cartController.deleteProduct(this.cartItem),
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.delete_outline,
                  size: 18.0,
                ),
                padding: EdgeInsets.all(3.0),
                shape: CircleBorder(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
