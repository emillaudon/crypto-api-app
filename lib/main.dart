import 'package:flutter/material.dart';
import 'package:crypto_api_test/CryptoBoard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CryptoBoard(),
    );
  }
}
