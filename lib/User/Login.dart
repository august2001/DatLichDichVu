// import 'package:chothuenhancong/Admin/TrangChuAdmin.dart';
import 'package:chothuenhancong/Admin/TrangChuAdmin.dart';
import 'package:chothuenhancong/Staff/TrangChu.dart';
import 'package:chothuenhancong/User/Home.dart';
import 'package:chothuenhancong/User/Registration.dart';
// import 'package:chothuenhancong/manhinh/registration.dart';
import 'package:chothuenhancong/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // key
  final _formKey = GlobalKey<FormState>();
  // edit controler
  final TextEditingController emailcontroler = new TextEditingController();
  final TextEditingController passwordcontroler = new TextEditingController();

  // Future sigin() async{
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
  // }

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroler,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regExp = new RegExp(r'^,{6,}$');
        if (value!.isEmpty) {
          return ("Vui lòng nhập Email");
        }
        //biểu thực reg để xác thực emaili+
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Vui lòng nhập Email hợp lệ");
        }
      },
      // xác thực
      onSaved: (value) {
        emailcontroler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordcontroler,
      obscureText: true, //mat khau an
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ('Mật khẩu không được để trông');
        }
        if (!regex.hasMatch(value)) {
          return ("Nhập mật khẩu hợp lệ(Ít nhất 6 ký tự)");
        }
        return null;
        // if (!regExp.hasMatch(value)) {
        //   return ("Vui lòng nhập mật khẩu hợp lệ(tối thiểu 6 ký tự)");
        // }
      },
      // xác thực
      onSaved: (value) {
        passwordcontroler.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final loginButon = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 24, 116, 27),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(emailcontroler.text, passwordcontroler.text);
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color(0xFF8A2387),
                  Color(0xFFE94057),
                  Color(0xFFF27121),
                ])),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70),
                  SizedBox(
                    height: 90,
                    child: Image.asset(
                      "hinh/key.png",
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    height: 400,
                    width: 325,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        const Text(
                          "ĐĂNG NHẬP",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        SizedBox(height: 30),
                        Container(width: 250, child: emailField),
                        const SizedBox(height: 20),
                        Container(width: 250, child: passwordField),
                        const SizedBox(height: 30),
                        Container(width: 200, child: loginButon),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Bạn chưa có tài khoản? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Registration()));
                              },
                              child: const Text(
                                "Đăng ký",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //ham login
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((uid) {
      if (uid.exists) {
        if (uid.get('role') == 'user') {
          Fluttertoast.showToast(msg: "Đăng nhập thành công");
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
          // } else if (uid.get('role') == 'admin') {
          //   Fluttertoast.showToast(msg: "Đăng nhập thành công");
          //   Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(builder: (context) => AdminTrangChu()));
        } else {
          Fluttertoast.showToast(msg: "Đăng nhập thành công");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeNhanVien()));
        }
      } else {
        print("Không có dữ liệu");
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      // UserCredential userModel = await _auth.signInWithEmailAndPassword(
      //     email: email, password: password);
      // route();

      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                route()
                // Fluttertoast.showToast(msg: "Đăng nhập thành công"),
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => Home())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
