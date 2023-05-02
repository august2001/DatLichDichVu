import 'dart:ui';

import 'package:chothuenhancong/model/BangGia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BangGiaDienLanh extends StatefulWidget {
  const BangGiaDienLanh({super.key});

  @override
  State<BangGiaDienLanh> createState() => _BangGiaDienLanhState();
}

class _BangGiaDienLanhState extends State<BangGiaDienLanh> {
  List<BangGia> bangGias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('BangGiaDienLanh')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bangGias = snapshot.data!.docs
                .map((e) => BangGia.fromJson(e.data() as Map<String, dynamic>))
                .toList();

            return getBody(bangGias);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }

  Widget getBody(bangGias) {
    return ListView.builder(
      itemCount: bangGias.length,
      itemBuilder: (context, index) => Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListTile(
            // title: SizedBox(
            //     height: 100,
            //     child: Container(child: Image.network(bangGias[index].image))),
            title: Text(
              bangGias[index].ten,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              bangGias[index].ten,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  bangGias[index].gia,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.red),
                ),
              ],
            ),
            leading: Container(
              width: 100,
              child: SizedBox(
                child: Image.network(
                  bangGias[index].image,
                ),
              ),
            ),
            // subtitle: bangGias[index].image,

            // trailing: SizedBox(
            //   child: Column(
            //     children: [
            //       Wrap(
            //         spacing: 30,
            //         children: [
            //           Container(child: Text(bangGias[index].ten)),
            //           Container(child: Text(bangGias[index].gia)),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // trailing: SizedBox(
            //   width: 60,
            //   child: Row(
            //     children: [
            //       bangGias[index].ten,
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
