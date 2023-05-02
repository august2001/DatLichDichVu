// import 'package:chothuenhancong/Admin/LichDat.dart';
// import 'package:chothuenhancong/Staff/HoaDon.dart';
// import 'package:chothuenhancong/model/Dat_lich.dart';
// import 'package:chothuenhancong/model/Hoa_don.dart';
// import 'package:chothuenhancong/model/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_connect/http/src/request/request.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as Path;

// class TTNguoiDung extends StatefulWidget {
//   final UserModel userModel;

//   const TTNguoiDung({super.key, required this.userModel});

//   @override
//   State<TTNguoiDung> createState() => _TTNguoiDungState();
// }

// class _TTNguoiDungState extends State<TTNguoiDung> {
//   // FirebaseFirestore? userStore;
//   // UserModel? userModel;
//   // var myUser = UserModel().obs;
//   final key = GlobalKey<FormState>();
//   final firstNameEdittingController = new TextEditingController();
//   final secondNameEdittingController = new TextEditingController();
//   final emailEdittingController = new TextEditingController();
//   final phoneEdittingController = new TextEditingController();
//   final passwordEdittingController = new TextEditingController();
//   final roleController = new TextEditingController();

//   TextEditingController id = TextEditingController();
//   final auth = FirebaseAuth.instance;
//   final firestoreRef = FirebaseFirestore.instance;
//   // uploadImage(File image) async {
//   //   String imageurl = '';
//   //   String fileName = Path.basename(image.path);
//   //   var reference = FirebaseStorage.instance.ref().child('users/$fileName');
//   //   UploadTask uploadTask = reference.putFile(image);
//   //   TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
//   //   await taskSnapshot.ref.getDownloadURL().then((value) {
//   //     imageurl = value;
//   //     print("DownloadUrl: $value");
//   //   });
//   //   return imageurl;
//   // }
//   late String imageUrl;

//   @override
//   void initState() {
//     //  late String imageUrl;
//     // id = TextEditingController(text: widget.userModel.uid);
//     // // TODO: implement initState
//     // TenController = TextEditingController(text: widget.userModel.firstName);
//     // HoController = TextEditingController(text: widget.userModel.secondName);
//     // PhoneController = TextEditingController(text: widget.userModel.phone);
//     //   image = widget.userModel.image.toString();
//     // image = (widget.userModel.image!);
// //    image = Image.network(widget.userModel.image) as String;
//     // Image.network(image);
//     // DiaChiController = TextEditingController(text: widget.datLichData.diachi);
//     // EmailController = TextEditingController(text: widget.datLichData.email);
//     // NgaydatController = TextEditingController(text: widget.datLichData.ngaydat);
//     // NgayhoanthanhController =
//     //     TextEditingController(text: widget.datLichData.ngayhoanthanh);
//     // NhanvienController =
//     //     TextEditingController(text: widget.datLichData.nhanvien);
//     // XacnhanController = TextEditingController(text: widget.datLichData.xacnhan);
//     // HoanthanhController =
//     //     TextEditingController(text: widget.datLichData.hoanthanh);
//     // PhanhoiController = TextEditingController(text: widget.datLichData.phanhoi);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         elevation: 0,
//         // title: const Text(
//         //   "THÔNG TIN LICH ĐẶT ",
//         //   style: TextStyle(color: Colors.black),
//         // ),
//         // leading: IconButton(
//         //   icon:
//         //       const Icon(Icons.arrow_back, color: Color.fromARGB(255, 2, 2, 2)),
//         //   onPressed: () {
//         //     Navigator.of(context).pop();
//         //   },
//         // ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(children: [
//               StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection("users")
//                     .where("uid", isEqualTo: widget.userModel.uid)
//                     //                auth.currentUser!.uid
//                     .snapshots(),
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                         itemCount: snapshot.data!.docs.length,
//                         shrinkWrap: true,
//                         itemBuilder: (context, i) {
//                           var data = snapshot.data!.docs[i];
//                           emailEdittingController.text = data['email'];
//                           firstNameEdittingController.text = data['firstName'];
//                           phoneEdittingController.text = data['phone'];
//                           secondNameEdittingController.text =
//                               data['secondName'];
//                           roleController.text = data['role'];
//                           passwordEdittingController.text = data['password'];
//                           imageUrl = data['image'];

