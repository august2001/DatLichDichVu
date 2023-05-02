import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? phone;
  String? password;
  String? image;
  String? role;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.phone,
      this.password,
      this.image,
      this.role});

  // receiving data form server
  factory UserModel.fromMa(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        secondName: map['secondName'],
        phone: map['phone'],
        password: map['password'],
        image: map['image'],
        role: map['role']);
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'phone': phone,
      'password': password,
      'image': image,
      'role': role
    };
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email']! as String;
    firstName = json['firstName']! as String;
    secondName = json['secondName']! as String;
    phone = json['phone']! as String;
    password = json['password'];
    image = json['image'];
    role = json['role'];
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
        uid: document.id,
        email: data["email"],
        firstName: data["firstName"],
        secondName: data["secondName"],
        phone: data["phone"],
        password: data["password"],
        image: data["image"],
        role: data["role"]);
  }
  Map<String, Object?> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'phone': phone,
    };
  }
}
