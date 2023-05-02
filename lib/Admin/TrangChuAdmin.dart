// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:chothuenhancong/Admin/DSKhachHang.dart';
// import 'package:chothuenhancong/Admin/LichDat.dart';
// import 'package:chothuenhancong/Admin/Sidebar.dart';
// import 'package:chothuenhancong/Admin/TTNhanVien.dart';
// import 'package:chothuenhancong/manhinh/Profile_User.dart';
// import 'package:chothuenhancong/manhinh/TTCaNhanNguoiDung.dart';
// import 'package:chothuenhancong/manhinh/lichsudat.dart';
// import 'package:chothuenhancong/manhinh/login.dart';
// import 'package:chothuenhancong/manhinh/subPage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter_admin_scaffold/admin_scaffold.dart';
// import 'package:matcher/matcher.dart';

// class AdminTrangChu extends StatelessWidget {
//   static const String id = 'trangchu';
//   SideBarWidget sideBar = SideBarWidget();

//   @override
//   Widget build(BuildContext context) {
//     return AdminScaffold(
//       backgroundColor: Color.fromARGB(199, 221, 109, 4),
//       appBar: AppBar(
//         title: const Text(
//           'Trang Chủ',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       sideBar: sideBar.sideBarMenus(context, AdminTrangChu.id),
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                 Color(0xFF8A2387),
//                 Color(0xFFE94057),
//                 Color(0xFFF27121),
//               ])),
//           alignment: Alignment.topLeft,
//           padding: const EdgeInsets.all(10),
//           child: const Text(
//             'Chào mừng bạn đến với trang người quản trị',
//             style: TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 36,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
