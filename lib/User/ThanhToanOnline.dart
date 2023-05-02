import 'package:chothuenhancong/User/Home.dart';
import 'package:chothuenhancong/datlich.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:clipboard/clipboard.dart';

class ThanhToanMomo extends StatefulWidget {
  const ThanhToanMomo({super.key});

  @override
  State<ThanhToanMomo> createState() => _ThanhToanMomoState();
}

class _ThanhToanMomoState extends State<ThanhToanMomo> {
  String text = "0916378900";
  Widget PhoneCopy() => Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(
              Icons.content_copy,
            ),
            onPressed: () async {
              await FlutterClipboard.copy(text);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Color.fromARGB(255, 106, 102, 102),
                  content: Text(
                    "✔ Đã copy số điện thoại 0916378900",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )));
            },
          ),
          SizedBox(
            height: 20,
            width: 20,
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(30, 148, 43, 1),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "THANH TOÁN",
            style: TextStyle(color: Color.fromARGB(255, 249, 249, 249)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 240, 240, 240)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //   Container(
                //    color: Color.fromARGB(255, 46, 115, 51),

                //   color: Color.fromARGB(255, 46, 115, 51),
                //      height: 200,
                Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 31, 95, 37),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              height: 20,
                              width: 20,
                            ),
                            Text(
                              "Momo",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PhoneCopy(),
                        // Row(
                        //   children: const [
                        //     SizedBox(
                        //       width: 20,
                        //     ),
                        //     Text(
                        //       "0916378900",
                        //       style: TextStyle(
                        //           fontSize: 40,
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.white),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Row(
                          children: const [
                            SizedBox(
                              height: 20,
                              width: 20,
                            ),
                            Text(
                              "✔ Chủ tài khoản: Huỳnh Văn Tuấn",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              height: 20,
                              width: 20,
                            ),
                            Text(
                              "✔ Thanh toán dễ dàng, tiện lợi mọi lúc mọi nơi",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              height: 20,
                              width: 20,
                            ),
                            Text(
                              "✔ Nội dung thanh toán hợp lệ: 'Mã số thợ'+'Số phiếu thu'. ",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              height: 20,
                              width: 20,
                            ),
                            Text(
                              "✔ Quý khách vui lòng chụp lại hóa đơn sau khi thanh toán.",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    )),
                //   )
              ],
            ),
          ),
        ));
  }
}
