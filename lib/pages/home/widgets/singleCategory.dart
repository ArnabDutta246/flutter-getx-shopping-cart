import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasta_shop_getx/models/categoryModel.dart';
import 'package:pasta_shop_getx/pages/home/homeController.dart';

class SingleCategory extends StatelessWidget {
  final HomeController _controller = Get.find();
  final CategoryModel category;
  final bool selected;
  SingleCategory(this.category, this.selected);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.selectCategoryProduct(category),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.category.name,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87.withOpacity(selected ? 1 : 0.3),
              ),
            ),
            Visibility(
              visible: selected,
              child: Container(
                margin: EdgeInsets.only(top: 3),
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
