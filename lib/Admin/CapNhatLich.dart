// import 'package:chothuenhancong/Admin/LichDat.dart';
// import 'package:chothuenhancong/Staff/HoaDon.dart';
// import 'package:chothuenhancong/model/Dat_lich.dart';
// import 'package:chothuenhancong/model/Hoa_don.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_connect/http/src/request/request.dart';

// class CapNhat extends StatefulWidget {
//   final DatLichData datLichData;

//   const CapNhat({super.key, required this.datLichData});

//   @override
//   State<CapNhat> createState() => _CapNhatState();
// }

// class _CapNhatState extends State<CapNhat> {
//   TextEditingController tendichvuController = TextEditingController();
//   TextEditingController PhoneController = TextEditingController();
//   TextEditingController DiaChiController = TextEditingController();
//   TextEditingController EmailController = TextEditingController();
//   TextEditingController NgaydatController = TextEditingController();
//   TextEditingController NhanvienController = TextEditingController();
//   TextEditingController XacnhanController = TextEditingController();
//   TextEditingController HoanthanhController = TextEditingController();
//   TextEditingController NgayhoanthanhController = TextEditingController();
//   TextEditingController PhanhoiController = TextEditingController();
//   TextEditingController ImageController = TextEditingController();
//   late String image = " ";
//   TextEditingController id = TextEditingController();
//   final auth = FirebaseAuth.instance;
//   final firestoreRef = FirebaseFirestore.instance;

//   // final item = ['Đã thanh toán', 'Chưa thanh toán'];
//   // String? values;
//   final item = ['Chưa xác nhận', 'Đã xác nhận'];
//   final item2 = ['Chưa hoàn thành', 'Đã hoàn thành'];
//   final itemnhanvien = [
//     'Chờ nhân viên',
//     'sd1_SuaDien@gmail.com',
//     'oc1_OngNuoc@gmail.com',
//     'dl1_DienLanh@gmail.com',
//     'dt1_DienTu@gmail.com',
//     'sn1_SuaNha@mail.com',
//     'dn1_DoNuoc@gmail.com'
//   ];

//   String? values;

//   @override
//   void initState() {
//     id = TextEditingController(text: widget.datLichData.id);
//     // TODO: implement initState
//     tendichvuController =
//         TextEditingController(text: widget.datLichData.dichvu);
//     PhoneController = TextEditingController(text: widget.datLichData.sdt);
//     DiaChiController = TextEditingController(text: widget.datLichData.diachi);
//     EmailController = TextEditingController(text: widget.datLichData.email);
//     NgaydatController = TextEditingController(text: widget.datLichData.ngaydat);
//     NgayhoanthanhController =
//         TextEditingController(text: widget.datLichData.ngayhoanthanh);
//     NhanvienController =
//         TextEditingController(text: widget.datLichData.nhanvien);
//     XacnhanController = TextEditingController(text: widget.datLichData.xacnhan);
//     HoanthanhController =
//         TextEditingController(text: widget.datLichData.hoanthanh);
//     PhanhoiController = TextEditingController(text: widget.datLichData.phanhoi);
//     ImageController = TextEditingController(text: widget.datLichData.image);
//     image = ImageController.toString();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         elevation: 0,
//         // title: const Text(
//         //   "THÔNG TIN LICH ĐẶT ",
//         //   style: TextStyle(color: Colors.black),
//         // ),
//         // leading: IconButton(
//         //   icon:
//         //       const Icon(Icons.arrow_back, color: Color.fromARGB(255, 2, 2, 2)),
//         //   onPressed: () {
//         //     Navigator.of(context).pop();
//         //   },
//         // ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(15.0),
//                 child: Text(
//                   'Thông tin lich đặt',
//                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
//                 ),
//               ),
//               getMyFiled(hinText: 'Dịch vụ', controller: tendichvuController),
//               getMyFiled(hinText: 'Địa chỉ', controller: DiaChiController),
//               getMyFiled(hinText: 'Email', controller: EmailController),
//               getMyFiled(hinText: 'Số điện thoại', controller: PhoneController),
//               getMyFiled(hinText: 'Ngày đặt', controller: NgaydatController),
//               getMyFiled(hinText: 'Image', controller: ImageController),

//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   width: 600,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: const <Widget>[
//                       Text(
//                         "Nhân viên",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(fontSize: 15),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 600,
//                 child: DropdownButton<String>(
//                     iconSize: 10,
//                     isExpanded: true,
//                     value: NhanvienController.text,
//                     items: itemnhanvien.map(buildMenuItem).toList(),
//                     onChanged: (value) =>
//                         setState(() => this.NhanvienController.text = value!)),
//               ),
//               // getMyFiled(
//               //     hinText: 'Xác nhận',
//               //     textInputType: TextInputType.text,
//               //     controller: XacnhanController),
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   width: 600,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: const <Widget>[
//                       Text(
//                         "Xác nhận",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(fontSize: 15),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               Container(
//                 width: 600,
//                 child: DropdownButton<String>(
//                     iconSize: 10,
//                     isExpanded: true,
//                     value: XacnhanController.text,
//                     items: item.map(buildMenuItem).toList(),
//                     onChanged: (value) =>
//                         setState(() => this.XacnhanController.text = value!)),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   width: 600,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: const <Widget>[
//                       Text(
//                         "Hoàn thành",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(fontSize: 15),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 600,
//                 child: DropdownButton<String>(
//                     iconSize: 10,
//                     isExpanded: true,
//                     value: HoanthanhController.text,
//                     items: item2.map(buildMenuItem).toList(),
//                     onChanged: (value) =>
//                         setState(() => this.HoanthanhController.text = value!)),
//               ),

//               // getMyFiled(
//               //     hinText: 'Hoàn thành',
//               //     textInputType: TextInputType.text,
//               //     controller: HoanthanhController),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                       onPressed: () {
//                         DatLichData datLichDatas = DatLichData(
//                             id: id.text,
//                             dichvu: tendichvuController.text,
//                             diachi: DiaChiController.text,
//                             email: EmailController.text,
//                             sdt: PhoneController.text,
//                             ngaydat: NgaydatController.text,
//                             nhanvien: NhanvienController.text,
//                             ngayhoanthanh: NgayhoanthanhController.text,
//                             phanhoi: PhanhoiController.text,
//                             xacnhan: XacnhanController.text,
//                             image: "",
//                             hoanthanh: HoanthanhController.text);

//                         final collectionController =
//                             FirebaseFirestore.instance.collection('LichDat');
//                         collectionController
//                             .doc(datLichDatas.id)
//                             .update(datLichDatas.toJson())
//                             .whenComplete(() {
//                           Fluttertoast.showToast(msg: "Cập nhật thành công");
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => AdminLichDat(),
//                               ));
//                         });
//                       },
//                       child: Text("Cập Nhật"))
//                 ],
//               )
//             ],
//           ),
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
