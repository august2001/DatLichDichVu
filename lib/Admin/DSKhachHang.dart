// import 'package:chothuenhancong/Admin/Sidebar.dart';
// import 'package:chothuenhancong/Admin/databaseStoreListKH.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_admin_scaffold/admin_scaffold.dart';
// import 'package:js/js.dart';

// class DSKhachHang extends StatelessWidget {
//   static const String id = 'dskhachhang';
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
//     //  Widget Image({int? flex, NetworkImage? image}) {
//     //   return Expanded(
//     //       flex: flex!,
//     //       child: Container(
//     //         decoration: BoxDecoration(
//     //             border: Border.all(color: Colors.grey.shade700),
//     //             color: Colors.grey.shade500),
//     //         child: Padding(
//     //           padding: EdgeInsets.all(8.0),
//     //           child: Image.network(

//     //             style: TextStyle(fontWeight: FontWeight.bold),
//     //           ),
//     //         ),
//     //       ));
//     // }

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
//       sideBar: sideBar.sideBarMenus(context, DSKhachHang.id),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'Danh sách khách hàng',
//                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
//                 ),
//               ),
//               Row(
//                 children: [
//                   rowHeader(flex: 1, text: 'Email'),
//                   rowHeader(flex: 1, text: 'Họ'),
//                   rowHeader(flex: 1, text: 'Tên'),
//                   rowHeader(flex: 1, text: 'Số điện thoại'),
//                   const Text(
//                     'Edit',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Color.fromARGB(255, 144, 3, 3),
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               DSKHList()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
