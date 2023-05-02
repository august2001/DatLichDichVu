// import 'package:chothuenhancong/Admin/CapNhatLich.dart';
// import 'package:chothuenhancong/Admin/UploadLichdat.dart';
// import 'package:chothuenhancong/model/Dat_lich.dart';
// import 'package:chothuenhancong/model/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class DSLichDatList extends StatelessWidget {
//   const DSLichDatList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference dslichdatList =
//         FirebaseFirestore.instance.collection('LichDat');
//     Widget LichDatData({int? flex, String? text, Widget? widget}) {
//       return Expanded(
//         flex: flex!,
//         child: Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: Color.fromARGB(255, 0, 0, 0))),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: widget == null ? Text(text!) : widget,
//           ),
//         ),
//       );
//     }

//     return StreamBuilder<QuerySnapshot>(
//       stream: dslichdatList.snapshots(),
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
//               DatLichData user = DatLichData.fromJson(
//                   snapshot.data!.docs[index].data() as Map<String, dynamic>);

//               return Row(
//                 children: [
//                   LichDatData(flex: 2, text: user.dichvu),
//                   LichDatData(flex: 4, text: user.diachi),
//                   LichDatData(flex: 3, text: user.email),
//                   LichDatData(flex: 2, text: user.ngaydat),
//                   LichDatData(flex: 2, text: user.sdt),
//                   LichDatData(flex: 2, text: user.nhanvien),
//                   LichDatData(flex: 3, text: user.xacnhan),
//                   LichDatData(
//                     flex: 3,
//                     text: user.hoanthanh,
//                   ),
//                   LichDatData(flex: 3, text: user.phanhoi),
//                   InkWell(
//                     child: Icon(
//                       Icons.edit,
//                       color: Color.fromARGB(255, 175, 0, 0).withOpacity(0.75),
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => CapNhat(datLichData: user)
//                               //           UploadLichdat(datLichData: user),
//                               ));
//                     },
//                   ),
//                 ],
//               );
//             });
//       },
//     );
//   }
// }
