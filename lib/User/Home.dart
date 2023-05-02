import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chothuenhancong/Controller/controller.dart';
import 'package:chothuenhancong/Map/picker_page.dart';
import 'package:chothuenhancong/User/DVDienLanh.dart';
import 'package:chothuenhancong/User/DVDienTu.dart';
import 'package:chothuenhancong/User/DVDoNuoc.dart';
import 'package:chothuenhancong/User/DVOngNuoc.dart';
import 'package:chothuenhancong/User/DVSuaDien.dart';
import 'package:chothuenhancong/User/DVSuaNha.dart';
import 'package:chothuenhancong/User/HoaDonKH.dart';
import 'package:chothuenhancong/User/LienHe.dart';
import 'package:chothuenhancong/User/Login.dart';
import 'package:chothuenhancong/User/Profile_User.dart';
import 'package:chothuenhancong/User/QuetQR.dart';
import 'package:chothuenhancong/User/TTCaNhanNguoiDung.dart';
import 'package:chothuenhancong/User/ThanhToanOnline.dart';
import 'package:chothuenhancong/User/ZaloPay.dart';
import 'package:chothuenhancong/User/lichsudat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:matcher/matcher.dart';
import 'package:path/path.dart' as Path;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;
  void add() {}
  final currentUser = FirebaseAuth.instance;

  PageController pageController = PageController();
  int pageCount = 3;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (!pageController.hasClients) {
        return;
      }
      if (pageController.page! >= pageCount - 1) {
        pageController.animateToPage(0,
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn);
      } else {
        pageController.nextPage(
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn);
      }
      // duration: Duration(milliseconds: 1000),
      // curve: Curves.fastLinearToSlowEaseIn);
      //  print("page ${pageController.page}");
      // double nextPage = pageController.page! + 1;
      // if (pageController.page! >= pageCount - 1) {
      //   pageController.animateToPage(0,
      //       duration: const Duration(milliseconds: 500),
      //       curve: Curves.fastLinearToSlowEaseIn);
      // } else {
      //   pageController.nextPage(
      //       duration: const Duration(milliseconds: 500),
      //       curve: Curves.fastLinearToSlowEaseIn);
      // }
    });
  }

  late String imageUrl;
  uploadImage(File image) async {
    String imageurl = '';
    String fileName = Path.basename(image.path);
    var reference = FirebaseStorage.instance.ref().child('users/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then((value) {
      imageurl = value;
      print("DownloadUrl: $value");
    });
    return imageurl;
  }

  @override
  Widget build(BuildContext context) {
    // final paymentController = Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 121, 11, 1),
        title: Text('KEA HOME'),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DSHoaDonKH(),
                        ));
                  },
                  icon: Icon(Icons.edit_calendar)),
              // Container(
              //   padding: EdgeInsets.all(4),
              //   decoration: BoxDecoration(
              //     color: Colors.red,
              //     shape: BoxShape.circle,
              //   ),
              //   child: Text('0'),
              // )
            ],
          ),
          // Stack(
          //   children: [
          //     IconButton(
          //         onPressed: () => paymentController.makePayment(
          //             amount: '10', currency: 'đ'),
          //         // Navigator.push(
          //         //     context,
          //         //     MaterialPageRoute(
          //         //       builder: (context) => ZaloPay(),
          //         //     ));

          //         icon: Icon(Icons.home)),
          //     // Container(
          //     //   padding: EdgeInsets.all(4),
          //     //   decoration: BoxDecoration(
          //     //     color: Colors.red,
          //     //     shape: BoxShape.circle,
          //     //   ),
          //     //   child: Text('0'),
          //     // )
          //   ],
          // ),
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuetMaQR(),
                        ));
                  },
                  icon: Icon(Icons.qr_code_2_outlined)),
              //   Container(
              //     padding: EdgeInsets.all(4),
              //     decoration: BoxDecoration(
              //       color: Colors.red,
              //       shape: BoxShape.circle,
              //     ),
              //     child: Text('0'),
              //   )
            ],
          ),
          // Stack(
          //   children: [
          //     IconButton(
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => SearchPlacesScreen(),
          //               ));
          //         },
          //         icon: Icon(Icons.map_outlined)),
          //     //   Container(
          //     //     padding: EdgeInsets.all(4),
          //     //     decoration: BoxDecoration(
          //     //       color: Colors.red,
          //     //       shape: BoxShape.circle,
          //     //     ),
          //     //     child: Text('0'),
          //     //   )
          //   ],
          // )
        ],
        //   actions: <Widget>[
        //     IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => DSHoaDonKH(),
        //               ));
        //         },
        //         icon: Icon(Icons.edit_calendar))
        //   ],
      ),
      // ignore: unnecessary_new
      drawer: new Drawer(
        child: ListView(
          children: [
            Visibility(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .where("uid", isEqualTo: currentUser.currentUser!.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          var data = snapshot.data!.docs[i];
                          imageUrl = data['image'];

                          return UserAccountsDrawerHeader(
                            accountName: Text(
                              "Xin Chào:  " + data['secondName'],
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            accountEmail: Text(
                              data['email'],
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            currentAccountPicture: new CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(146, 241, 241, 241),
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://stockdep.net/files/images/15676905.jpg'),
                                    fit: BoxFit.cover)),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text(
                "Lịch sử đặt",
                style: TextStyle(color: Colors.black),
              ),
              iconColor: Colors.black,
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Lichsudat()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              iconColor: Colors.black,
              title: const Text(
                "Thông tin cá nhân",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => TTCaNhan()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text(
                "Liên hệ",
                style: TextStyle(color: Colors.black),
              ),
              iconColor: Colors.black,
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Lienhe()));
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text(
                "Thanh Toán",
                style: TextStyle(color: Colors.black),
              ),
              iconColor: Colors.black,
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ThanhToanMomo()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              iconColor: Colors.black,
              title: const Text(
                "Đăng xuất",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
          child: ListView(
        children: [
          LimitedBox(
            maxHeight: 250,
            child: Stack(
              children: [
                PageView(
                  controller: pageController,
                  children: [
                    Slide(
                      sildeImage: 'hinh/anh-chu-tho-dien.jpg',
                    ),
                    Slide(sildeImage: 'hinh/anh2.jpg'),
                    Slide(sildeImage: 'hinh/anhmaygiathu.jpg')
                  ],
                ),
                Positioned(
                  bottom: 18.0,
                  left: 0.0,
                  right: 0.0,
                  child: Center(
                    child: SlideIndicator(
                      pageController: pageController,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            "Các dịch vụ",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 26, 25, 25)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  margin: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'hinh/anhsuadien.png',
                            height: 50,
                          ),
                          Text("Sửa Điện", style: new TextStyle(fontSize: 15))
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuaDien(),
                          ));
                    },
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  margin: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'hinh/anhdienlanh.png',
                            height: 50,
                          ),
                          Text("Điện lạnh", style: new TextStyle(fontSize: 15))
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DienLanh(),
                          ));
                    },
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  margin: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'hinh/anhdonuoc.png',
                            height: 50,
                          ),
                          Text("Dò Nước", style: new TextStyle(fontSize: 15))
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoNuoc(),
                          ));
                    },
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  margin: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'hinh/anhongnuoc.png',
                            height: 50,
                          ),
                          Text("Ống Nước", style: new TextStyle(fontSize: 15))
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OngNuoc(),
                          ));
                    },
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  margin: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'hinh/anhsuanha.png',
                            height: 50,
                          ),
                          Text("Sửa Nhà", style: new TextStyle(fontSize: 15))
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuaNha(),
                          ));
                    },
                  ),
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  margin: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'hinh/anhsuadientu.png',
                            height: 50,
                          ),
                          Text("Điện Tử", style: new TextStyle(fontSize: 15))
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DienTu(),
                          ));
                    },
                  ),
                ),

                // Menu(
                //   title: 'Sửa điện',
                //   icon: 'anhsuadien',
                // ),
                // Menu(
                //   title: 'Điện tử',
                //   icon: 'anhsuadientu',
                // ),
                // Menu(
                //   title: 'Điện lạnh',
                //   icon: 'anhdienlanh',
                // ),
                // Menu(
                //   title: 'Ống nước',
                //   icon: 'anhongnuoc',
                // ),
                // Menu(
                //   title: 'Sửa nhà',
                //   icon: 'anhsuanha',
                // ),
                // Menu(
                //   title: 'Dò nước',
                //   icon: 'anhdonuoc',
                // ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Dịch vụ phổ biến",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LimitedBox(
                maxHeight: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [TrendingCard(), TrendingCard1()],
                )),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Uri url = Uri(
            scheme: 'tel',
            path: "0916378900",
          );
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        },
        backgroundColor: Color.fromARGB(255, 8, 145, 44),
        child: Icon(Icons.phone),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login()));
  }
}

