import 'dart:io';
import 'package:chothuenhancong/Staff/TrangChu.dart';
import 'package:chothuenhancong/User/Home.dart';
import 'package:chothuenhancong/User/Login.dart';
import 'package:chothuenhancong/model/nhanvien.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:chothuenhancong/manhinh/home.dart';
import 'package:chothuenhancong/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:observer/observer.dart';
import 'package:path/path.dart' as Path;

class TTCaNhanNV extends StatefulWidget {
  const TTCaNhanNV({super.key});

  @override
  State<TTCaNhanNV> createState() => _TTCaNhanNVState();
}

class _TTCaNhanNVState extends State<TTCaNhanNV> {
  final auth = FirebaseAuth.instance;

  FirebaseFirestore? userStore;
  UserModel? userModel;
  var myUser = UserModel().obs;

  // User? user;
// out form key
  final key = GlobalKey<FormState>();
  final firstNameEdittingController = new TextEditingController();
  final secondNameEdittingController = new TextEditingController();
  final emailEdittingController = new TextEditingController();
  final phoneEdittingController = new TextEditingController();
  final CongviecEdittingController = new TextEditingController();
  final NgaysinhEdittingController = new TextEditingController();
  final passwordEdittingController = new TextEditingController();
  final roleController = new TextEditingController();
  final currentUser = FirebaseAuth.instance;
  late String url = "";
  late String imageUrl;

  // UserModel myUser = UserModel()
  // SettingController settingController = Get.put(SettingController());

  final ImagePicker picker = ImagePicker();
  File? selecterImage;
  // UserModel myUser = UserModel();
  getImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selecterImage = File(image.path);
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

  void picUploadProfile() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 90,
    );
    Reference ref = FirebaseStorage.instance.ref().child("users");
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      setState(() {
        userModel!.image = value;
      });
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uid)
        .update({
      'image': userModel!.image,
    });
  }

  getUserInfor() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((event) {
      myUser.value = UserModel.fromJson(event.data()!);
    });
  }

  // var myUser = UserModel();
  // getUserInfo() {
  //   String uid = FirebaseAuth.instance.currentUser!.uid;
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .snapshots()
  //       .listen((event) {
  //     myUser = UserModel.fromJson(event.data()!);
  //   });
  // }

  // storeUserInfo() async {
  //   String url = await uploadImage(selecterImage!);
  //   String uid = FirebaseAuth.instance.currentUser!.uid;
  //   FirebaseFirestore.instance.collection('users').doc(uid).set({
  //     'image': url,
  //   });
  // }

  // getuserDetail() async {
  //   DataSnapshot snapshot = await userRef!.once();
  //   userModel = UserModel.fromMa(Map<String, dynamic>.from(snapshot.value));
  //   setState(() {});
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   userRef = FirebaseDatabase.instance.ref().child('users').child(user!.uid);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 118, 36),
        title: const Text("Thông tin cá nhân"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeNhanVien()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
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
                          emailEdittingController.text = data['email'];
                          firstNameEdittingController.text = data['firstName'];
                          phoneEdittingController.text = data['phone'];
                          secondNameEdittingController.text =
                              data['secondName'];
                          roleController.text = data['role'];
                          passwordEdittingController.text = data['password'];
                          imageUrl = data['image'];
                          CongviecEdittingController.text = data['congviec'];
                          NgaysinhEdittingController.text = data['ngaysinh'];

                          return Container(
                              child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Form(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: InkWell(
                                        onTap: () {
                                          getImage(ImageSource.camera);
                                        },
                                        child: selecterImage == null
                                            ? Container(
                                                width: 120,
                                                height: 120,
                                                margin:
                                                    EdgeInsets.only(bottom: 20),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xffD6D6D6)),
                                                child: CircleAvatar(
                                                  radius: 70,
                                                  backgroundColor:
                                                      Color(0xff476cfb),
                                                  child: ClipOval(
                                                    child: SizedBox(
                                                      width: 120,
                                                      height: 120,
                                                      child: Image.network(
                                                        imageUrl,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                width: 120,
                                                height: 120,
                                                margin:
                                                    EdgeInsets.only(bottom: 20),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: FileImage(
                                                          selecterImage!),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: false,
                                      child: TextFormField(
                                        autofocus: false,
                                        controller: roleController,
                                        keyboardType: TextInputType.text,
                                        // onSaved: (value) {
                                        //   emailEdittingController.text = value!;
                                        // },
                                        decoration: InputDecoration(
                                            labelText: "role",
                                            prefixIcon: const Icon(Icons.mail),
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20, 15, 20, 15),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      ),
                                    ),
                                    Visibility(
                                      visible: false,
                                      child: TextFormField(
                                        autofocus: false,
                                        controller: passwordEdittingController,
                                        keyboardType: TextInputType.text,
                                        // onSaved: (value) {
                                        //   emailEdittingController.text = value!;
                                        // },
                                        decoration: InputDecoration(
                                            labelText: "Password",
                                            prefixIcon: const Icon(Icons.mail),
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20, 15, 20, 15),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      autofocus: false,
                                      controller: emailEdittingController,
                                      keyboardType: TextInputType.text,
                                      onSaved: (value) {
                                        emailEdittingController.text = value!;
                                      },
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          labelText: "Email",
                                          prefixIcon: const Icon(Icons.mail),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 15, 20, 15),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: firstNameEdittingController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          labelText: "Họ",
                                          prefixIcon:
                                              const Icon(Icons.account_circle),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 15, 20, 15),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: phoneEdittingController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          labelText: "Số điện thoại",
                                          prefixIcon: const Icon(Icons.phone),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 15, 20, 15),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextField(
                                      controller: secondNameEdittingController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          labelText: "Tên",
                                          prefixIcon:
                                              const Icon(Icons.account_circle),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 15, 20, 15),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      autofocus: false,
                                      controller: CongviecEdittingController,
                                      keyboardType: TextInputType.text,
                                      onSaved: (value) {
                                        emailEdittingController.text = value!;
                                      },
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          labelText: "Công việc",
                                          prefixIcon: const Icon(Icons.mail),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 15, 20, 15),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      autofocus: false,
                                      controller: NgaysinhEdittingController,
                                      keyboardType: TextInputType.text,
                                      onSaved: (value) {
                                        emailEdittingController.text = value!;
                                      },
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          labelText: "Ngày sinh",
                                          prefixIcon: const Icon(Icons.mail),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 15, 20, 15),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  // uploadPic(context);

                                                  postDetailsToFirestore();
                                                },
                                                child: Text("Cập nhật")),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  // uploadPic(context);

                                                  logout(context);
                                                },
                                                child: Text("Đăng xuất")),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                          ));
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  postDetailsToFirestore() async {
    // goi firestore
    // goi nguoi dung
    //seding các giá trị này

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    String url = await uploadImage(selecterImage!);
    NhanVienModel userModel = NhanVienModel();
    //

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEdittingController.text;
    userModel.phone = phoneEdittingController.text;
    userModel.secondName = secondNameEdittingController.text;
    userModel.password = passwordEdittingController.text;
    userModel.congviec = CongviecEdittingController.text;
    userModel.ngaysinh = NgaysinhEdittingController.text;
    userModel.role = roleController.text;
    userModel.image = url.toString();

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Cập nhật thông tin thành công");
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login()));
  }
}
