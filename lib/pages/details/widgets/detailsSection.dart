import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasta_shop_getx/models/productModel.dart';
import 'package:pasta_shop_getx/pages/details/detailsController.dart';

class DetailsSection extends StatelessWidget {
  final DetailsController _controller = Get.find();
  //final ProductModel product;
  DetailsSection(product);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.40,
      padding: EdgeInsets.all(25),
      //height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Obx(
            () => Text(
              _controller.productDetails.name,
              style: TextStyle(
                fontSize: 21,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Obx(
            () => Text(
              _controller.productDetails.subtitle,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black54,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 18),
          Obx(
            () => Text(
              _controller.productDetails.description,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black38,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 3),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "\$ ${_controller.productDetails.price.toString()}",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: Text('Add To Card'),
                  onPressed: () => _controller.addProduct(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
