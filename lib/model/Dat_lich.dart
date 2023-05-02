// import 'package:firebase_core_web/firebase_core_web_interop.dart';
// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// DatLichData studentFromJson(String str) =>
//     DatLichData.fromJson(json.decode(str));

// String studentToJson(DatLichData data) => json.encode(data.toJson());

class DatLichData {
  late final String dichvu;
  final String diachi;
  late final String email;
  final String ngaydat;
  final String ngayhoanthanh;
  final String sdt;
  final String nhanvien;
  final String xacnhan;
  final String hoanthanh;
  final String phanhoi;
  final String image;
  String? id;

  DatLichData(
      {this.id,
      required this.dichvu,
      required this.diachi,
      required this.email,
      required this.sdt,
      required this.ngaydat,
      required this.ngayhoanthanh,
      required this.nhanvien,
      required this.xacnhan,
      required this.phanhoi,
      required this.image,
      required this.hoanthanh});

  factory DatLichData.fromJson(Map<String, dynamic> json) => DatLichData(
        id: json["id"],
        dichvu: json["dichvu"],
        diachi: json["diachi"],
        email: json["email"],
        ngaydat: json["ngaydat"],
        ngayhoanthanh: json["ngayhoanthanh"],
        sdt: json["sodienthoai"],
        nhanvien: json["nhanvien"],
        xacnhan: json["xacnhan"],
        hoanthanh: json["hoanthanh"],
        phanhoi: json["phanhoi"],
        image: json["image"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "dichvu": dichvu,
        "diachi": diachi,
        "email": email,
        "ngaydat": ngaydat,
        "ngayhoanthanh": ngayhoanthanh,
        "sodienthoai": sdt,
        "nhanvien": nhanvien,
        "xacnhan": xacnhan,
        "hoanthanh": hoanthanh,
        "phanhoi": phanhoi,
        "image": image
      };
}
