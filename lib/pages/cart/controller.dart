import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasta_shop_getx/controller.dart';
import 'package:pasta_shop_getx/models/cartIemsModel.dart';

class CartController extends GetxController {
  //call app main controller
  AppMainController appMainController = Get.find();
  // RxInt quantity = RxInt(0);
  RxString totalAmountString = RxString("\$" + 0.toString());
  RxBool cartEmpty = RxBool(false);

  CartController();
  @override
  void onReady() {
    super.onReady();
    totalAmount;
  }

  // get total amount
  String get totalAmount {
    // fold the list items price
    // work as reduce in Js
    double total = appMainController.cartItems.fold(
      0,
      (previousValue, element) {
        print(element.product.price);
        print(element.quantity);
        return previousValue + element.product.price * element.quantity;
      },
    );
    isCartEmpty = (total == 0) ? false : true;
    print("New result we get");
    print(isCartEmpty);
    this.totalAmountString.value = "\$" + total.toStringAsFixed(2);
    return "\$" + total.toStringAsFixed(2);
  }

  String get totalAmountResult => this.totalAmountString.value;
  set isCartEmpty(bool value) => cartEmpty.value = value;
  bool get isCartEmpty => cartEmpty.value;
  // increment
  incrementQuantity(CartItemModel cartItem) {
    if (cartItem.quantity >= 10) {
      cartItem.quantity = 10;
    } else {
      cartItem.quantity += 1;
    }
    setQuantityAmount(cartItem: cartItem);
  }

//decrement
  decrementQuantity(CartItemModel cartItem) {
    bool deleteFromList = false;
    if (cartItem.quantity <= 1) {
      cartItem.quantity = 1;
      deleteFromList = true;
    } else {
      cartItem.quantity -= 1;
    }
    setQuantityAmount(cartItem: cartItem, deleteAction: deleteFromList);
  }

  // delete product
  deleteProduct(CartItemModel cartItemModel) {
    appMainController.cartItems.removeWhere(
        (cartItem) => cartItem.product.id == cartItemModel.product.id);
    totalAmount;
  }

  // getProduct Quantity
  setQuantityAmount(
      {required CartItemModel cartItem, bool deleteAction = false}) {
    // update the total amount
    cartItem.setQuantity = cartItem.quantity;
    if (deleteAction) deleteProduct(cartItem);
    totalAmount;
  }

  // placed order
  placedOrder() {
    appMainController.cartItems.clear();
    Get.back();
    Get.snackbar(
      "Placed",
      "Order placed with success!",
      backgroundColor: Colors.black54,
      colorText: Colors.white,
      padding: EdgeInsets.all(15),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(25),
    );
  }
}
