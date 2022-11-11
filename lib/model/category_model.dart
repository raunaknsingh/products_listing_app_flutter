import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// id : 1
/// name : "Clothes"
/// image : "https://api.lorem.space/image/fashion?w=640&h=480&r=782"

class CategoryModel with ChangeNotifier {
  CategoryModel({
    this.id,
    this.name,
    this.image,
  });

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

  static List<CategoryModel> categoryFromSnapshot(List categorySnapshot) {
    return categorySnapshot
        .map((snapshot) => CategoryModel.fromJson(snapshot))
        .toList();
  }
}
