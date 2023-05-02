// import 'package:chothuenhancong/Admin/TTNguoiDung.dart';
// import 'package:chothuenhancong/model/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class DSKHList extends StatelessWidget {
//   const DSKHList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     late String imageUrl;
//     var dskhList = FirebaseFirestore.instance
//         .collection('users')
//         .where('role', isEqualTo: 'user');
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
//       stream: dskhList.snapshots(),
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
//               UserModel user = UserModel.fromJson(
//                   snapshot.data!.docs[index].data() as Map<String, dynamic>);
//               return Row(
//                 children: [
//                   KHData(flex: 1, text: user.email),
//                   KHData(flex: 1, text: user.firstName),
//                   KHData(flex: 1, text: user.secondName),
//                   KHData(flex: 1, text: user.phone),
//                   InkWell(
//                     child: Icon(
//                       Icons.edit,
//                       color: Color.fromARGB(255, 175, 0, 0).withOpacity(0.75),
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => TTNguoiDung(userModel: user)
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