//                           return Container(
//                               child: Padding(
//                             padding: EdgeInsets.all(20.0),
//                             child: Form(
//                               child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     imageUrl == null
//                                         ? Placeholder(
//                                             fallbackHeight: 200,
//                                             fallbackWidth: 400,
//                                           )
//                                         : Container(
//                                             height: 300,
//                                             width: 300,
//                                             child: Image.network(
//                                               imageUrl,
//                                               fit: BoxFit.fill,
//                                             ),
//                                           ),
//                                     // Image.network(
//                                     //   imageUrl,
//                                     //   fit: BoxFit.contain,
//                                     // ),
//                                     // Align(
//                                     //   alignment: Alignment.bottomCenter,

//                                     // onTap: () {
//                                     //   getImage(ImageSource.camera);
//                                     // },
//                                     // child: selecterImage == null
//                                     //     ? Container(
//                                     //         width: 130,
//                                     //         height: 130,
//                                     //         margin:
//                                     //             EdgeInsets.only(bottom: 20),
//                                     //         decoration: BoxDecoration(
//                                     //             shape: BoxShape.circle,
//                                     //             color: Color(0xffD6D6D6)),
//                                     //         child: CircleAvatar(
//                                     //           radius: 70,
//                                     //           backgroundColor:
//                                     //               Color(0xff476cfb),
//                                     //           child: ClipOval(
//                                     //             child: SizedBox(
//                                     //               width: 130,
//                                     //               height: 130,
//                                     //               child: Image.network(
//                                     //                 imageUrl,
//                                     //                 fit: BoxFit.fill,
//                                     //               ),
//                                     //             ),
//                                     //           ),
//                                     //         ),
//                                     //       )
//                                     //     : ClipOval(
//                                     //         child: Container(
//                                     //           width: 130,
//                                     //           height: 130,
//                                     //           // margin: EdgeInsets.only(
//                                     //           //     bottom: 20),
//                                     //           decoration: BoxDecoration(
//                                     //             image: DecorationImage(
//                                     //                 image: FileImage(
//                                     //                     selecterImage!),
//                                     //                 fit: BoxFit.fill),
//                                     //           ),
//                                     //         ),
//                                     //       ),

//                                     // Container(
//                                     //     width: 120,
//                                     //     height: 120,
//                                     //     margin:
//                                     //         EdgeInsets.only(bottom: 20),
//                                     //     decoration: BoxDecoration(
//                                     //         image: DecorationImage(
//                                     //             image: Image.network(imageUrl)),
//                                     //         shape: BoxShape.circle,
//                                     //         color: Color(0xffD6D6D6)),
//                                     //   ),

//                                     // child: ClipOval(
//                                     //   child: SizedBox(
//                                     //     width: 180,
//                                     //     height: 180,
//                                     //     child: Image.network(userModel!.image.toString()),
//                                     //   ),
//                                     // ),

//                                     // margin: EdgeInsets.only(top: 30),
//                                     // width: 120,
//                                     // height: 120,
//                                     // alignment: Alignment.center,
//                                     // decoration: const BoxDecoration(
//                                     //     borderRadius: BorderRadius.all(
//                                     //         Radius.circular(20)),
//                                     //     color: Colors.blue),
//                                     /// child: CircleAvatar(
//                                     //   radius: 70,
//                                     //   backgroundColor: Color(0xff476cfb),
//                                     //   child: ClipOval(
//                                     //     child: SizedBox(
//                                     //       width: 150,
//                                     //       height: 150,
//                                     //       child: Image.network(
//                                     //         imageUrl,
//                                     //         fit: BoxFit.fill,
//                                     //       ),
//                                     //     ),
//                                     //   ),
//                                     // ),

