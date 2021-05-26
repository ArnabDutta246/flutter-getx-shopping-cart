import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasta_shop_getx/pages/home/homeController.dart';
import 'package:pasta_shop_getx/pages/home/widgets/categoriesList.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:pasta_shop_getx/pages/home/widgets/productsList.dart';
import 'package:pasta_shop_getx/widgets/headerSection.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List<Pasta> allPastas = allPasta();

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Text(
              'PastaShop',
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
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
              Container(
                height: 35,
                width: 35,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  image: DecorationImage(
                    image: AssetImage('asset/images/avatar.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            ],
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notes),
              color: Colors.black,
            ),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: CategoriesList(),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: 25,
                ),
                sliver: ProductsList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
