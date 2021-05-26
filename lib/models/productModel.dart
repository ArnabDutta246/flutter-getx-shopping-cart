import 'package:get/get.dart';

class ProductModel {
  int id;
  String name;
  String category;
  String subtitle;
  int price;
  String image;
  String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.description,
  });

  RxInt _id = RxInt(0);
  set setId(int value) => _id.value = value;
  int get getId => _id.value;

  RxString _name = RxString('');
  set setName(String value) => _name.value = value;
  String get getName => _name.value;

  RxString _category = RxString('');
  set setCategroy(String value) => _category.value = value;
  String get getCategory => this.category;

  RxString _subtitle = RxString('');
  set setSubtitle(String value) => _subtitle.value = value;
  String get getSubtitle => this._subtitle.value;

  RxString _image = RxString('');
  set setImage(String value) => this._image.value = value;
  String get getImage => _image.value;

  RxInt _price = RxInt(0);
  set setPrice(int value) => this._price.value = value;
  int get getPrice => _price.value;

  RxString _description = RxString('');
  set setDescription(String value) => _description.value = value;
  String get getDescription => _description.value;
}
