import 'package:chothuenhancong/Staff/TT.dart';
import 'package:chothuenhancong/Staff/TTHoaDon.dart';
import 'package:chothuenhancong/Staff/TTLichDatNV.dart';
import 'package:chothuenhancong/Staff/TrangChu.dart';
import 'package:chothuenhancong/User/Home.dart';
import 'package:chothuenhancong/User/TTLichDat.dart';
// import 'package:chothuenhancong/model/Dat_lich.dart';
import 'package:chothuenhancong/model/Hoa_don.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class DSHoaDonNV extends StatefulWidget {
  const DSHoaDonNV({super.key});

  @override
  State<DSHoaDonNV> createState() => _DSHoaDonNVState();
}

class _DSHoaDonNVState extends State<DSHoaDonNV> {
  final currentUser = FirebaseAuth.instance;

  final firebaseAuth = FirebaseAuth.instance;
  // List<DatLichData> datlichDatas = [];
  List<HoaDonData> hoadonData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 29, 118, 36),
          title: const Text(
            "HÓA ĐƠN",
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 248, 248, 248)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeNhanVien()));
            },
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('HoaDon')
              .where("nhanvien", isEqualTo: currentUser.currentUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              hoadonData = snapshot.data!.docs
                  .map((e) =>
                      HoaDonData.fromJson(e.data() as Map<String, dynamic>))
                  .toList();

              return getBody(hoadonData);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget getBody(hoadonData) {
    return ListView.builder(
      itemCount: hoadonData.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(
            hoadonData[index].dichvu,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Ngày ${hoadonData[index].ngaydat};'),
          trailing: SizedBox(
            width: 60,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChiTietHoaDonNV(
                                hoaDonData: hoadonData[index])));
                  },
                  child: const Text(
                    "Chi tiết",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
