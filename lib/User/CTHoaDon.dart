// import 'dart:developer';

// import 'package:chothuenhancong/Admin/LichDat.dart';
// import 'package:chothuenhancong/model/Dat_lich.dart';
// import 'package:chothuenhancong/model/Hoa_don.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class CTHoaDon extends StatelessWidget {
//   final HoaDonData hoaDonData;
//   CTHoaDon({super.key, required this.hoaDonData});

//   TextEditingController tendichvuController = TextEditingController();
//   TextEditingController PhoneController = TextEditingController();
//   TextEditingController DiaChiController = TextEditingController();
//   TextEditingController EmailController = TextEditingController();
//   TextEditingController NgaydatController = TextEditingController();
//   TextEditingController NgayhoanthanhController = TextEditingController();
//   TextEditingController NhanvienController = TextEditingController();
//   TextEditingController GhichuController = TextEditingController();
//   TextEditingController GiatienController = TextEditingController();
//   TextEditingController TrangthaiController = TextEditingController();
//   TextEditingController HTThanhtoanController = TextEditingController();
//   final item = ['', 'Thanh toán bằng tiền mặt', 'Thanh toán qua ATM'];

//   String? values;
//   @override
//   Widget build(BuildContext context) {
//     tendichvuController.text = '${hoaDonData.dichvu}';

//     PhoneController.text = '${hoaDonData.sdt}';
//     DiaChiController.text = '${hoaDonData.diachi}';
//     EmailController.text = '${hoaDonData.email}';
//     NgaydatController.text = '${hoaDonData.ngaydat}';
//     NgayhoanthanhController.text = '${hoaDonData.ngayhoanthanh}';

//     NhanvienController.text = '${hoaDonData.nhanvien}';
//     GhichuController.text = '${hoaDonData.ghichu}';
//     GiatienController.text = '${hoaDonData.giatien}';
//     TrangthaiController.text = '${hoaDonData.trangthai}';
//     HTThanhtoanController.text = '${hoaDonData.hinhthucthanhtoan}';

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         elevation: 0,
//         title: const Text(
//           "THÔNG TIN HÓA ĐƠN ",
//           style: TextStyle(color: Colors.black),
//         ),
//         leading: IconButton(
//           icon:
//               const Icon(Icons.arrow_back, color: Color.fromARGB(255, 2, 2, 2)),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             getMyFiled(hinText: 'Dịch vụ', controller: tendichvuController),
//             getMyFiled(hinText: 'Địa chỉ', controller: DiaChiController),
//             getMyFiled(hinText: 'Email', controller: EmailController),
//             getMyFiled(hinText: 'Số điện thoại', controller: PhoneController),
//             getMyFiled(hinText: 'Ngày đặt', controller: NgaydatController),
//             getMyFiled(
//                 hinText: 'Nhân viên',
//                 textInputType: TextInputType.text,
//                 controller: NhanvienController),
//             getMyFiled(
//                 hinText: 'Tên dịch vụ',
//                 textInputType: TextInputType.text,
//                 controller: tendichvuController),
//             getMyFiled(
//                 hinText: 'Hoàn thành',
//                 textInputType: TextInputType.text,
//                 controller: NgayhoanthanhController),
//             getMyFiled(hinText: 'Ghi chú', controller: GhichuController),
//             getMyFiled(hinText: 'Trang thai', controller: TrangthaiController),
//             getMyFiled(hinText: 'Gia tien', controller: GiatienController),
//             // getMyFiled(
//             //     hinText: 'Hình thức thanh toán',
//             //     controller: HTThanhtoanController),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 child: DropdownButton<String>(
//                     isExpanded: true,
//                     value: HTThanhtoanController.text,
//                     items: item.map(buildMenuItem).toList(),
//                     onChanged: (value) => HTThanhtoanController.text),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       HoaDonData datLichDatas = HoaDonData(
//                           id: hoaDonData.id,
//                           dichvu: tendichvuController.text,
//                           diachi: DiaChiController.text,
//                           email: EmailController.text,
//                           sdt: PhoneController.text,
//                           ngaydat: NgaydatController.text,
//                           nhanvien: NhanvienController.text,
//                           ngayhoanthanh: NgayhoanthanhController.text,
//                           ghichu: GhichuController.text,
//                           giatien: GiatienController.text,
//                           trangthai: TrangthaiController.text,
//                           hinhthucthanhtoan: HTThanhtoanController.text);

//                       final collectionController =
//                           FirebaseFirestore.instance.collection('HoaDon');
//                       collectionController
//                           .doc(datLichDatas.id)
//                           .update(datLichDatas.toJson())
//                           .whenComplete(() {
//                         Fluttertoast.showToast(msg: "Cập nhật thành công");
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //       builder: (context) => AdminLichDat(),
//                         //     ));
//                       });
//                     },
//                     child: Text("Cập Nhật"))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget getMyFiled(
//       {required String hinText,
//       TextInputType textInputType = TextInputType.name,
//       required TextEditingController controller}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 600,
//         child: TextFormField(
//             controller: controller,
//             keyboardType: textInputType,
//             decoration: InputDecoration(
//                 hintText: 'Enter $hinText',
//                 labelText: hinText,
//                 contentPadding: EdgeInsets.zero
//                 // border: const OutlineInputBorder(
//                 //     borderRadius: BorderRadius.all(Radius.circular(5))),
//                 )),
//       ),
//     );
//   }

//   DropdownMenuItem<String> buildMenuItem(String e) => DropdownMenuItem(
//       value: e,
//       child: Text(
//         e,
//         style: TextStyle(fontSize: 15),
//       ));
// }
