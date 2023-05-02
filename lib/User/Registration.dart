import 'package:chothuenhancong/User/Login.dart';
import 'package:chothuenhancong/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matcher/matcher.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final auth = FirebaseAuth.instance;
// out form key
  var key = GlobalKey<FormState>();
  var firstNameEdittingController = TextEditingController();
  var secondNameEdittingController = TextEditingController();
  var emailEdittingController = TextEditingController();
  var phoneEdittingController = TextEditingController();
  var passwordEdittingController = TextEditingController();
  var confirmPasswordEdittingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first Name
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEdittingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name không được để trống ");
        }
        if (!regex.hasMatch(value)) {
          return ("Nhập tên hợp lệ(Ít nhất 3 ký tự)");
        }
        return null;
      },
      // xác thực
      onSaved: (value) {
        firstNameEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Họ",
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        // )
      ),
    );
    //Second Name
    final SecondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEdittingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second Name không được để trống ");
        }
        return null;
      },

      // xác thực
      onSaved: (value) {
        secondNameEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Tên",
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        // )
      ),
    );
    //Email
    final EmailField = TextFormField(
      autofocus: false,
      controller: emailEdittingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        //xac thuc
        if (value!.isEmpty) {
          return ("Vui lòng nhập Email");
        }
        //biểu thực reg để xác thực emaili+
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Vui lòng nhập Email hợp lệ");
        }
        return null;
      },
      onSaved: (value) {
        emailEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        // )
      ),
    );

    final SDTField = TextFormField(
      autofocus: false,
      controller: phoneEdittingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

        RegExp regex = new RegExp(patttern);

        //xac thuc

        //xac thuc
        if (value!.isEmpty) {
          return ("Vui lòng nhập SDT");
        } else if (!regex.hasMatch(value)) {
          return ("Vui lòng nhập đúng số điện thoại");
        }
        return null;
      },
      onSaved: (value) {
        phoneEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.phone),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Điện thoại",
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        // )
      ),
    );
    //Password
    final PasswordField = TextFormField(
      autofocus: false,
      controller: passwordEdittingController,
      obscureText: true,
      // xác thực
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Mật khẩu không được để trống ");
        }
        if (!regex.hasMatch(value)) {
          return ("Nhập tên hợp lệ(Ít nhất 6 ký tự)");
        }
      },
      onSaved: (value) {
        passwordEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Mật khẩu",
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        // )
      ),
    );
    //Confirm
    final ConfirmPassField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEdittingController,
      obscureText: true,
      // xác thực
      validator: (value) {
        if (confirmPasswordEdittingController.text !=
            passwordEdittingController.text) {
          return "Mật khẩu không khớp";
        }
        if (confirmPasswordEdittingController.text.length > 6 &&
            passwordEdittingController.text != value) {
          return "Mật khẩu không đúng định dạng";
        }
        return null;
      },
      onSaved: (value) {
        firstNameEdittingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nhập lại mật khẩu",
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        // )
      ),
    );
    final SignupButon = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 24, 116, 27),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEdittingController.text, passwordEdittingController.text);
        },
        child: const Text(
          "Đăng ký",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    // RegistrationButton
    // final SignupButon = Material(
    //   elevation: 5,
    //   borderRadius: BorderRadius.circular(30),
    //   color: Colors.redAccent,
    //   child: ElevatedButton(
    //     onPressed: () {
    //       signUp(emailEdittingController.text, passwordEdittingController.text);
    //     },
    //     child: const Text(
    //       "Signup",
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ĐĂNG KÝ',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    const SizedBox(height: 20),
                    firstNameField,
                    const SizedBox(height: 20),
                    SecondNameField,
                    const SizedBox(height: 20),
                    EmailField,
                    const SizedBox(height: 20),
                    SDTField,
                    const SizedBox(height: 20),
                    PasswordField,
                    const SizedBox(height: 20),
                    ConfirmPassField,
                    const SizedBox(height: 25),
                    Container(width: 250, child: SignupButon),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (key.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // goi firestore
    // goi nguoi dung
    //seding các giá trị này

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();
    //
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEdittingController.text;
    userModel.phone = phoneEdittingController.text;
    userModel.secondName = secondNameEdittingController.text;
    userModel.password = passwordEdittingController.text;
    userModel.image = " ";
    userModel.role = "user";

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Tài khoản được tạo thành công");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }
}
