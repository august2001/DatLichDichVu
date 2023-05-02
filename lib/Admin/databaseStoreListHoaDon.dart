// import 'package:chothuenhancong/model/Hoa_don.dart';
// import 'package:chothuenhancong/model/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class DSHDList extends StatelessWidget {
//   const DSHDList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var dshdList = FirebaseFirestore.instance.collection('HoaDon');

//     // .orderBy('role')
//     // .startAt(['nhanvien']);

//     Widget KHData({int? flex, String? text, Widget? widget}) {
//       return Expanded(
//         flex: flex!,
//         child: Container(
//           decoration:
//               BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: widget == null ? Text(text!) : widget,
//           ),
//         ),
//       );
//     }

//     return StreamBuilder<QuerySnapshot>(
//       stream: dshdList.snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const LinearProgressIndicator();
//         }

//         return ListView.builder(
//             shrinkWrap: true,
//             itemCount: snapshot.data!.size,
//             itemBuilder: (context, index) {
//               HoaDonData user = HoaDonData.fromJson(
//                   snapshot.data!.docs[index].data() as Map<String, dynamic>);
//               return Row(
//                 children: [
//                   KHData(flex: 3, text: user.dichvu),
//                   KHData(flex: 4, text: user.diachi),
//                   KHData(flex: 5, text: user.email),
//                   KHData(flex: 6, text: user.ghichu),
//                   KHData(flex: 4, text: user.giatien),
//                   KHData(flex: 4, text: user.ngaydat),
//                   KHData(flex: 6, text: user.ngayhoanthanh),
//                   KHData(flex: 6, text: user.nhanvien),
//                   KHData(flex: 4, text: user.sdt),
//                   KHData(flex: 4, text: user.trangthai),
//                   KHData(flex: 4, text: user.hinhthucthanhtoan),
//                 ],
//               );
//             });
//       },
//     );
//   }
// }
