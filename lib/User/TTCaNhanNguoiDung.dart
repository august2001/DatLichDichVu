// import 'package:chothuenhancong/Controller/auth_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';

// class ProfileScreen extends GetView<SettingController> {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Thong tin ca nhan"),
//       ),
//       body: InkWell(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         focusColor: Colors.transparent,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(child: getProfile(context)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget getProfile(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.only(bottom: 16),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 130,
//                 height: 130,
//                 child: Stack(alignment: Alignment.center, children: [
//                   Container(
//                     width: 120,
//                     height: 120,
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).primaryColor,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Theme.of(context).dividerColor,
//                             blurRadius: 8,
//                             offset: Offset(4, 4),
//                           )
//                         ]),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(60),
//                       child: Hero(
//                         tag: "profileImage",
//                         child: Obx(() => controller.userModel.value.image == ""
//                             ? Image.asset(
//                                 "hinh/anhdienlanh.png",
//                                 fit: BoxFit.cover,
//                               )
//                             : Image.network(
//                                 controller.userModel.value.image!,
//                                 fit: BoxFit.cover,
//                               )),
//                       ),
//                     ),
//                   ),
//                 ]),
//               )
//             ]));
//   }
// }
