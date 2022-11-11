import 'package:flutter/cupertino.dart';

/// id : 1
/// email : "john@mail.com"
/// password : "changeme"
/// name : "Jhon"
/// role : "customer"
/// avatar : "https://api.lorem.space/image/face?w=640&h=480&r=326"

class UsersModel with ChangeNotifier {
  UsersModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
  });

  UsersModel.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
  }
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['role'] = role;
    map['avatar'] = avatar;
    return map;
  }

  static List<UsersModel> userFromSnapshot(List userSnapshot) {
    return userSnapshot
        .map((snapshot) => UsersModel.fromJson(snapshot))
        .toList();
  }
}
