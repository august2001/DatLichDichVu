import 'dart:developer';
import 'package:chothuenhancong/Staff/TrangChu.dart';
import 'package:chothuenhancong/model/Hoa_don.dart';
import 'package:intl/intl.dart';
import 'package:chothuenhancong/Admin/LichDat.dart';
import 'package:chothuenhancong/User/lichsudat.dart';
import 'package:chothuenhancong/model/Dat_lich.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HoaDon extends StatelessWidget {
  final DatLichData datLichData;
  HoaDon({super.key, required this.datLichData});

  final TextEditingController tendichvuController = TextEditingController();
  final TextEditingController PhoneController = TextEditingController();
  final TextEditingController DiaChiController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController NgaydatController = TextEditingController();
  final TextEditingController NgayhoanthanhController = TextEditingController();
  final TextEditingController NhanvienController = TextEditingController();
  final TextEditingController GhichuController = TextEditingController();
  final TextEditingController GiatienController = TextEditingController();
  final TextEditingController HinhthucthanhtoanController =
      TextEditingController();

  final TextEditingController TrangthaiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    tendichvuController.text = '${datLichData.dichvu}';
    PhoneController.text = '${datLichData.sdt}';
    DiaChiController.text = '${datLichData.diachi}';
    EmailController.text = '${datLichData.email}';
    NgaydatController.text = '${datLichData.ngaydat}';
    NgayhoanthanhController.text = '${datLichData.ngayhoanthanh}';

    NhanvienController.text = '${datLichData.nhanvien}';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "HÓA ĐƠN",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, color: Color.fromARGB(255, 6, 5, 5)),
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
              TextField(
                controller: NgayhoanthanhController,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.none,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today_rounded),
                  // border: OutlineInputBorder(),
                  labelText: 'Ngày hoàn thành ',
                  labelStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2201));
                  if (pickedDate != null) {
                    // setState(() {
                    NgayhoanthanhController.text =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    // });
                  }
                },
              ),
              // getMyFiled2(
              //     hinText: 'Ngày hoàn thành',
              //     textInputType: TextInputType.text,
              //     controller: NgayhoanthanhController),
              getMyFiled(
                  hinText: 'Nhân viên sửa chữa',
                  textInputType: TextInputType.none,
                  controller: NhanvienController),
              getMyFiled(
                  hinText: 'Ghi chú',
                  textInputType: TextInputType.text,
                  controller: GhichuController),
              getMyFiled(
                  hinText: 'Giá tiền',
                  textInputType: TextInputType.number,
                  controller: GiatienController),
              getMyFiled(
                  hinText: 'Hinh thuc thanh toan',
                  textInputType: TextInputType.number,
                  controller: HinhthucthanhtoanController),
              // getMyFiled(
              //     hinText: 'Trạng thái',
              //     textInputType: TextInputType.number,
              //     controller: GiatienController),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        HoaDonData hoaDonData = HoaDonData(
                            dichvu: tendichvuController.text,
                            diachi: DiaChiController.text,
                            email: EmailController.text,
                            sdt: PhoneController.text,
                            ngaydat: NgaydatController.text,
                            ngayhoanthanh: NgayhoanthanhController.text,
                            nhanvien: NhanvienController.text,
                            giatien: GiatienController.text,
                            ghichu: GhichuController.text,
                            hinhthucthanhtoan: HinhthucthanhtoanController.text,
                            trangthai: 'Chưa thanh toán');

                        addLichDat(hoaDonData, context);

                        // DatLichData datLichDatas = DatLichData(
                        //     id: datLichData.id,
                        //     dichvu: tendichvuController.text,
                        //     diachi: DiaChiController.text,
                        //     email: EmailController.text,
                        //     sdt: PhoneController.text,
                        //     ngaydat: NgaydatController.text,
                        //     nhanvien: NhanvienController.text,
                        //     xacnhan: XacnhanController.text,
                        //     hoanthanh: HoanthanhController.text);

                        // final collectionController =
                        //     FirebaseFirestore.instance.collection('LichDat');
                        // collectionController
                        //     .doc(datLichDatas.id)
                        //     .update(datLichDatas.toJson())
                        //     .whenComplete(() {
                        //   Fluttertoast.showToast(msg: "Cập nhật thành công");
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => Lichsudat(),
                        //       ));
                        // });
                      },
                      child: Text("Tạo hóa đơn"))
                ],
              )
            ],
          ),
        ),
      ),
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
                // hintText: 'Enter $hinText',
                labelText: hinText,
                contentPadding: EdgeInsets.zero
                // border: const OutlineInputBorder(
                //     borderRadius: BorderRadius.all(Radius.circular(5))),
                )),
      ),
    );
  }
}

void addLichDat(HoaDonData hoaDonData, BuildContext context) {
  final hoadonRef = FirebaseFirestore.instance.collection('HoaDon').doc();
  hoaDonData.id = hoadonRef.id;
  final data = hoaDonData.toJson();
  hoadonRef.set(data).whenComplete(() {
    Fluttertoast.showToast(msg: "Tạo hóa đơn thành công");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeNhanVien()));
  });
}
