import 'package:get/get.dart';
import 'package:pasta_shop_getx/controller.dart';
import 'package:pasta_shop_getx/models/cartIemsModel.dart';
import 'package:pasta_shop_getx/models/productModel.dart';
import 'package:pasta_shop_getx/utils/jsonConverter.dart';
import 'package:flutter/material.dart';

class DetailsController extends GetxController {
  AppMainController appMainController = Get.find();
  Rxn<ProductModel> _product = Rxn<ProductModel>();
  setProduct(ProductModel value) => _product.value = value;

  get productDetails => _product.value;

  DetailsController() {
    getProduct();
  }
  getProduct() async {
    try {
      // fetch the product
      List<dynamic> jsonProductsData =
          await loadJson("asset/data/products.json");

      dynamic item = await jsonProductsData.firstWhere((item) {
        return item["id"].toString() == Get.parameters["id"].toString();
      });
      //set the product
      setProduct(ProductModel(
          id: item["id"],
          name: item["name"],
          category: item["category"],
          subtitle: item["subtitle"],
          price: item["price"],
          image: item["image"],
          description: item["description"]));

      print("the current details product");
      print(item);
    } catch (err) {
      print(err.toString());
    }
  }

  addProduct() {
    print("add product function calling");
    try {
      CartItemModel cartItem =
          appMainController.cartItems.value.firstWhere((cartItem) {
        return cartItem.product.id == this.productDetails.id;
      });
      //cartItem.incrementQuantity();
      print("the added product is:");
      print(cartItem.product.name);
      customeSnackbar("Added", "This product has already added !!");

      print("added products");
      print(appMainController.cartItems
          .map((element) => print(element.product.name)));
    } catch (err) {
      appMainController.cartItems
          .add(CartItemModel(product: this.productDetails, quantity: 1));
      customeSnackbar("Added", "This product added in your cart!!");

      print("added products");
      print(appMainController.cartItems
          .map((element) => print(element.product.name)));
    }
  }

  customeSnackbar(String title, String message) {
    Get.snackbar(
      "$title",
      "$message",
      backgroundColor: Colors.black,
      colorText: Colors.white,
      padding: EdgeInsets.all(15),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(25),
    );
  }
}
