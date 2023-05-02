// import 'dart:async';
// import 'dart:io';
// import 'dart:math';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:chothuenhancong/User/DVDienLanh.dart';
// import 'package:chothuenhancong/User/DVDienTu.dart';
// import 'package:chothuenhancong/User/DVDoNuoc.dart';
// import 'package:chothuenhancong/User/DVOngNuoc.dart';
// import 'package:chothuenhancong/User/DVSuaDien.dart';
// import 'package:chothuenhancong/User/DVSuaNha.dart';
// import 'package:chothuenhancong/User/LienHe.dart';
// import 'package:chothuenhancong/User/Login.dart';
// import 'package:chothuenhancong/User/Profile_User.dart';
// import 'package:chothuenhancong/User/TTCaNhanNguoiDung.dart';
// import 'package:chothuenhancong/User/lichsudat.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:matcher/matcher.dart';
// import 'package:path/path.dart' as Path;

// class HomeNhanVien extends StatefulWidget {
//   const HomeNhanVien({super.key});

//   @override
//   State<HomeNhanVien> createState() => _HomeNhanVienState();
// }

// class _HomeNhanVienState extends State<HomeNhanVien> {
//   final currentUser = FirebaseAuth.instance;

//   PageController pageController = PageController();
//   int pageCount = 3;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   late String imageUrl;
//   uploadImage(File image) async {
//     String imageurl = '';
//     String fileName = Path.basename(image.path);
//     var reference = FirebaseStorage.instance.ref().child('users/$fileName');
//     UploadTask uploadTask = reference.putFile(image);
//     TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
//     await taskSnapshot.ref.getDownloadURL().then((value) {
//       imageurl = value;
//       print("DownloadUrl: $value");
//     });
//     return imageurl;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Trang chu"),

//         // leading: IconButton(
//         //   icon: const Icon(Icons.arrow_back, color: Colors.red),
//         //   onPressed: () {
//         //     Navigator.of(context).pop();
//         //   },
//         // ),
//       ),
//       // ignore: unnecessary_new

//       body: Container(
//           child: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GridView.count(
//               crossAxisCount: 3,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               children: [
//                 Card(
//                   shape: new RoundedRectangleBorder(
//                       borderRadius: new BorderRadius.circular(30)),
//                   margin: const EdgeInsets.all(8.0),
//                   child: MaterialButton(
//                     child: Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Image.asset(
//                             'hinh/anhsuadien.png',
//                             height: 50,
//                           ),
//                           Text("Sửa Điện", style: new TextStyle(fontSize: 15))
//                         ],
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SuaDien(),
//                           ));
//                     },
//                   ),
//                 ),
//                 Card(
//                   shape: new RoundedRectangleBorder(
//                       borderRadius: new BorderRadius.circular(30)),
//                   margin: const EdgeInsets.all(8.0),
//                   child: MaterialButton(
//                     child: Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Image.asset(
//                             'hinh/anhdienlanh.png',
//                             height: 50,
//                           ),
//                           Text("Điện lạnh", style: new TextStyle(fontSize: 15))
//                         ],
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DienLanh(),
//                           ));
//                     },
//                   ),
//                 ),
//                 Card(
//                   shape: new RoundedRectangleBorder(
//                       borderRadius: new BorderRadius.circular(30)),
//                   margin: const EdgeInsets.all(8.0),
//                   child: MaterialButton(
//                     child: Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Image.asset(
//                             'hinh/anhdonuoc.png',
//                             height: 50,
//                           ),
//                           Text("Dò Nước", style: new TextStyle(fontSize: 15))
//                         ],
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DoNuoc(),
//                           ));
//                     },
//                   ),
//                 ),
//                 Card(
//                   shape: new RoundedRectangleBorder(
//                       borderRadius: new BorderRadius.circular(30)),
//                   margin: const EdgeInsets.all(8.0),
//                   child: MaterialButton(
//                     child: Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Image.asset(
//                             'hinh/anhongnuoc.png',
//                             height: 50,
//                           ),
//                           Text("Ống Nước", style: new TextStyle(fontSize: 15))
//                         ],
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => OngNuoc(),
//                           ));
//                     },
//                   ),
//                 ),
//                 Card(
//                   shape: new RoundedRectangleBorder(
//                       borderRadius: new BorderRadius.circular(30)),
//                   margin: const EdgeInsets.all(8.0),
//                   child: MaterialButton(
//                     child: Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Image.asset(
//                             'hinh/anhsuanha.png',
//                             height: 50,
//                           ),
//                           Text("Sửa Nhà", style: new TextStyle(fontSize: 15))
//                         ],
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SuaNha(),
//                           ));
//                     },
//                   ),
//                 ),
//                 Card(
//                   shape: new RoundedRectangleBorder(
//                       borderRadius: new BorderRadius.circular(30)),
//                   margin: const EdgeInsets.all(8.0),
//                   child: MaterialButton(
//                     child: Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Image.asset(
//                             'hinh/anhsuadientu.png',
//                             height: 50,
//                           ),
//                           Text("Điện Tử", style: new TextStyle(fontSize: 15))
//                         ],
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DienTu(),
//                           ));
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       )),
//     );
//   }

//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const Login()));
//   }
// }
import 'package:chothuenhancong/Staff/DSHoaDon.dart';
import 'package:chothuenhancong/Staff/LichDat.dart';
import 'package:chothuenhancong/Staff/TaiKhoan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeNhanVien extends StatefulWidget {
  const HomeNhanVien({super.key});

  @override
  State<HomeNhanVien> createState() => _HomeNhanVienState();
}

class _HomeNhanVienState extends State<HomeNhanVien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 134, 185, 227),
      // appBar: AppBar(
      //   title: Text("Trang chủ"),
      //   centerTitle: true,
      // ),
      body: Container(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    margin: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              'hinh/accout.png',
                              height: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Tài khoản",
                                style: new TextStyle(fontSize: 15))
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TTCaNhanNV(),
                            ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    margin: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              'hinh/calendar.png',
                              height: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Lịch đặt", style: new TextStyle(fontSize: 15))
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LichDatNV(),
                            ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    margin: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              'hinh/bill.png',
                              height: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Hóa Đơn", style: new TextStyle(fontSize: 15))
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DSHoaDonNV(),
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
