// // import 'package:chothuenhancong/Admin/databaseStoreListLichDat.dart';
// // import 'package:chothuenhancong/Admin/Sidebar.dart';
// import 'package:chothuenhancong/Admin/Sidebar.dart';
// import 'package:chothuenhancong/Admin/databaseStoreListLichDat.dart';
// // import 'package:chothuenhancong/Admin/sidebar.dart';
// import 'package:chothuenhancong/Admin/uploadLichdat.dart';
// import 'package:chothuenhancong/model/dat_lich.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_admin_scaffold/admin_scaffold.dart';

// class AdminLichDat extends StatelessWidget {
//   final CollectionReference reference =
//       FirebaseFirestore.instance.collection("LichDat");

//   static const String id = 'lichdat';
//   SideBarWidget sideBar = SideBarWidget();

//   @override
//   Widget build(BuildContext context) {
//     Widget rowHeader({int? flex, String? text}) {
//       return Expanded(
//           flex: flex!,
//           child: Container(
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.shade700),
//                 color: Colors.grey.shade500),
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 text!,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ));
//     }

//     // TODO: implement build
//     return AdminScaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       appBar: AppBar(
//         backgroundColor: Colors.black87,
//         title: const Text(
//           'Trang Chủ',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       sideBar: sideBar.sideBarMenus(context, AdminLichDat.id),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'Danh sách Lịch Đặt',
//                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
//                 ),
//               ),
//               Row(
//                 children: [
//                   rowHeader(flex: 2, text: 'Dịch vụ'),
//                   rowHeader(flex: 4, text: 'Địa chỉ'),
//                   rowHeader(flex: 3, text: 'Email'),
//                   rowHeader(flex: 2, text: 'Ngày Đặt'),
//                   rowHeader(flex: 2, text: 'Điện thoại'),
//                   rowHeader(flex: 2, text: 'Nhân viên'),
//                   rowHeader(flex: 3, text: 'Xác nhận'),
//                   rowHeader(flex: 3, text: 'Hoàn thành'),
//                   rowHeader(flex: 3, text: 'Phản hồi'),
//                   const Text(
//                     'Edit',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Color.fromARGB(255, 144, 3, 3),
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                   ),
//                 ],
//               ),
//               DSLichDatList()
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget getBody(datlichs) {
//   //   return ListView.builder(
//   //     itemCount: datlichs.length,
//   //     itemBuilder: (context, index) => Card(
//   //       child: ListTile(
//   //         title: Text(datlichs[index].dichvu),
//   //         subtitle: Text('Ngày ${datlichs[index].ngaydat};'),
//   //         trailing: SizedBox(
//   //           width: 60,
//   //           child: Row(
//   //             children: [
//   //               InkWell(
//   //                 child: Icon(
//   //                   Icons.edit,
//   //                   color: Color.fromARGB(255, 188, 0, 0).withOpacity(0.75),
//   //                 ),
//   //                 onTap: () {
//   //                   Navigator.push(
//   //                       context,
//   //                       MaterialPageRoute(
//   //                         builder: (context) =>
//   //                             UploadLichdat(datLichData: datlichs[index]),
//   //                       ));
//   //                 },
//   //               ),
//   //               InkWell(
//   //                 child: Icon(Icons.delete,
//   //                     color: Color.fromARGB(255, 165, 3, 3).withOpacity(0.75)),
//   //                 onTap: () {},
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
// }
