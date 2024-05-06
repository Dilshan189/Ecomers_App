// To parse this JSON data, do
//
//     final catrgoryModel = catrgoryModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

CatrgoryModel catrgoryModelFromJson(String str) => CatrgoryModel.fromJson(json.decode(str));



class CatrgoryModel {
  List<Category> categories;

  CatrgoryModel({
    required this.categories,
  });

  factory CatrgoryModel.fromJson(Map<String, dynamic> json) => CatrgoryModel(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );


}

class Category {
  String name;
  List<String> subcategory;

  Category({
    required this.name,
    required this.subcategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    subcategory: List<String>.from(json["subcategory"].map((x) => x)),
  );


}
