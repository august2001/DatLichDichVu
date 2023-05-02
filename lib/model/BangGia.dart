// import 'package:firebase_core_web/firebase_core_web_interop.dart';
// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// DatLichData studentFromJson(String str) =>
//     DatLichData.fromJson(json.decode(str));

// String studentToJson(DatLichData data) => json.encode(data.toJson());

class BangGia {
  final String ten;
  final String image;
  final String gia;

  BangGia({required this.ten, required this.image, required this.gia});

  factory BangGia.fromJson(Map<String, dynamic> json) => BangGia(
        ten: json["ten"],
        image: json["image"],
        gia: json["gia"],
      );
  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "dichvu": dichvu,
  //       "diachi": diachi,
  //       "email": email,
  //       "ngaydat": ngaydat,
  //       "ngayhoanthanh": ngayhoanthanh,
  //       "sodienthoai": sdt,
  //       "nhanvien": nhanvien,
  //       "xacnhan": xacnhan,
  //       "hoanthanh": hoanthanh,
  //       "phanhoi": phanhoi
  //     };
}
