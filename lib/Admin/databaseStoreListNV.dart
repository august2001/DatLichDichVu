// import 'package:chothuenhancong/model/nhanvien.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class DSNVList extends StatelessWidget {
//   const DSNVList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var dsnvList = FirebaseFirestore.instance
//         .collection('users')
//         .where('role', isEqualTo: 'nhanvien');
//     // .orderBy('role')
//     // .startAt(['nhanvien']);

//     Widget NVData({int? flex, String? text, Widget? widget}) {
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
//       stream: dsnvList.snapshots(),
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
//               NhanVienModel nv = NhanVienModel.fromJson(
//                   snapshot.data!.docs[index].data() as Map<String, dynamic>);
//               // NhanVienModel nv = NhanVienModel.fromJson(
//               //     snapshot.data!.docs[index].data() as Map<String, dynamic>);
//               return Row(
//                 children: [
//                   NVData(flex: 1, text: nv.email),
//                   NVData(flex: 1, text: nv.firstName),
//                   NVData(flex: 1, text: nv.secondName),
//                   NVData(flex: 1, text: nv.phone),
//                   NVData(flex: 1, text: nv.ngaysinh),
//                   NVData(flex: 1, text: nv.congviec)
//                 ],
//               );
//             });
//       },
//     );
//   }
// }
