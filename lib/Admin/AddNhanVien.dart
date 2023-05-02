// import 'package:chothuenhancong/Admin/Sidebar.dart';
// import 'package:chothuenhancong/Admin/TTNhanVien.dart';
// import 'package:chothuenhancong/Admin/TrangChuAdmin.dart';
// import 'package:chothuenhancong/User/Login.dart';
// import 'package:chothuenhancong/model/nhanvien.dart';
// import 'package:chothuenhancong/model/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter_admin_scaffold/admin_scaffold.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:matcher/matcher.dart';

// class AddNhanVien extends StatefulWidget {
//   const AddNhanVien({super.key});
//   static const String id = 'themnv';

//   @override
//   State<AddNhanVien> createState() => _AddNhanVienState();
// }

// class _AddNhanVienState extends State<AddNhanVien> {
//   final auth = FirebaseAuth.instance;

// // out form key
//   var key = GlobalKey<FormState>();
//   var firstNameEdittingController = TextEditingController();
//   var secondNameEdittingController = TextEditingController();
//   var emailEdittingController = TextEditingController();
//   var phoneEdittingController = TextEditingController();
//   var passwordEdittingController = TextEditingController();
//   var confirmPasswordEdittingController = TextEditingController();
//   var ngaysinhdEdittingController = TextEditingController();
//   var congviecEdittingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     SideBarWidget sideBar = SideBarWidget();

//     //first Name
//     final firstNameField = Container(
//       width: 500,
//       child: TextFormField(
//         autofocus: false,
//         controller: firstNameEdittingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           RegExp regex = new RegExp(r'^.{3,}$');
//           if (value!.isEmpty) {
//             return ("Bạn chưa nhập Họ");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Nhập tên hợp lệ(Ít nhất 3 ký tự)");
//           }
//           return null;
//         },
//         // xác thực
//         onSaved: (value) {
//           firstNameEdittingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//             prefixIcon: const Icon(Icons.account_circle),
//             contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             hintText: "Họ",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );
//     //Second Name
//     final SecondNameField = Container(
//       width: 500,
//       child: TextFormField(
//         autofocus: false,
//         controller: secondNameEdittingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Bạn chưa nhập tên");
//           }
//           return null;
//         },

//         // xác thực
//         onSaved: (value) {
//           secondNameEdittingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//             prefixIcon: const Icon(Icons.account_circle),
//             contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             hintText: "Tên",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );
//     //Email
//     final EmailField = Container(
//       width: 500,
//       child: TextFormField(
//         autofocus: false,
//         controller: emailEdittingController,
//         keyboardType: TextInputType.emailAddress,
//         validator: (value) {
//           //xac thuc
//           if (value!.isEmpty) {
//             return ("Vui lòng nhập Email");
//           }
//           //biểu thực reg để xác thực emaili+
//           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//               .hasMatch(value)) {
//             return ("Vui lòng nhập Email hợp lệ");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           emailEdittingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//             prefixIcon: const Icon(Icons.mail),
//             contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             hintText: "Địa chỉ Email",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );

//     final SDTField = Container(
//       width: 500,
//       child: TextFormField(
//         autofocus: false,
//         controller: phoneEdittingController,
//         keyboardType: TextInputType.number,
//         validator: (value) {
//           String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

//           RegExp regex = new RegExp(patttern);

