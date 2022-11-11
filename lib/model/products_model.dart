import 'package:flutter/cupertino.dart';

import 'category_model.dart';

/// id : 18
/// title : "Ergonomic Plastic Chicken"
/// price : 988
/// description : "Boston's most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles"
/// category : {"id":1,"name":"Clothes","image":"https://api.lorem.space/image/fashion?w=640&h=480&r=782"}
/// images : ["https://api.lorem.space/image/fashion?w=640&h=480&r=9032","https://api.lorem.space/image/fashion?w=640&h=480&r=521","https://api.lorem.space/image/fashion?w=640&h=480&r=6930"]

class ProductsModel with ChangeNotifier {
  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.images,
  });

  ProductsModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  int? id;
  String? title;
  int? price;
  String? description;
  CategoryModel? category;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['images'] = images;
    return map;
  }

  static List<ProductsModel> productFromSnapshot(List productSnapshot) {
    return productSnapshot
        .map((snapshot) => ProductsModel.fromJson(snapshot))
        .toList();
  }
}
