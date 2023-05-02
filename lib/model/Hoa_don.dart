// import 'package:firebase_core_web/firebase_core_web_interop.dart';
// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// DatLichData studentFromJson(String str) =>
//     DatLichData.fromJson(json.decode(str));

// String studentToJson(DatLichData data) => json.encode(data.toJson());

class HoaDonData {
  late final String dichvu;
  late final String diachi;
  late final String email;
  late final String ngaydat;
  late final String ngayhoanthanh;
  late final String sdt;
  late final String nhanvien;
  late final String giatien;
  late final String ghichu;
  final String trangthai;
  late final String hinhthucthanhtoan;

  String? id;

  HoaDonData(
      {this.id,
      required this.dichvu,
      required this.diachi,
      required this.email,
      required this.sdt,
      required this.ngaydat,
      required this.ngayhoanthanh,
      required this.nhanvien,
      required this.giatien,
      required this.ghichu,
      required this.hinhthucthanhtoan,
      required this.trangthai});

  factory HoaDonData.fromJson(Map<String, dynamic> json) => HoaDonData(
      id: json["id"],
      dichvu: json["dichvu"],
      diachi: json["diachi"],
      email: json["email"],
      ngaydat: json["ngaydat"],
      ngayhoanthanh: json["ngayhoanthanh"],
      sdt: json["sodienthoai"],
      nhanvien: json["nhanvien"],
      giatien: json["giatien"],
      ghichu: json["ghichu"],
      hinhthucthanhtoan: json["hinhthucthanhtoan"],
      trangthai: json['trangthai']);
  Map<String, dynamic> toJson() => {
        "id": id,
        "dichvu": dichvu,
        "diachi": diachi,
        "email": email,
        "ngaydat": ngaydat,
        "ngayhoanthanh": ngayhoanthanh,
        "sodienthoai": sdt,
        "nhanvien": nhanvien,
        "giatien": giatien,
        "ghichu": ghichu,
        "hinhthucthanhtoan": hinhthucthanhtoan,
        "trangthai": trangthai
      };
}
