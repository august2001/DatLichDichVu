// import 'package:chothuenhancong/Admin/AddNhanVien.dart';
// import 'package:chothuenhancong/Admin/DSHoaDon.dart';
// import 'package:chothuenhancong/Admin/DSKhachHang.dart';
// import 'package:chothuenhancong/Admin/LichDat.dart';
// import 'package:chothuenhancong/Admin/LoginWeb.dart';
// import 'package:chothuenhancong/Admin/TTNhanVien.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_admin_scaffold/admin_scaffold.dart';

// class SideBarWidget {
//   sideBarMenus(context, selectedRoute) {
//     return SideBar(
//       activeBackgroundColor: Color.fromARGB(133, 16, 4, 109),
//       activeIconColor: Color.fromARGB(255, 71, 71, 71),
//       activeTextStyle: TextStyle(color: Color.fromARGB(255, 251, 251, 251)),
//       items: const [
//         AdminMenuItem(
//           title: 'Lịch Đặt',
//           route: AdminLichDat.id,
//           icon: Icons.book,
//         ),
//         AdminMenuItem(
//           title: 'Danh sách nhân viên',
//           route: TTNhanVien.id,
//           icon: Icons.group_outlined,
//         ),
//         AdminMenuItem(
//           title: 'Danh sách khách hàng',
//           route: DSKhachHang.id,
//           icon: Icons.group_outlined,
//         ),
//         AdminMenuItem(
//           title: 'Tạo nhân viên',
//           route: AddNhanVien.id,
//           icon: Icons.person_add,
//         ),
//         AdminMenuItem(
//           title: 'Danh sách hóa đơn',
//           route: DSHoaDonAdmin.id,
//           icon: Icons.calendar_month_outlined,
//         ),
//         AdminMenuItem(
//           title: 'Đăng xuất',
//           route: '/',
//           icon: Icons.logout,
//         ),
//       ],
//       selectedRoute: selectedRoute,
//       onSelected: (item) {
//         if (item.route != null) {
//           Navigator.of(context).pushNamed(item.route!);
//         }
//       },
//       // header: Container(
//       //   height: 50,
//       //   width: double.infinity,
//       //   color: Color.fromARGB(255, 255, 128, 9),
//       //   // child: const Center(
//       //   //   child: Text(
//       //   //     'XIN CHÀO',
//       //   //     style: TextStyle(
//       //   //       color: Color.fromARGB(255, 5, 87, 39),
//       //   //     ),
//       //   //   ),
//       //   // ),
//       // ),
//       // footer: Container(
//       //   height: 50,
//       //   width: double.infinity,
//       //   color: const Color(0xff444444),
//       //   child: const Center(
//       //     child: Text(
//       //       'Kea Home',
//       //       style: TextStyle(
//       //           color: Color.fromARGB(255, 197, 14, 14), fontSize: 30),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
