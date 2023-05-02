import 'package:chothuenhancong/User/Home.dart';
import 'package:chothuenhancong/datlich.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Lienhe extends StatefulWidget {
  const Lienhe({super.key});

  @override
  State<Lienhe> createState() => _LienheState();
}

class _LienheState extends State<Lienhe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(14, 100, 34, 1),
          centerTitle: true,
          title: Text("LIÊN HỆ"),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'THÔNG TIN LIÊN HỆ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                        child: Text(
                      "CÔNG TY TNHN LTD",
                      style: TextStyle(fontSize: 20),
                    ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.location_city,
                      size: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                        child: Text(
                      "540 Cách Mạng Tháng 8, Phường 11, Quận 3, TP HCM",
                      style: TextStyle(fontSize: 20),
                    ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.atm_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                        child: Text(
                      "123-1112-21234 Tại Ngân Hàng Nông Nghiệp và Phát Triển Nông Thôn Việt Nam - Chi Nhánh ",
                      style: TextStyle(fontSize: 20),
                    ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.phone,
                      size: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Text(
                        "Quản lí: 0916378900, 0926312533 ",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 70,
                    ),
                    Expanded(
                        child: Text(
                      "---------------------OR-------------------",
                      style: TextStyle(fontSize: 20),
                    ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.facebook,
                      size: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