//                                     //  ),
//                                     const SizedBox(
//                                       height: 25,
//                                     ),
//                                     // Visibility(
//                                     //   visible: false,
//                                     //   child: TextFormField(
//                                     //     autofocus: false,
//                                     //     controller: roleController,
//                                     //     keyboardType: TextInputType.text,
//                                     //     // onSaved: (value) {
//                                     //     //   emailEdittingController.text = value!;
//                                     //     // },
//                                     //     decoration: InputDecoration(
//                                     //         labelText: "role",
//                                     //         prefixIcon: const Icon(Icons.mail),
//                                     //         contentPadding:
//                                     //             const EdgeInsets.fromLTRB(
//                                     //                 20, 15, 20, 15),
//                                     //         border: OutlineInputBorder(
//                                     //           borderRadius:
//                                     //               BorderRadius.circular(10),
//                                     //         )),
//                                     //   ),
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 15,
//                                     // ),
//                                     // Visibility(
//                                     //   visible: false,
//                                     TextFormField(
//                                       autofocus: false,
//                                       controller: firstNameEdittingController,
//                                       keyboardType: TextInputType.text,
//                                       // onSaved: (value) {
//                                       //   emailEdittingController.text = value!;
//                                       // },
//                                       decoration: InputDecoration(
//                                           labelText: "Ho",
//                                           prefixIcon: const Icon(Icons.mail),
//                                           contentPadding:
//                                               const EdgeInsets.fromLTRB(
//                                                   20, 15, 20, 15),
//                                           border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           )),
//                                     ),
//                                     TextFormField(
//                                       autofocus: false,
//                                       controller: secondNameEdittingController,
//                                       keyboardType: TextInputType.text,
//                                       // onSaved: (value) {
//                                       //   emailEdittingController.text = value!;
//                                       // },
//                                       decoration: InputDecoration(
//                                           labelText: "Ten",
//                                           prefixIcon: const Icon(Icons.mail),
//                                           contentPadding:
//                                               const EdgeInsets.fromLTRB(
//                                                   20, 15, 20, 15),
//                                           border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           )),
//                                     ),
//                                     //      ),
//                                     // const SizedBox(
//                                     //   height: 15,
//                                     // ),
//                                     // TextFormField(
//                                     //   autofocus: false,
//                                     //   controller: emailEdittingController,
//                                     //   keyboardType: TextInputType.text,
//                                     //   onSaved: (value) {
//                                     //     emailEdittingController.text = value!;
//                                     //   },
//                                     //   textInputAction: TextInputAction.next,
//                                     //   decoration: InputDecoration(
//                                     //       labelText: "Email",
//                                     //       prefixIcon: const Icon(Icons.mail),
//                                     //       contentPadding:
//                                     //           const EdgeInsets.fromLTRB(
//                                     //               20, 15, 20, 15),
//                                     //       border: OutlineInputBorder(
//                                     //         borderRadius:
//                                     //             BorderRadius.circular(10),
//                                     //       )),
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 15,
//                                     // ),
//                                     // TextFormField(
//                                     //   controller: firstNameEdittingController,
//                                     //   keyboardType: TextInputType.text,
//                                     //   decoration: InputDecoration(
//                                     //       labelText: "Họ",
//                                     //       prefixIcon:
//                                     //           const Icon(Icons.account_circle),
//                                     //       contentPadding:
//                                     //           const EdgeInsets.fromLTRB(
//                                     //               20, 15, 20, 15),
//                                     //       border: OutlineInputBorder(
//                                     //         borderRadius:
//                                     //             BorderRadius.circular(10),
//                                     //       )),
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 15,
//                                     // ),
//                                     // TextFormField(
//                                     //   controller: phoneEdittingController,
//                                     //   keyboardType: TextInputType.phone,
//                                     //   decoration: InputDecoration(
//                                     //       labelText: "Số điện thoại",
//                                     //       prefixIcon: const Icon(Icons.phone),
//                                     //       contentPadding:
//                                     //           const EdgeInsets.fromLTRB(
//                                     //               20, 15, 20, 15),
//                                     //       border: OutlineInputBorder(
//                                     //         borderRadius:
//                                     //             BorderRadius.circular(10),
//                                     //       )),
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 15,
//                                     // ),
//                                     // TextField(
//                                     //   controller: secondNameEdittingController,
//                                     //   keyboardType: TextInputType.text,
//                                     //   decoration: InputDecoration(
//                                     //       labelText: "Tên",
//                                     //       prefixIcon:
//                                     //           const Icon(Icons.account_circle),
//                                     //       contentPadding:
//                                     //           const EdgeInsets.fromLTRB(
//                                     //               20, 15, 20, 15),
//                                     //       border: OutlineInputBorder(
//                                     //         borderRadius:
//                                     //             BorderRadius.circular(10),
//                                     //       )),
//                                     // ),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     // ElevatedButton(
//                                     //     onPressed: () {
//                                     //       // uploadPic(context);

