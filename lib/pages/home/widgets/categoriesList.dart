import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasta_shop_getx/models/categoryModel.dart';
import 'package:pasta_shop_getx/pages/home/homeController.dart';
import 'package:pasta_shop_getx/pages/home/widgets/singleCategory.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // call the home controller
    final HomeController _controller = Get.find();
    //print(_controller.categories.length);

    return Obx(() {
      return SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: 50),
          itemCount: _controller.categories.length,
          itemBuilder: (_, index) {
            CategoryModel category = _controller.categories.elementAt(index);
            return Obx(() {
              return SingleCategory(
                category,
                category == _controller.selectedCategory,
              );
            });
          },
        ),
      );
    });
  }
}
