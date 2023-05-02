import 'dart:convert';

import 'package:chothuenhancong/Controller/controller.dart';
import 'package:chothuenhancong/Staff/HoaDon.dart';
import 'package:chothuenhancong/User/ThanhToan.dart';
import 'package:chothuenhancong/User/ThanhToanOnline.dart';
import 'package:chothuenhancong/model/Dat_lich.dart';
import 'package:chothuenhancong/model/Hoa_don.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;

class ChiTietHoaDonKH extends StatefulWidget {
  final HoaDonData hoaDonData;

  const ChiTietHoaDonKH({super.key, required this.hoaDonData});

  @override
  State<ChiTietHoaDonKH> createState() => _ChiTietHoaDonKHState();
}

class _ChiTietHoaDonKHState extends State<ChiTietHoaDonKH> {
  Map<String, dynamic>? paymentIntenData;
  TextEditingController tendichvuController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController DiaChiController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController NgaydatController = TextEditingController();
  TextEditingController NgayhoanthanhController = TextEditingController();
  TextEditingController NhanvienController = TextEditingController();
  TextEditingController GhichuController = TextEditingController();
  TextEditingController GiatienController = TextEditingController();
  TextEditingController TrangthaiController = TextEditingController();
  TextEditingController HTThanhtoanController = TextEditingController();
  TextEditingController id = TextEditingController();
  final auth = FirebaseAuth.instance;
  final firestoreRef = FirebaseFirestore.instance;

  // final item = ['Đã thanh toán', 'Chưa thanh toán'];
  // String? values;
  final item = [
    'Chọn hình thức thanh toán',
    'Thanh toán bằng tiền mặt',
    'Thanh toán Momo'
  ];

  String? values;

