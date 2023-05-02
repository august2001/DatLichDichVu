import 'package:chothuenhancong/User/Home.dart';
import 'package:chothuenhancong/User/TTLichDat.dart';
import 'package:chothuenhancong/model/Dat_lich.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Lichsudat extends StatefulWidget {
  const Lichsudat({super.key});

  @override
  State<Lichsudat> createState() => _LichsudatState();
}

class _LichsudatState extends State<Lichsudat> {
  final currentUser = FirebaseAuth.instance;

  final firebaseAuth = FirebaseAuth.instance;
  List<DatLichData> datlichDatas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(24, 121, 11, 1),
          title: const Text(
            "LỊCH SỬ ĐẶT",
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 241, 241, 241)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('LichDat')
              .where("email", isEqualTo: currentUser.currentUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              datlichDatas = snapshot.data!.docs
                  .map((e) =>
                      DatLichData.fromJson(e.data() as Map<String, dynamic>))
                  .toList();

              return getBody(datlichDatas);
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
                            builder: (context) => UploadLichdatKH(
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
