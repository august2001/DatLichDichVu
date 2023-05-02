import 'dart:developer';

import 'package:chothuenhancong/Admin/LichDat.dart';
import 'package:chothuenhancong/User/ZaloPay.dart';
import 'package:chothuenhancong/User/lichsudat.dart';
import 'package:chothuenhancong/model/Dat_lich.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UploadLichdatKH extends StatelessWidget {
  final DatLichData datLichData;
  UploadLichdatKH({super.key, required this.datLichData});

  final TextEditingController tendichvuController = TextEditingController();
  final TextEditingController PhoneController = TextEditingController();
  final TextEditingController DiaChiController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController NgaydatController = TextEditingController();
  final TextEditingController NgayhoanthanhController = TextEditingController();
  final TextEditingController PhanhoiController = TextEditingController();

  final TextEditingController NhanvienController = TextEditingController();
  final TextEditingController XacnhanController = TextEditingController();
  final TextEditingController HoanthanhController = TextEditingController();
  late String imageUrl;

  @override
  Widget build(BuildContext context) {
    tendichvuController.text = '${datLichData.dichvu}';
    PhoneController.text = '${datLichData.sdt}';
    DiaChiController.text = '${datLichData.diachi}';
    EmailController.text = '${datLichData.email}';
    NgaydatController.text = '${datLichData.ngaydat}';
    NgayhoanthanhController.text = '${datLichData.ngayhoanthanh}';
    PhanhoiController.text = '${datLichData.phanhoi}';
    imageUrl = '${datLichData.image}';
    NhanvienController.text = '${datLichData.nhanvien}';
    XacnhanController.text = '${datLichData.xacnhan}';
    HoanthanhController.text = '${datLichData.hoanthanh}';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "THÔNG TIN LỊCH ĐẶT",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              getMyFiled(
                  hinText: 'Nội dung công việc',
                  textInputType: TextInputType.none,
                  controller: tendichvuController),
              getMyFiled(
                  hinText: 'Địa chỉ',
                  textInputType: TextInputType.none,
                  controller: DiaChiController),
              getMyFiled(
                  hinText: 'Email',
                  textInputType: TextInputType.none,
                  controller: EmailController),
              getMyFiled(
                  hinText: 'Số điện thoại',
                  textInputType: TextInputType.none,
                  controller: PhoneController),
              getMyFiled(
                  hinText: 'Ngày đặt',
                  textInputType: TextInputType.none,
                  controller: NgaydatController),
              // getMyFiled(
              //     hinText: 'Ngày hoàn thành',
              //     textInputType: TextInputType.none,
              //     controller: NgayhoanthanhController),
              getMyFiled(
                  hinText: 'Nhân viên sửa chữa',
                  textInputType: TextInputType.none,
                  controller: NhanvienController),
              getMyFiled(
                  hinText: 'Xác nhận',
                  textInputType: TextInputType.none,
                  controller: XacnhanController),
              getMyFiled(
                  hinText: 'Hoàn thành',
                  textInputType: TextInputType.none,
                  controller: HoanthanhController),
              getMyFiled(
                  hinText: 'Phản hồi',
                  textInputType: TextInputType.none,
                  controller: PhanhoiController),
              Visibility(
                visible: false,
                child: ClipOval(
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        DatLichData datLichDatas = DatLichData(
                            id: datLichData.id,
                            dichvu: tendichvuController.text,
                            diachi: DiaChiController.text,
                            email: EmailController.text,
                            sdt: PhoneController.text,
                            ngaydat: NgaydatController.text,
                            ngayhoanthanh: NgayhoanthanhController.text,
                            nhanvien: NhanvienController.text,
                            xacnhan: XacnhanController.text,
                            phanhoi: PhanhoiController.text,
                            image: imageUrl,
                            hoanthanh: HoanthanhController.text);

                        final collectionController =
                            FirebaseFirestore.instance.collection('LichDat');
                        collectionController
                            .doc(datLichDatas.id)
                            .update(datLichDatas.toJson())
                            .whenComplete(() {
                          Fluttertoast.showToast(msg: "Cập nhật thành công");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Lichsudat(),
                              ));
                        });
                      },
                      child: Text("Gửi phản hồi")),
                  ElevatedButton(
                      onPressed: () {
                        if (XacnhanController.text == "Đã xác nhận") {
                          Fluttertoast.showToast(
                              msg: "Lịch đặt của bạn đã được xác nhận");
                        } else {
                          showAlertDialog(context);
                          // delete(datLichData.id);

                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: Text('Hủy lịch'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Không"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget launchButton = TextButton(
      child: Text("Có"),
      onPressed: () {
        delete(datLichData.id);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Lichsudat(),
            ));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("THÔNG BÁO"),
      content: Text("Bạn có chắc chắn muốn hủy lịch đặt?"),
      actions: [
        cancelButton,
        launchButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget getMyFiled(
      {required String hinText,
      TextInputType textInputType = TextInputType.name,
      required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 600,
        child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            decoration: InputDecoration(
                hintText: 'Nhập $hinText',
                labelText: hinText,
                contentPadding: EdgeInsets.zero
                // border: const OutlineInputBorder(
                //     borderRadius: BorderRadius.all(Radius.circular(5))),
                )),
      ),
    );
  }
}

void delete(id) {
  FirebaseFirestore.instance.collection('LichDat').doc(id).delete();
  Fluttertoast.showToast(msg: "Hủy lịch thành công");
}
