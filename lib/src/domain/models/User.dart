import 'package:ecommerce_flutter/src/domain/models/Role.dart';

class User {
    int? id;
    String name;
    String lastname;
    String email;
    String phone;
    String? password;
    String? image;
    String? notificationToken;
    DateTime? createdAt;
    DateTime? updateAt;
    List<Role>? roles;

    User({
        this.id,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        this.password,
        this.image,
        this.notificationToken,
        this.createdAt,
        this.updateAt,
        this.roles,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        password: json["password"],
        notificationToken: json["notification_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updateAt: DateTime.parse(json["update_at"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "image": image,
        "notification_token": notificationToken,
        "created_at": createdAt.toIso8601String(),
        "update_at": updateAt.toIso8601String(),
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    };
}