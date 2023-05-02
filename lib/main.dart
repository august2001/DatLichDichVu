import 'package:chothuenhancong/Admin/AddNhanVien.dart';
import 'package:chothuenhancong/Admin/DSHoaDon.dart';
import 'package:chothuenhancong/Admin/DSKhachHang.dart';
import 'package:chothuenhancong/Admin/LichDat.dart';
import 'package:chothuenhancong/Admin/LoginWeb.dart';
import 'package:chothuenhancong/Admin/TTNhanVien.dart';
import 'package:chothuenhancong/Admin/TrangChuAdmin.dart';
import 'package:chothuenhancong/User/Home.dart';
import 'package:chothuenhancong/User/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey =
  //     'pk_test_51MZameKsFBqI13OgHiaRAmf5zMtHqoFMZLzXDGqldZZVaX23AAyLfVHn2CtNSbezTK0RJ59F0wT3s3VTlUHBMKnK00PdhdcSJH';
  // await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyD1WmjssFR1wZ-fZiJge8tuK79kfCXum8k',
        appId: '1:432671462580:web:530c3ed4af973d2a8273e1',
        messagingSenderId: '',
        projectId: 'flutter-b42dd'),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đăng Nhập',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: LoginAdmin(),
      // routes: {
      //   AdminLichDat.id: (context) => AdminLichDat(),
      //   DSKhachHang.id: (context) => DSKhachHang(),
      //   TTNhanVien.id: (context) => TTNhanVien(),
      //   AddNhanVien.id: (context) => AddNhanVien(),
      //   DSHoaDonAdmin.id: ((context) => DSHoaDonAdmin())
      // },
      // debugShowCheckedModeBanner: false,
      // home: FirebaseAuth.instance.currentUser == null
      //     ? const LoginAdmin()
      //     : AdminTrangChu(),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? const Login() : Home(),
    );
  }
}