//                                     //       postDetailsToFirestore();
//                                     //     },
//                                     //     child: Text("Cập nhật"))
//                                   ]),
//                             ),
//                           ));
//                         });
//                   } else {
//                     return CircularProgressIndicator();
//                   }
//                 },
//               ),
//             ]),
//           ),
//         ),
//       ),
//       // body: SingleChildScrollView(
//       //   child: Padding(
//       //     padding: const EdgeInsets.all(8.0),
//       //     child: Column(
//       //       children: [
//       //         const Padding(
//       //           padding: EdgeInsets.all(15.0),
//       //           child: Text(
//       //             'Thông tin lich đặt',
//       //             style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
//       //           ),
//       //         ),
//       //         getMyFiled(hinText: 'Ten', controller: TenController),
//       //         getMyFiled(hinText: 'Ho', controller: HoController),
//       //         getMyFiled(hinText: 'Email', controller: EmailController),
//       //         getMyFiled(hinText: 'Số điện thoại', controller: PhoneController),
//       //         getMyFiled2(hinText: 'Anh ')

//       //         // Padding(
//       //         //   padding: const EdgeInsets.all(4.0),
//       //         //   child: Container(
//       //         //     width: 600,
//       //         //     child: Column(
//       //         //       crossAxisAlignment: CrossAxisAlignment.stretch,
//       //         //       children: const <Widget>[
//       //         //         Text(
//       //         //           "Nhân viên",
//       //         //           textAlign: TextAlign.left,
//       //         //           style: TextStyle(fontSize: 15),
//       //         //         ),
//       //         //       ],
//       //         //     ),
//       //         //   ),
//       //         // ),
//       //         // Container(
//       //         //   width: 600,
//       //         //   child: DropdownButton<String>(
//       //         //       iconSize: 10,
//       //         //       isExpanded: true,
//       //         //       value: NhanvienController.text,
//       //         //       items: itemnhanvien.map(buildMenuItem).toList(),
//       //         //       onChanged: (value) =>
//       //         //           setState(() => this.NhanvienController.text = value!)),
//       //         // ),
//       //         // // getMyFiled(
//       //         // //     hinText: 'Xác nhận',
//       //         // //     textInputType: TextInputType.text,
//       //         // //     controller: XacnhanController),
//       //         // Padding(
//       //         //   padding: const EdgeInsets.all(4.0),
//       //         //   child: Container(
//       //         //     width: 600,
//       //         //     child: Column(
//       //         //       crossAxisAlignment: CrossAxisAlignment.stretch,
//       //         //       children: const <Widget>[
//       //         //         Text(
//       //         //           "Xác nhận",
//       //         //           textAlign: TextAlign.left,
//       //         //           style: TextStyle(fontSize: 15),
//       //         //         ),
//       //         //       ],
//       //         //     ),
//       //         //   ),
//       //         // ),

