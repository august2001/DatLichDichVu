import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class ThanhToan extends StatelessWidget {
  const ThanhToan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tao Thanh Toan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Card Form'),
              const SizedBox(height: 20),
              CardFormField(
                controller: CardFormEditController(),
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {}, child: Text('Thanh Toán'))
            ],
          ),
        ),
      ),
    );
  }
}