// class Menu extends StatelessWidget {
//   const Menu({
//     super.key,
//     required this.title,
//     required this.icon,
//   });

//   final String title;
//   final String icon;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: () {},
//         splashColor: Colors.green,
//         borderRadius: BorderRadius.circular(10),
//         child: MaterialButton(
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Image.asset(
//                   'hinh/$icon.png',
//                   height: 50,
//                 ),
//                 Text(title, style: new TextStyle(fontSize: 15))
//               ],
//             ),
//           ),
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SubPage(title),
//                 ));
//           },
//         ),
//       ),
//     );
//   }
// }

class Slide extends StatelessWidget {
  final String sildeImage;
  Slide({required this.sildeImage});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              sildeImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class TrendingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 200,
        width: 300,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('hinh/noibatmaygiat.png')),
      ),
    );
  }
}

class TrendingCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 200,
        width: 300,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('hinh/Noibatsuadien.png'),
        ),
      ),
    );
  }
}

class SlideIndicator extends AnimatedWidget {
  final PageController pageController;
  SlideIndicator({required this.pageController})
      : super(listenable: pageController);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3, buildIndicator),
    );
  }

  Widget buildIndicator(int index) {
    print("build $index");
    bool active = pageController.page?.round() == index;

    double select = max(
      0.0,
      1.0 - ((pageController.page ?? pageController.initialPage) - index).abs(),
    );
    double decrease = 10 * select;
    return Container(
      width: 30,
      child: Center(
        child: Container(
          width: 20 - decrease,
          height: 4,
          decoration: BoxDecoration(
              color: decrease == 10.0
                  ? Color.fromARGB(255, 243, 100, 33)
                  : Colors.black,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
