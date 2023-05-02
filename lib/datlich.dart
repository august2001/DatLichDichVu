import 'dart:io';

import 'package:chothuenhancong/User/Home.dart';

import 'package:chothuenhancong/model/Dat_lich.dart';
import 'package:chothuenhancong/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:matcher/matcher.dart';
import 'package:path/path.dart' as Path;

class DatLich extends StatefulWidget {
  const DatLich({super.key});

  @override
  State<DatLich> createState() => _DatLichState();
}

class _DatLichState extends State<DatLich> {
  XFile? file;
  late String imageUrl = "";
  String defaultImageUrl =
      'https://vuongquocanh.com/wp-content/uploads/2018/05/london-eye-800x534.jpg ';
  late String url = "";
  final ImagePicker picker = ImagePicker();
  File? selecterImage;
  FirebaseFirestore? userStore;

  // late String imageUrl;
  getImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selecterImage = File(image.path);
      Fluttertoast.showToast(msg: "Cập nhật thông tin thành công");

      setState(() {});
    }
  }

  CollectionReference datlich =
      FirebaseFirestore.instance.collection('LichDat');
  final auth = FirebaseAuth.instance;

  ///
  final TenDichVuEdittingController = new TextEditingController();
  final PhoneEdittingController = new TextEditingController();
  final DiaChiEdittingController = new TextEditingController();
  final EmailEdittingController = new TextEditingController();
  final TextEditingController NgaydatEdittingController =
      TextEditingController();
  final NhanvienEdittingController = new TextEditingController();
  final XacnhanEdittingController = new TextEditingController();
  final HoanthanhEdittingController = new TextEditingController();

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final defStore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance;

  void showpicker(BuildContext context) {
    showModalBottomSheet(
        //  backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Wrap(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.photo_library,
                  ),
                  title: const Text(
                    'Thu Vien',
                    style: TextStyle(),
                  ),
                  onTap: () {
                    selectfile(true);
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.camera_alt,
                  ),
                  title: const Text(
                    'Camera',
                    style: TextStyle(),
                  ),
                  onTap: () {
                    selectfile(false);
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ));
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("LichDat");
  }

  selectfile(bool imageFrom) async {
    file = (await ImagePicker().pickImage(
        source: imageFrom ? ImageSource.gallery : ImageSource.camera))!;
    if (file != null) {
      setState(() {});
    }
  }

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
    final SignupButon = Material(
      // elevation: 5,
      borderRadius: BorderRadius.circular(30),
      // borderRadius: BorderRadius.circular(30),
      // color: Colors.redAccent,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
            width: 200,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: Colors.redAccent,
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              onPressed: () async {
                if (TenDichVuEdittingController.text == "") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text("Bạn chưa nhập nội dung công việc"),
                        );
                      });
                } else if (PhoneEdittingController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text("Bạn chưa nhập số điện thoại"),
                        );
                      });
                } else if (PhoneEdittingController.text.toString().length !=
                    10) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text("Số điện thoại phải có 10 số"),
                        );
                      });
                } else if (DiaChiEdittingController.text == "") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text("Bạn chưa nhập địa chỉ"),
                        );
                      });
                } else if (NgaydatEdittingController.text == "") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text("Bạn chưa chọn ngày"),
                        );
                      });
                } else {
                  String url = await uploadImage(selecterImage!);
                  DatLichData datLichData = DatLichData(
                      dichvu: TenDichVuEdittingController.text,
                      diachi: DiaChiEdittingController.text,
                      email: EmailEdittingController.text,
                      sdt: PhoneEdittingController.text,
                      ngaydat: NgaydatEdittingController.text,
                      phanhoi: '',
                      ngayhoanthanh: '',
                      image: url,
                      nhanvien: 'Chờ nhân viên',
                      xacnhan: 'Chưa xác nhận',
                      hoanthanh: 'Chưa hoàn thành');

                  addLichDat(datLichData, context);
                }
              },
              child: const Text(
                "Đặt lịch ngay",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 121, 11, 1),
        title: Text("ĐẶT LỊCH"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              StreamBuilder(
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
                            EmailEdittingController.text = data['email'];
                            return Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: TenDichVuEdittingController,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      TenDichVuEdittingController.text = value!;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(),
                                      label: Text('Nội dung công việc'),
                                      labelStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    controller: EmailEdittingController,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    keyboardType: TextInputType.none,
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(),
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  // SDT,
                                  TextFormField(
                                    controller: PhoneEdittingController,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(),
                                      labelText: 'Số điện thoại',
                                      labelStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    controller: DiaChiEdittingController,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(),
                                      labelText: 'Địa chỉ',
                                      labelStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    controller: NgaydatEdittingController,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    keyboardType: TextInputType.none,
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.calendar_today_rounded),
                                      // border: OutlineInputBorder(),
                                      labelText: 'Ngày đặt ',
                                      labelStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2201));
                                      if (pickedDate != null) {
                                        setState(() {
                                          NgaydatEdittingController.text =
                                              DateFormat('dd-MM-yyyy')
                                                  .format(pickedDate);
                                        });
                                      }
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: InkWell(
                                      onTap: () {
                                        getImage(ImageSource.camera);
                                      },
                                      child: selecterImage == null
                                          ? Container(
                                              // width: 300,
                                              // height: 20,
                                              //   backgroundColor:
                                              //       Color(0xff476cfb),
                                              // height: MediaQuery.of(context)
                                              //         .size
                                              //         .height *
                                              //     0.2,
                                              //    height: 130,
                                              // margin:
                                              //     EdgeInsets.only(bottom: 20),
                                              // decoration: BoxDecoration(
                                              //     shape: BoxShape.circle,
                                              //     color: Color.fromARGB(
                                              //         255, 214, 19, 19)),
                                              // child: CircleAvatar(
                                              //   radius: 70,
                                              //   backgroundColor:
                                              //       Color(0xff476cfb),
                                              child: Container(
                                                  // child: SizedBox(
                                                  //   width: 40,
                                                  //   height: 40,
                                                  //   child: Image.network(
                                                  //     imageUrl,
                                                  //     fit: BoxFit.fill,
                                                  //   ),
                                                  // ),
                                                  ),
                                              // ),
                                            )
                                          : Container(
                                              child: Container(
                                                height: 50,

                                                // margin: EdgeInsets.only(
                                                //     bottom: 20),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: FileImage(
                                                          selecterImage!),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                            ),

                                      // Container(
                                      //     width: 120,
                                      //     height: 120,
                                      //     margin:
                                      //         EdgeInsets.only(bottom: 20),
                                      //     decoration: BoxDecoration(
                                      //         image: DecorationImage(
                                      //             image: Image.network(imageUrl)),
                                      //         shape: BoxShape.circle,
                                      //         color: Color(0xffD6D6D6)),
                                      //   ),

                                      // child: ClipOval(
                                      //   child: SizedBox(
                                      //     width: 180,
                                      //     height: 180,
                                      //     child: Image.network(userModel!.image.toString()),
                                      //   ),
                                      // ),

                                      // margin: EdgeInsets.only(top: 30),
                                      // width: 120,
                                      // height: 120,
                                      // alignment: Alignment.center,
                                      // decoration: const BoxDecoration(
                                      //     borderRadius: BorderRadius.all(
                                      //         Radius.circular(20)),
                                      //     color: Colors.blue),
                                      /// child: CircleAvatar(
                                      //   radius: 70,
                                      //   backgroundColor: Color(0xff476cfb),
                                      //   child: ClipOval(
                                      //     child: SizedBox(
                                      //       width: 150,
                                      //       height: 150,
                                      //       child: Image.network(
                                      //         imageUrl,
                                      //         fit: BoxFit.fill,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Ảnh chứng minh, căn cước công cân(mặt trước)',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 207, 4, 4),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        getImage(ImageSource.camera);
                                      },
                                      icon: const Icon(
                                        Icons.card_giftcard,
                                      ),
                                      label: const Text('Chứng minh thư')),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    '* Quý khách vui lòng kiểm tra đúng thông tin trước khi đặt lịch',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 207, 4, 4),
                                    ),
                                  ),
                                  SignupButon
                                ],
                              ),
                            );
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  })
            ]),
          ),
        ),
      ),
    );
  }
}

void addLichDat(DatLichData datLichData, BuildContext context) {
  final datLichRef = FirebaseFirestore.instance.collection('LichDat').doc();
  datLichData.id = datLichRef.id;
  final data = datLichData.toJson();
  datLichRef.set(data).whenComplete(() {
    Fluttertoast.showToast(msg: "Đặt lịch thành công");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  });
}
