import 'package:flutter/material.dart';

class DefaultIconBack extends StatelessWidget {

double left;
double top;

  DefaultIconBack({
    required this.left,
    required this.top
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 45, top: 135),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 35, color: Colors.white)),
    );
  }
}