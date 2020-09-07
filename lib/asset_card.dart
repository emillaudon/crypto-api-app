import 'package:flutter/material.dart';

class AssetCard extends StatelessWidget {
  final Widget cardChild;

  AssetCard({this.cardChild}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue,
      ),
    );
  }
}
