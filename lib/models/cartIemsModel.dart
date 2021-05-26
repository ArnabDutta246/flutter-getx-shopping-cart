import 'package:get/get.dart';
import 'package:pasta_shop_getx/models/productModel.dart';

class CartItemModel {
  ProductModel product;
  int quantity;

  CartItemModel({
    required this.product,
    required this.quantity,
  });

  Rxn<ProductModel> _product = Rxn<ProductModel>();
  set setProduct(ProductModel value) => _product.value = value;
  get getProduct => _product.value;

  RxInt _quantity = RxInt(1);
  set setQuantity(int value) => _quantity.value = value;
  int get getQuantity => _quantity.value;
}
