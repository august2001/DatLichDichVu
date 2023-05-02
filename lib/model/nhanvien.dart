import 'package:cloud_firestore/cloud_firestore.dart';

class NhanVienModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? phone;
  String? password;
  String? image;
  String? role;
  String? congviec;
  String? ngaysinh;

  NhanVienModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.phone,
      this.password,
      this.image,
      this.role,
      this.ngaysinh,
      this.congviec});

  // receiving data form server
  factory NhanVienModel.fromMa(map) {
    return NhanVienModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        secondName: map['secondName'],
        phone: map['phone'],
        password: map['password'],
        image: map['image'],
        congviec: map['congviec'],
        ngaysinh: map['ngaysinh'],
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
      'congviec': congviec,
      'ngaysinh': ngaysinh,
      'role': role
    };
  }

  NhanVienModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email']! as String;
    firstName = json['firstName']! as String;
    secondName = json['secondName']! as String;
    phone = json['phone']! as String;
    password = json['password']! as String;
    image = json['image'];
    congviec = json['congviec']! as String;
    ngaysinh = json['ngaysinh']! as String;
    role = json['role']! as String;
  }

  factory NhanVienModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return NhanVienModel(
        uid: document.id,
        email: data["email"],
        firstName: data["firstName"],
        secondName: data["secondName"],
        phone: data["phone"],
        password: data["password"],
        image: data["image"],
        congviec: data["congviec"],
        ngaysinh: data["ngaysinh"],
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
