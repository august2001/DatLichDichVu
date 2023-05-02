// import 'dart:developer';

// import 'package:chothuenhancong/Admin/LichDat.dart';
// import 'package:chothuenhancong/model/Dat_lich.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class UploadLichdat extends StatelessWidget {
//   final DatLichData datLichData;
//   UploadLichdat({super.key, required this.datLichData});

//   final TextEditingController tendichvuController = TextEditingController();
//   final TextEditingController PhoneController = TextEditingController();
//   final TextEditingController DiaChiController = TextEditingController();
//   final TextEditingController EmailController = TextEditingController();
//   final TextEditingController NgaydatController = TextEditingController();
//   final TextEditingController NhanvienController = TextEditingController();
//   final TextEditingController XacnhanController = TextEditingController();
//   final TextEditingController HoanthanhController = TextEditingController();
//   final TextEditingController NgayhoanthanhController = TextEditingController();
//   final TextEditingController PhanhoiController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     tendichvuController.text = '${datLichData.dichvu}';
//     PhoneController.text = '${datLichData.sdt}';
//     DiaChiController.text = '${datLichData.diachi}';
//     EmailController.text = '${datLichData.email}';
//     NgaydatController.text = '${datLichData.ngaydat}';
//     NhanvienController.text = '${datLichData.nhanvien}';
//     XacnhanController.text = '${datLichData.xacnhan}';
//     HoanthanhController.text = '${datLichData.hoanthanh}';
//     NgayhoanthanhController.text = '${datLichData.ngayhoanthanh}';
//     PhanhoiController.text = '${datLichData.phanhoi}';

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(15.0),
//               child: Text(
//                 'Thông tin lich đặt',
//                 style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
//               ),
//             ),
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
//                 hinText: 'Xác nhận',
//                 textInputType: TextInputType.text,
//                 controller: XacnhanController),
//             getMyFiled(
//                 hinText: 'Hoàn thành',
//                 textInputType: TextInputType.text,
//                 controller: HoanthanhController),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       DatLichData datLichDatas = DatLichData(
//                           id: datLichData.id,
//                           dichvu: tendichvuController.text,
//                           diachi: DiaChiController.text,
//                           email: EmailController.text,
//                           sdt: PhoneController.text,
//                           ngaydat: NgaydatController.text,
//                           nhanvien: NhanvienController.text,
//                           ngayhoanthanh: NgayhoanthanhController.text,
//                           phanhoi: PhanhoiController.text,
//                           xacnhan: XacnhanController.text,
//                           image: "",
//                           hoanthanh: HoanthanhController.text);

//                       final collectionController =
//                           FirebaseFirestore.instance.collection('LichDat');
//                       collectionController
//                           .doc(datLichDatas.id)
//                           .update(datLichDatas.toJson())
//                           .whenComplete(() {
//                         Fluttertoast.showToast(msg: "Cập nhật thành công");
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => AdminLichDat(),
//                             ));
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
// }
