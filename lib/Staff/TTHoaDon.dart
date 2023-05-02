import 'package:chothuenhancong/Staff/HoaDon.dart';
import 'package:chothuenhancong/model/Hoa_don.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChiTietHoaDonNV extends StatefulWidget {
  final HoaDonData hoaDonData;

  const ChiTietHoaDonNV({super.key, required this.hoaDonData});

  @override
  State<ChiTietHoaDonNV> createState() => _ChiTietHoaDonNVState();
}

class _ChiTietHoaDonNVState extends State<ChiTietHoaDonNV> {
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

  final item = ['Đã thanh toán', 'Chưa thanh toán'];
  String? values;
  @override
  void initState() {
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
        backgroundColor: Color.fromARGB(255, 29, 118, 36),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "THÔNG TIN HÓA ĐƠN ",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 248, 246, 246)),
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
              getMyFiled(
                  hinText: 'Ngày hoàn thành',
                  textInputType: TextInputType.none,
                  controller: NgayhoanthanhController),

              getMyFiled(
                  hinText: 'Nhân viên sửa chữa',
                  textInputType: TextInputType.none,
                  controller: NhanvienController),
              getMyFiled(
                  hinText: 'Ghi chú',
                  textInputType: TextInputType.none,
                  controller: GhichuController),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //       controller: GiatienController,
              //       keyboardType: TextInputType.none,
              //       style: const TextStyle(
              //           color: Color.fromARGB(255, 0, 0, 0),
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20),
              //       decoration: const InputDecoration(
              //           labelText: 'Tổng tiền', contentPadding: EdgeInsets.zero
              //           // border: const OutlineInputBorder(
              //           //     borderRadius: BorderRadius.all(Radius.circular(5))),
              //           )),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //       controller: TrangthaiController,
              //       keyboardType: TextInputType.none,
              //       style: const TextStyle(
              //           color: Color.fromARGB(255, 0, 0, 0),
              //           fontWeight: FontWeight.bold,
              //           fontSize: 17),
              //       decoration: const InputDecoration(
              //           labelText: 'Trạng thái', contentPadding: EdgeInsets.zero
              //           // border: const OutlineInputBorder(
              //           //     borderRadius: BorderRadius.all(Radius.circular(5))),
              //           )),
              // ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     child: DropdownButton<String>(
              //         iconSize: 20,
              //         isExpanded: true,
              //         value: TrangthaiController.text,
              //         items: item.map(buildMenuItem).toList(),
              //         onChanged: (value) => setState(
              //             () => this.TrangthaiController.text = value!)),
              //   ),
              // ),
              getMyFiled(
                  hinText: 'Trạng thái',
                  textInputType: TextInputType.none,
                  controller: TrangthaiController),
              getMyFiled(
                  hinText: 'Hình thức thanh toán',
                  textInputType: TextInputType.none,
                  controller: HTThanhtoanController),
              getMyFiled(
                  hinText: 'Tổng tiền',
                  textInputType: TextInputType.none,
                  controller: GiatienController),

              // ElevatedButton(onPressed: onPressed, child: child)
              // getMyFiled(
              //     hinText: 'Tổng tiền',
              //     textInputType: TextInputType.none,
              //     controller: GiatienController),

              // Container(
              //   margin: const EdgeInsets.only(top: 10),
              //   // ignore: unnecessary_new
              //   child: new ButtonBar(
              //     alignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       MaterialButton(
              //           child: Text('Tao hoa don'), onPressed: () {}),
              //       MaterialButton(child: Text('Cap Nhat'), onPressed: () {})
              //     ],
              //   ),
              // ),

              // Container(
              //   child: Card(
              //     color: Colors.blue,
              //     shape: new RoundedRectangleBorder(
              //         borderRadius: new BorderRadius.circular(30)),
              //     margin: const EdgeInsets.all(8.0),
              //     child: MaterialButton(
              //       child: Text("Tạo hóa đơn"),
              //       onPressed: () {
              //         if (HoanthanhController.text == 'Đã hoàn thành') {
              //           Fluttertoast.showToast(msg: "Đơn hàng đã hoàn thành");
              //         } else {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => HoaDon(
              //                   datLichData: datLichData,
              //                 ),
              //               ));
              //         }
              //       },
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ElevatedButton(
              //         onPressed: () {
              //           // DatLichData datLichDatas = DatLichData(
              //           //     id: datLichData.id,
              //           //     dichvu: tendichvuController.text,
              //           //     diachi: DiaChiController.text,
              //           //     email: EmailController.text,
              //           //     sdt: PhoneController.text,
              //           //     ngaydat: NgaydatController.text,
              //           //     nhanvien: NhanvienController.text,
              //           //     xacnhan: XacnhanController.text,
              //           //     hoanthanh: HoanthanhController.text);

              //           // final collectionController =
              //           //     FirebaseFirestore.instance.collection('LichDat');
              //           // collectionController
              //           //     .doc(datLichDatas.id)
              //           //     .update(datLichDatas.toJson())
              //           //     .whenComplete(() {
              //           //   Fluttertoast.showToast(msg: "Cập nhật thành công");
              //           //   Navigator.push(
              //           //       context,
              //           //       MaterialPageRoute(
              //           //         builder: (context) => Lichsudat(),
              //           //       ));
              //           // });
              //         },
              //         child: Text("Cập Nhật"))
              //   ],
              // )
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
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