//           //xac thuc
//           if (value!.isEmpty) {
//             return ("Vui lòng nhập số điện thoại");
//           } else if (!regex.hasMatch(value)) {
//             return ("Vui lòng nhập đúng số điện thoại");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           phoneEdittingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//             prefixIcon: const Icon(Icons.phone),
//             contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             hintText: "Số điện thoại",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );
//     //Password
//     final PasswordField = Container(
//       width: 500,
//       child: TextFormField(
//         autofocus: false,
//         controller: passwordEdittingController,
//         obscureText: true,
//         // xác thực
//         validator: (value) {
//           RegExp regex = new RegExp(r'^.{6,}$');
//           if (value!.isEmpty) {
//             return ("Mật khẩu không được để trống ");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Nhập tên hợp lệ(Ít nhất 6 ký tự)");
//           }
//         },
//         onSaved: (value) {
//           passwordEdittingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//             prefixIcon: const Icon(Icons.vpn_key),
//             contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             hintText: "Mật khẩu",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );
//     //Confirm
//     final ngaysinh = Container(
//       width: 500,
//       child: TextFormField(
//         autofocus: false,
//         controller: ngaysinhdEdittingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Bạn chưa nhập ngày sinh");
//           }
//           return null;
//         },

//         // xác thực
//         onSaved: (value) {
//           ngaysinhdEdittingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//             prefixIcon: const Icon(Icons.date_range),
//             contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             hintText: "Ngày sinh",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );
//     final congviec = Container(
//       width: 500,
//       child: TextFormField(
//         autofocus: false,
//         controller: congviecEdittingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Bạn chưa nhập công việc");
//           }
//           return null;
//         },

//         // xác thực
//         onSaved: (value) {
//           congviecEdittingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//             prefixIcon: const Icon(Icons.join_full),
//             contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//             hintText: "Công việc",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );

//     // RegistrationButton
//     final SignupButon = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: Colors.redAccent,
//       child: ElevatedButton(
//         onPressed: () {
//           signUp(emailEdittingController.text, passwordEdittingController.text);
//         },
//         child: const Text(
//           "Đăng ký",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//     return AdminScaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.black87,
//         title: const Text(
//           'ĐĂNG KÝ NHÂN VIÊN',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       sideBar: sideBar.sideBarMenus(context, AddNhanVien.id),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Form(
//               key: key,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text('ĐĂNG KÝ',
//                       style: TextStyle(
//                           fontSize: 30,
//                           color: Color.fromARGB(255, 255, 0, 0),
//                           fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 20),
//                   firstNameField,
//                   const SizedBox(height: 20),
//                   SecondNameField,
//                   const SizedBox(height: 20),
//                   EmailField,
//                   const SizedBox(height: 20),
//                   SDTField,
//                   const SizedBox(height: 20),
//                   PasswordField,
//                   const SizedBox(height: 20),
//                   ngaysinh,
//                   const SizedBox(height: 20),
//                   congviec,
//                   const SizedBox(height: 20),
//                   SignupButon,
//                   const SizedBox(height: 15),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void signUp(String email, String password) async {
//     if (key.currentState!.validate()) {
//       await auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) => {postDetailsToFirestore()})
//           .catchError((e) {
//         Fluttertoast.showToast(msg: e!.message);
//       });
//     }
//   }

//   postDetailsToFirestore() async {
//     // goi firestore
//     // goi nguoi dung
//     //seding các giá trị này

//     //
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? users = auth.currentUser;

//     NhanVienModel nhanVienModel = NhanVienModel();
//     //
//     nhanVienModel.email = users!.email;
//     nhanVienModel.uid = users.uid;
//     nhanVienModel.firstName = firstNameEdittingController.text;
//     nhanVienModel.phone = phoneEdittingController.text;
//     nhanVienModel.secondName = secondNameEdittingController.text;
//     nhanVienModel.password = passwordEdittingController.text;
//     nhanVienModel.ngaysinh = ngaysinhdEdittingController.text;
//     nhanVienModel.congviec = congviecEdittingController.text;
//     nhanVienModel.image = " ";
//     nhanVienModel.role = "nhanvien";

//     await firebaseFirestore
//         .collection("users")
//         .doc(users.uid)
//         .set(nhanVienModel.toMap());
//     Fluttertoast.showToast(msg: "Tài khoản được tạo thành công");

//     Navigator.pushAndRemoveUntil(
//         (context),
//         MaterialPageRoute(builder: (context) => AdminTrangChu()),
//         (route) => false);
//   }
// }
