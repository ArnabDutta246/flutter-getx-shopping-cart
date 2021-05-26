import 'package:get/state_manager.dart';
import 'package:pasta_shop_getx/models/cartIemsModel.dart';

class AppMainController extends GetxController {
  RxList<CartItemModel> cartItems = RxList<CartItemModel>.empty(growable: true);
}
