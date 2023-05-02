import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QuetMaQR extends StatefulWidget {
  const QuetMaQR({super.key});

  @override
  State<QuetMaQR> createState() => _QuetMaQRState();
}

class _QuetMaQRState extends State<QuetMaQR> {
  MobileScannerController cameraController = MobileScannerController();
  bool scrennOpened = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR"),
      ),
      body: MobileScanner(
        allowDuplicates: true,
        controller: cameraController,
        onDetect: foundBarcode,
      ),
    );
  }

  void foundBarcode(Barcode barcode, MobileScannerArguments? args) {
    if (!scrennOpened) {
      final String code = barcode.rawValue ?? "---";
      debugPrint("Barcode found: $code");
      scrennOpened = true;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FoundCodeScreen(screenClosed: screenWasClosed, value: code),
          ));
    }
  }

  void screenWasClosed() {
    scrennOpened = false;
  }
}

class FoundCodeScreen extends StatefulWidget {
  final String value;
  final Function() screenClosed;
  const FoundCodeScreen(
      {super.key, required this.value, required this.screenClosed});

  @override
  State<FoundCodeScreen> createState() => _FoundCodeScreenState();
}

class _FoundCodeScreenState extends State<FoundCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin"),
        leading: IconButton(
          onPressed: () {
            widget.screenClosed();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text("Quet Qr"),
              // SizedBox(
              //   height: 20,
              // ),
              Image.network(widget.value),
            ],
          ),
        ),
      ),
    );
  }
}
