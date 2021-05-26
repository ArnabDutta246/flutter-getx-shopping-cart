import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasta_shop_getx/pages/details/detailsController.dart';
import 'package:pasta_shop_getx/pages/details/widgets/detailsSection.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      init: DetailsController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black87,
              ),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/cart');
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
                    color: Colors.black87,
                  ),
                  new Positioned(
                    right: 5,
                    top: 5,
                    child: new Container(
                      padding: EdgeInsets.all(1),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Obx(
                        () => new Text(
                          '${controller.appMainController.cartItems.length > 0 ? controller.appMainController.cartItems.length.toString() : ""}',
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Obx(
                  () => Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(40),
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.46,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        controller.productDetails.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => DetailsSection(controller.productDetails),
                )
              ],
            ),
          ),
          // bottomNavigationBar: Obx(
          //   () => DetailsSection(controller.productDetails),
          // ),
        );
      },
    );
  }
}
