import 'dart:convert';

import 'package:http/http.dart' as http;

import '../consts/api_const.dart';
import '../model/category_model.dart';
import '../model/products_model.dart';
import '../model/users_model.dart';

class ApiHandler {
  static Future<dynamic> getData(
      {required String target, String? limit = "10"}) async {
    try {
      Uri uri = Uri.https(BASE_URL, "api/v1/$target",
          target == "products" ? {"offset": "0", "limit": limit} : {});
      var response = await http.get(uri);
      var data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw data['message'];
      }

      List tempList = [];
      for (var item in data) {
        tempList.add(item);
      }
      return tempList;
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<List<ProductsModel>> getAllProducts(
      {required String limit}) async {
    List data = await getData(target: "products", limit: limit);
    return ProductsModel.productFromSnapshot(data);
  }

  static Future<List<CategoryModel>> getAllCategories() async {
    List data = await getData(target: "categories");
    return CategoryModel.categoryFromSnapshot(data);
  }

  static Future<List<UsersModel>> getAllUsers() async {
    List data = await getData(target: "users");
    return UsersModel.userFromSnapshot(data);
  }

  static Future<ProductsModel> getProductModel(
      {required String productId}) async {
    try {
      Uri uri = Uri.https(BASE_URL, "api/v1/products/$productId");
      var response = await http.get(uri);
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }
      return ProductsModel.fromJson(data);
    } catch (error) {
      throw error.toString();
    }
  }
}
