import 'package:chothuenhancong/GTDichVu/BangGiaDienTu.dart';
import 'package:chothuenhancong/GTDichVu/GTDienTu.dart';
import 'package:chothuenhancong/datlich.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class DienTu extends StatefulWidget {
  const DienTu({super.key});

  @override
  State<DienTu> createState() => _DienTuState();
}

class _DienTuState extends State<DienTu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final loginButon = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {},
        child: const Text(
          "Đặt lịch ngay",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ĐIỆN TỬ",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 31, 175, 67),
          // elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.red),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          bottom: const TabBar(
            labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: 'Giới thiệu',
              ),
              Tab(
                text: 'Bảng giá',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [GioiThieuDienTu(), BangGiaDienTu()],
          // children: [
          //   Material(
          //     elevation: 5,
          //     borderRadius: BorderRadius.circular(30),
          //     color: Colors.redAccent,
          //     child: MaterialButton(
          //       padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          //       onPressed: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => DatLich()));
          //       },
          //       child: const Text(
          //         "Đặt lịch ngay",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: 20,
          //             color: Colors.white,
          //             fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ),
          // ],
        ),
      ),
    );
  }
}
