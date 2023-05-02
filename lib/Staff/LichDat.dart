import 'package:chothuenhancong/Staff/TTLichDatNV.dart';
import 'package:chothuenhancong/Staff/TrangChu.dart';
import 'package:chothuenhancong/User/Home.dart';
import 'package:chothuenhancong/User/TTLichDat.dart';
import 'package:chothuenhancong/model/Dat_lich.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class LichDatNV extends StatefulWidget {
  const LichDatNV({super.key});

  @override
  State<LichDatNV> createState() => _LichDatNVState();
}

class _LichDatNVState extends State<LichDatNV> {
  final currentUser = FirebaseAuth.instance;

  final firebaseAuth = FirebaseAuth.instance;
  // List<DatLichData> datlichDatas = [];
  List<DatLichData> datlichData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 29, 118, 36),
          title: const Text(
            "LỊCH ĐẶT",
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 238, 237, 237)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeNhanVien()));
            },
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('LichDat')
              .where("nhanvien", isEqualTo: currentUser.currentUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              datlichData = snapshot.data!.docs
                  .map((e) =>
                      DatLichData.fromJson(e.data() as Map<String, dynamic>))
                  .toList();

              return getBody(datlichData);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget getBody(datlichDatas) {
    return ListView.builder(
      itemCount: datlichDatas.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(
            datlichDatas[index].dichvu,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Ngày ${datlichDatas[index].ngaydat};'),
          trailing: SizedBox(
            width: 60,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UploadLichdatNV(
                                datLichData: datlichDatas[index])));
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
