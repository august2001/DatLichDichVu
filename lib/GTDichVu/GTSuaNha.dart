import 'package:chothuenhancong/datlich.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GioiThieuSuaNha extends StatefulWidget {
  const GioiThieuSuaNha({super.key});

  @override
  State<GioiThieuSuaNha> createState() => _GioiThieuSuaNhaState();
}

class _GioiThieuSuaNhaState extends State<GioiThieuSuaNha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '- Thợ sửa các thiết bị như máy lạnh, tủ lạnh, máy giặt. Chuyên cung cấp các dịch vụ  vệ sinh liên quan đến máy lạnh, máy điều hòa, thi công lắp đặt xử lý sự cố xảy ra trên hệ thống. ',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                  height: 300, width: 400, image: AssetImage('hinh/anh2.jpg')),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  '- Với đội ngũ chuyên nghiệp chúng tôi sẽ đáp ứng mọi nhu cầu của quý khách. Những hư hỏng thường gặp như ở máy lạnh: máy nén chạy và dừng liên tục do quá tải, quạt dàn nóng lạnh không chạy, áp suất hút cao hoặc thấp.',
                  style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  '- Những hư hỏng thường gặp như ở máy lạnh: máy nén chạy và dừng liên tục do quá tải, quạt dàn nóng lạnh không chạy, áp suất hút cao hoặc thấp.',
                  style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 25, 154, 20),
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DatLich()));
                  },
                  child: const Text(
                    "Đặt lịch ngay",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
