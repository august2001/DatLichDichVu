// // import 'package:chothuenhancong/Admin/TrangChuAdmin.dart';
// import 'package:chothuenhancong/Admin/TrangChuAdmin.dart';
// import 'package:chothuenhancong/Staff/TrangChu.dart';
// import 'package:chothuenhancong/User/Home.dart';
// import 'package:chothuenhancong/User/Registration.dart';
// // import 'package:chothuenhancong/manhinh/registration.dart';
// import 'package:chothuenhancong/model/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class LoginAdmin extends StatefulWidget {
//   const LoginAdmin({super.key});

//   @override
//   State<LoginAdmin> createState() => _LoginAdminState();
// }

// class _LoginAdminState extends State<LoginAdmin> {
//   // key
//   final _formKey = GlobalKey<FormState>();
//   // edit controler
//   final TextEditingController emailcontroler = new TextEditingController();
//   final TextEditingController passwordcontroler = new TextEditingController();

//   // Future sigin() async{
//   //   await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
//   // }

//   final _auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     //email field
//     final emailField = TextFormField(
//       autofocus: false,
//       controller: emailcontroler,
//       keyboardType: TextInputType.emailAddress,
//       validator: (value) {
//         RegExp regExp = new RegExp(r'^,{6,}$');
//         if (value!.isEmpty) {
//           return ("Vui lòng nhập Email");
//         }
//         //biểu thực reg để xác thực emaili+
//         if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
//           return ("Vui lòng nhập Email hợp lệ");
//         }
//       },
//       // xác thực
//       onSaved: (value) {
//         emailcontroler.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: const Icon(Icons.mail),
//         contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//         // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Email",
//         // border: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(10),
//         // )
//       ),
//     );

//     //password field
//     final passwordField = TextFormField(
//       autofocus: false,
//       controller: passwordcontroler,
//       obscureText: true, //mat khau an
//       validator: (value) {
//         RegExp regex = new RegExp(r'^.{6,}$');
//         if (value!.isEmpty) {
//           return ('Mật khẩu không được để trông');
//         }
//         if (!regex.hasMatch(value)) {
//           return ("Nhập mật khẩu hợp lệ(Ít nhất 6 ký tự)");
//         }
//         return null;
//         // if (!regExp.hasMatch(value)) {
//         //   return ("Vui lòng nhập mật khẩu hợp lệ(tối thiểu 6 ký tự)");
//         // }
//       },
//       // xác thực
//       onSaved: (value) {
//         passwordcontroler.text = value!;
//       },
//       textInputAction: TextInputAction.done,
//       decoration: const InputDecoration(
//         prefixIcon: Icon(Icons.vpn_key),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Password",
//         // suffixIcon: Icon(
//         //   FontAwesomeIcons.eyeSlash,
//         //   size: 17,
//         // )
//         // border: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(10),
//         // )
//       ),
//     );

//     final loginButon = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: Color.fromARGB(255, 11, 126, 36),
//       child: MaterialButton(
//         padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         minWidth: MediaQuery.of(context).size.width,
//         onPressed: () {
//           signIn(emailcontroler.text, passwordcontroler.text);
//         },
//         // onPressed: () {
//         //   signIn(emailcontroler.text, passwordcontroler.text);
//         // },
//         child: const Text(
//           "Login",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );

//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                   Color(0xFF8A2387),
//                   Color(0xFFE94057),
//                   Color(0xFFF27121),
//                 ])),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 30),
//                   SizedBox(
//                     height: 100,
//                     child: Image.asset(
//                       "hinh/key.png",
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   const Text(
//                     'ĐĂNG NHẬP',
//                     style: TextStyle(
//                         fontSize: 30,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 35,
//                   ),
//                   Container(
//                     height: 480,
//                     width: 325,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(height: 80),
//                         Container(width: 250, child: emailField),
//                         const SizedBox(height: 20),
//                         Container(width: 250, child: passwordField),
//                         const SizedBox(height: 70),
//                         Container(width: 250, child: loginButon),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             // child: Padding(
//             //   padding: const EdgeInsets.all(40.0),
//             //   child: Form(
//             //     key: _formKey,
//             //     child: Column(
//             //       mainAxisAlignment: MainAxisAlignment.center,
//             //       crossAxisAlignment: CrossAxisAlignment.center,
//             //       children: <Widget>[
//             //         SizedBox(
//             //             height: 200,
//             //             child: Image.asset(
//             //               "hinh/key.png",
//             //               fit: BoxFit.contain,
//             //             )),

//             //         // Container(
//             //         //   height: 480,
//             //         //   width: 325,
//             //         //   decoration: BoxDecoration(color: Colors.white),
//             //         // ),
//             //         const SizedBox(height: 45),
//             //         emailField,
//             //         const SizedBox(height: 20),
//             //         passwordField,
//             //         const SizedBox(height: 20),
//             //         loginButon,
//             //         const SizedBox(height: 15),
//             //         // Row(
//             //         //   mainAxisAlignment: MainAxisAlignment.center,
//             //         //   children: <Widget>[
//             //         //     const Text("Bạn chưa có tài khoản? "),
//             //         //     GestureDetector(
//             //         //       onTap: () {
//             //         //         Navigator.push(
//             //         //             context,
//             //         //             MaterialPageRoute(
//             //         //                 builder: (context) =>
//             //         //                     const Registration()));
//             //         //       },
//             //         //       child: const Text(
//             //         //         "Đăng ký",
//             //         //         style: TextStyle(
//             //         //             color: Colors.redAccent,
//             //         //             fontWeight: FontWeight.w600,
//             //         //             fontSize: 15),
//             //         //       ),
//             //         //     )
//             //         //   ],
//             //         // )
//             //       ],
//             //     ),
//             //   ),
//             // ),
//           ),
//         ),
//       ),
//     );
//   }

//   // void _SignIn(String email, String password)async{
//   //   try{
//   //     final newUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
//   //     if(newUser != null){
//   //       final FirebaseU
//   //     }
//   //   }
//   // }
//   //ham login
//   void route() {
//     User? user = FirebaseAuth.instance.currentUser;
//     var kk = FirebaseFirestore.instance
//         .collection('users')
//         .doc(user!.uid)
//         .get()
//         .then((uid) {
//       if (uid.exists) {
//         // if (uid.get('role') == 'user') {
//         //   Fluttertoast.showToast(msg: "Đăng nhập thành công");
//         //   Navigator.of(context)
//         //       .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
//         //} else
//         if (uid.get('role') == 'admin') {
//           Fluttertoast.showToast(msg: "Đăng nhập thành công");
//           Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (context) => AdminTrangChu()));
//         }
//         // else {
//         //   Fluttertoast.showToast(msg: "Đăng nhập thành công");
//         //   Navigator.of(context).pushReplacement(
//         //       MaterialPageRoute(builder: (context) => HomeNhanVien()));
//         // }
//       } else {
//         print("Không có dữ liệu");
//       }
//     });
//   }

//   void signIn(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       // UserCredential userModel = await _auth.signInWithEmailAndPassword(
//       //     email: email, password: password);
//       // route();

//       await _auth
//           .signInWithEmailAndPassword(email: email, password: password)
//           .then((uid) => {
//                 route()
//                 // Fluttertoast.showToast(msg: "Đăng nhập thành công"),
//                 // Navigator.of(context).pushReplacement(
//                 //     MaterialPageRoute(builder: (context) => Home())),
//               })
//           .catchError((e) {
//         Fluttertoast.showToast(msg: e!.message);
//       });
//     }
//   }
// }
