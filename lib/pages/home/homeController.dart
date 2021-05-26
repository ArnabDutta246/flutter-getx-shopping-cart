import 'package:get/get.dart';
import 'package:pasta_shop_getx/controller.dart';
import 'package:pasta_shop_getx/models/categoryModel.dart';
import 'package:pasta_shop_getx/models/productModel.dart';
import 'package:pasta_shop_getx/utils/jsonConverter.dart';

class HomeController extends GetxController {
  // call the main cart list empty
  // AppMainController which initate
  // int the main.dart file
  AppMainController appMainController = Get.find();
  // categories list
  RxList<CategoryModel> categories = RxList<CategoryModel>.empty();
  // products list
  RxList<ProductModel> products = RxList<ProductModel>.empty();
  // selected category
  Rxn<CategoryModel> _selectedCategory = Rxn<CategoryModel>();
  CategoryModel? get selectedCategory => _selectedCategory.value;

  int get cartQuantity {
    return appMainController.cartItems.length;
  }

  HomeController() {
    this.getAllCategories();
  }

  // get all categories
  // from categories.json
  getAllCategories() async {
    List<dynamic> jsonCategories = await loadJson(
      "asset/data/categories.json",
    );
    // push all jsonCategories into categories RxList
    categories.addAll(
      jsonCategories
          .map<CategoryModel>(
            (category) => CategoryModel(
              key: category["key"],
              name: category["name"],
            ),
          )
          .toList(),
    );

    this.selectCategoryProduct(categories.first);
  }

  // selected category
  // and return these category related products
  selectCategoryProduct(CategoryModel category) async {
    _selectedCategory.value = category;
    // print("selectCategoryProduct....");
    // print(category);
    // print(category.key);
    List<dynamic> jsonDataProduct = await loadJson(
      'asset/data/products.json',
    );

    products.value = jsonDataProduct
        .where((item) => item["category"] == category.key)
        .map<ProductModel>(
          (product) => ProductModel(
            id: product["id"],
            name: product["name"],
            category: product["category"],
            subtitle: product["subtitle"],
            price: product["price"],
            image: product["image"],
            description: product["description"],
          ),
        )
        .toList();

    // print(products.value);
  }
}
