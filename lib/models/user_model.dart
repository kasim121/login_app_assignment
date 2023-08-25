// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    int id;
    String name;
    int age;
    String message;
    List<int> championships;

    UserModel({
        required this.id,
        required this.name,
        required this.age,
        required this.message,
        required this.championships,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        message: json["message"],
        championships: List<int>.from(json["championships"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "message": message,
        "championships": List<dynamic>.from(championships.map((x) => x)),
    };
}