//       //         // Container(
//       //         //   width: 600,
//       //         //   child: DropdownButton<String>(
//       //         //       iconSize: 10,
//       //         //       isExpanded: true,
//       //         //       value: XacnhanController.text,
//       //         //       items: item.map(buildMenuItem).toList(),
//       //         //       onChanged: (value) =>
//       //         //           setState(() => this.XacnhanController.text = value!)),
//       //         // ),
//       //         // Padding(
//       //         //   padding: const EdgeInsets.all(4.0),
//       //         //   child: Container(
//       //         //     width: 600,
//       //         //     child: Column(
//       //         //       crossAxisAlignment: CrossAxisAlignment.stretch,
//       //         //       children: const <Widget>[
//       //         //         Text(
//       //         //           "Hoàn thành",
//       //         //           textAlign: TextAlign.left,
//       //         //           style: TextStyle(fontSize: 15),
//       //         //         ),
//       //         //       ],
//       //         //     ),
//       //         //   ),
//       //         // ),
//       //         // Container(
//       //         //   width: 600,
//       //         //   child: DropdownButton<String>(
//       //         //       iconSize: 10,
//       //         //       isExpanded: true,
//       //         //       value: HoanthanhController.text,
//       //         //       items: item2.map(buildMenuItem).toList(),
//       //         //       onChanged: (value) =>
//       //         //           setState(() => this.HoanthanhController.text = value!)),
//       //         // ),

//       //         // getMyFiled(
//       //         //     hinText: 'Hoàn thành',
//       //         //     textInputType: TextInputType.text,
//       //         //     controller: HoanthanhController),
//       //         // Row(
//       //         //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //         //   children: [
//       //         //     ElevatedButton(
//       //         //         onPressed: () {
//       //         //           DatLichData datLichDatas = DatLichData(
//       //         //               id: id.text,
//       //         //               dichvu: tendichvuController.text,
//       //         //               diachi: DiaChiController.text,
//       //         //               email: EmailController.text,
//       //         //               sdt: PhoneController.text,
//       //         //               ngaydat: NgaydatController.text,
//       //         //               nhanvien: NhanvienController.text,
//       //         //               ngayhoanthanh: NgayhoanthanhController.text,
//       //         //               phanhoi: PhanhoiController.text,
//       //         //               xacnhan: XacnhanController.text,
//       //         //               hoanthanh: HoanthanhController.text);

//       //         //           final collectionController =
//       //         //               FirebaseFirestore.instance.collection('LichDat');
//       //         //           collectionController
//       //         //               .doc(datLichDatas.id)
//       //         //               .update(datLichDatas.toJson())
//       //         //               .whenComplete(() {
//       //         //             Fluttertoast.showToast(msg: "Cập nhật thành công");
//       //         //             Navigator.push(
//       //         //                 context,
//       //         //                 MaterialPageRoute(
//       //         //                   builder: (context) => AdminLichDat(),
//       //         //                 ));
//       //         //           });
//       //         //         },
//       //         //         child: Text("Cập Nhật"))
//       //         //   ],
//       //         // )
//       //       ],
//       //     ),
//       //   ),
//       // ),
//     );
//   }

//   // Widget getMyFiled2({
//   //   required String hinText,
//   //   TextInputType textInputType = TextInputType.name,
//   // }) {
//   //   return Padding(
//   //     padding: const EdgeInsets.all(8.0),
//   //     child: SizedBox(
//   //       width: 600,
//   //       height: 400,
//   //       child: ClipOval(child: Image.asset(image.toString())),
//   //     ),
//   //   );
//   // }

//   Widget getMyFiled(
//       {required String hinText,
//       TextInputType textInputType = TextInputType.name,
//       required TextEditingController controller}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 600,
//         child: TextFormField(
//             controller: controller,
//             keyboardType: textInputType,
//             decoration: InputDecoration(
//                 hintText: 'Enter $hinText',
//                 labelText: hinText,
//                 contentPadding: EdgeInsets.zero
//                 // border: const OutlineInputBorder(
//                 //     borderRadius: BorderRadius.all(Radius.circular(5))),
//                 )),
//       ),
//     );
//   }

//   // DropdownMenuItem<String> buildMenuItem(String e) => DropdownMenuItem(
//   //     value: e,
//   //     child: Text(
//   //       e,
//   //       style: TextStyle(fontSize: 15),
//   //     ));
// }