  @override
  void initState() {
    id = TextEditingController(text: widget.hoaDonData.id);
    // TODO: implement initState
    tendichvuController = TextEditingController(text: widget.hoaDonData.dichvu);
    PhoneController = TextEditingController(text: widget.hoaDonData.sdt);
    DiaChiController = TextEditingController(text: widget.hoaDonData.diachi);
    EmailController = TextEditingController(text: widget.hoaDonData.email);
    NgaydatController = TextEditingController(text: widget.hoaDonData.ngaydat);
    NgayhoanthanhController =
        TextEditingController(text: widget.hoaDonData.ngayhoanthanh);
    NhanvienController =
        TextEditingController(text: widget.hoaDonData.nhanvien);
    GhichuController = TextEditingController(text: widget.hoaDonData.ghichu);
    GiatienController = TextEditingController(text: widget.hoaDonData.giatien);
    TrangthaiController =
        TextEditingController(text: widget.hoaDonData.trangthai);
    HTThanhtoanController =
        TextEditingController(text: widget.hoaDonData.hinhthucthanhtoan);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // PhoneController.text = '${hoaDonData.sdt}';
    // DiaChiController.text = '${hoaDonData.diachi}';
    // EmailController.text = '${hoaDonData.email}';
    // NgaydatController.text = '${hoaDonData.ngaydat}';
    // NgayhoanthanhController.text = '${hoaDonData.ngayhoanthanh}';

    // NhanvienController.text = '${hoaDonData.nhanvien}';
    // GhichuController.text = '${hoaDonData.ghichu}';
    // GiatienController.text = '${hoaDonData.giatien}';
    // TrangthaiController.text = '${hoaDonData.trangthai}';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 18, 104, 33),
        elevation: 0,
        title: const Text(
          "THÔNG TIN HÓA ĐƠN ",
          style: TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 238, 237, 237)),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: tendichvuController,
                  keyboardType: TextInputType.none,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 19, 19, 19), fontSize: 17),
                  decoration: const InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 248, 4, 4)),
                      labelText: 'Nội dung công việc',
                      contentPadding: EdgeInsets.zero
                      // border: const OutlineInputBorder(
                      //     borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: DiaChiController,
                    keyboardType: TextInputType.none,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        // fontWeight: FontWeight.bold,
                        fontSize: 17),
                    decoration: const InputDecoration(
                        labelText: 'Địa chỉ', contentPadding: EdgeInsets.zero
                        // border: const OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: EmailController,
                    keyboardType: TextInputType.none,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        // fontWeight: FontWeight.bold,
                        fontSize: 17),
                    decoration: const InputDecoration(
                        labelText: 'Email', contentPadding: EdgeInsets.zero
                        // border: const OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: PhoneController,
                    keyboardType: TextInputType.none,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        // fontWeight: FontWeight.bold,
                        fontSize: 17),
                    decoration: const InputDecoration(
                        labelText: 'Số điện thoại',
                        contentPadding: EdgeInsets.zero
                        // border: const OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: NgaydatController,
                    keyboardType: TextInputType.none,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        // fontWeight: FontWeight.bold,
                        fontSize: 17),
                    decoration: const InputDecoration(
                        labelText: 'Ngày đặt', contentPadding: EdgeInsets.zero
                        // border: const OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        )),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: NgayhoanthanhController,
                    keyboardType: TextInputType.none,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        // fontWeight: FontWeight.bold,
                        fontSize: 17),
                    decoration: const InputDecoration(
                        labelText: 'Ngày hoàn thành',
                        contentPadding: EdgeInsets.zero
                        // border: const OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        )),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: NhanvienController,
                    keyboardType: TextInputType.none,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        // fontWeight: FontWeight.bold,
                        fontSize: 17),
                    decoration: const InputDecoration(
                        labelText: 'Nhân viên sửa chữa',
                        contentPadding: EdgeInsets.zero
                        // border: const OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        )),
              ),
              // getMyFiled(
              //     hinText: 'Ghi chú',
              //     textInputType: TextInputType.text,
              //     controller: GhichuController),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: GhichuController,
                    keyboardType: TextInputType.none,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        // fontWeight: FontWeight.bold,
                        fontSize: 17),
                    decoration: const InputDecoration(
                        labelText: 'Ghi chú', contentPadding: EdgeInsets.zero
                        // border: const OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        )),
              ),
              // getMyFiled(
              //     hinText: 'HInh thuc thanh toan',
              //     textInputType: TextInputType.none,
              //     controller: HTThanhtoanController),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: GiatienController,
                    keyboardType: TextInputType.none,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 8, 8, 8),
                        // fontWeight: FontWeight.bold,
                        fontSize: 17),
                    decoration: const InputDecoration(
                        labelText: 'Tổng tiền', contentPadding: EdgeInsets.zero
                        // border: const OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: TrangthaiController,
                    keyboardType: TextInputType.none,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 7, 5, 5),
                        // fontWeight: FontWeight.bold,
                        fontSize: 17),
                    decoration: const InputDecoration(
                        labelText: 'Trạng thái', contentPadding: EdgeInsets.zero
                        // border: const OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const <Widget>[
                    Text(
                      "*Hình thức thanh toán",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: DropdownButton<String>(
                      iconSize: 20,
                      isExpanded: true,
                      value: HTThanhtoanController.text,
                      items: item.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(
                          () => this.HTThanhtoanController.text = value!)),
                ),
              ),
              // TextButton(
              //     onPressed: () {
              //       // await makePayment();
              //     },
              //     child: Text('Thanh Toan')),

              ElevatedButton(
                  onPressed: () {
                    if (HTThanhtoanController.text ==
                        "Chọn hình thức thanh toán") {
                      Fluttertoast.showToast(
                          msg: "Bạn chưa chọn hình thức thanh toán");
                    } else {
                      HoaDonData hoaDonDatas = HoaDonData(
                          id: id.text,
                          dichvu: tendichvuController.text,
                          diachi: DiaChiController.text,
                          email: EmailController.text,
                          sdt: PhoneController.text,
                          ngaydat: NgaydatController.text,
                          ngayhoanthanh: NgayhoanthanhController.text,
                          nhanvien: NhanvienController.text,
                          giatien: GiatienController.text,
                          ghichu: GhichuController.text,
                          hinhthucthanhtoan: HTThanhtoanController.text,
                          trangthai: TrangthaiController.text);

                      final collectionController =
                          FirebaseFirestore.instance.collection('HoaDon');
                      collectionController
                          .doc(hoaDonDatas.id)
                          .update(hoaDonDatas.toJson())
                          .whenComplete(() {
                        Fluttertoast.showToast(msg: "Cập nhật thành công");
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Lichsudat(),
                        //     ));
                      });
                    }
                    // style:
                    // ButtonStyle(
                    //     backgroundColor: MaterialStateProperty.all(Colors.red));
                    // child:
                    // Text('Hủy lịch');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: Text("Xác nhận thanh toán"))
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
                hintText: 'Enter $hinText',
                labelText: hinText,
                contentPadding: EdgeInsets.zero
                // border: const OutlineInputBorder(
                //     borderRadius: BorderRadius.all(Radius.circular(5))),
                )),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String e) => DropdownMenuItem(
      value: e,
      child: Text(
        e,
        style: TextStyle(fontSize: 15),
      ));

  // Future<void> makePayment() async {
  //   try {
  //     paymentIntenData = await creaPaymentIntent('2000', 'USD');
  //     //Payment Sheet
  //     await Stripe.instance
  //         .initPaymentSheet(
  //             paymentSheetParameters: SetupPaymentSheetParameters(
  //                 paymentIntentClientSecret: paymentIntenData!['client_secret'],
  //                 // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
  //                 googlePay: const PaymentSheetGooglePay(
  //                     testEnv: true,
  //                     currencyCode: "USD",
  //                     merchantCountryCode: "+92"),
  //                 style: ThemeMode.dark,
  //                 merchantDisplayName: 'Adnan'))
  //         .then((value) {});

  //     ///now finally display payment sheeet
  //     displayPayment();
  //   } catch (e, s) {
  //     print('exception:$e$s');
  //   }
  // }

  displayPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print("Thanh COng");
      });
    } catch (e) {
      print('$e');
    }
  }

  creaPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': "2000",
        'currency': "USD",
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51MZameKsFBqI13OgEqhr41S97nPGCoWZz3RK8p1VQ3IwgDHvFZuDfqKWSDMy0ZjdfWps5hlOWjJ0jRO5USZmWRCb00Dqf8dT1i',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      // return jsonDecode(response.body.toString());
    } catch (e) {
      print('Loi' + e.toString());
    }
  }

  calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price;
  }
}
