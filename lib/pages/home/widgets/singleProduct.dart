import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasta_shop_getx/models/productModel.dart';

class SingleProduct extends StatelessWidget {
  final ProductModel product;
  SingleProduct(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 9,
            spreadRadius: 0.4,
          ),
        ],
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(5),
      // margin: EdgeInsets.only(
      //     right: this.index != null ? 5 : 0, left: index == 0 ? 5 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  this.product.category,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.3,
          ),
          Container(
            height: 190,
            child: Center(
              child: Hero(
                tag: this.product.name,
                child: Image.asset(
                  this.product.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.3,
          ),
          Text(
            this.product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            this.product.subtitle,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
              height: 1,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$' + this.product.price.toString(),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                RawMaterialButton(
                  constraints: BoxConstraints.tight(Size(36, 36)),
                  onPressed: () {
                    // print("the details pass product");
                    // print(this.product.id.toString());
                    String id = this.product.id.toString();
                    Get.toNamed("/products/$id", arguments: id);
                  },
                  elevation: 2.0,
                  fillColor: Colors.orange,
                  child: Icon(
                    Icons.add,
                    size: 29.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(3.0),
                  shape: CircleBorder(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
