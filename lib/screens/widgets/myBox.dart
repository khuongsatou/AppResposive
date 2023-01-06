import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  MyBox({this.heightBox, this.widthBox});

  double? widthBox = 0.0;
  double? heightBox = 0.0;

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text("widthBox ${widthBox} x heightBox ${heightBox}"),
      ),
    );
  }
}
