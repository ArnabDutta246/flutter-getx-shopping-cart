import 'package:get/get.dart';

class CategoryModel {
  String name;
  String key;

  CategoryModel({
    required this.key,
    required this.name,
  });

  RxString _key = RxString('');
  set setKey(String value) => this._key.value = value;
  String get getKey => _key.value;

  RxString _name = RxString('');
  set setName(String value) => _name.value = value;
  String get getName => _name.value;
}
