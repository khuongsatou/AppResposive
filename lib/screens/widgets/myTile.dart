import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  const MyTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: sizeScreen.height * 0.2,
      child: Center(
        child: Text(" ${double.infinity} x ${sizeScreen.height * 0.2}"),
      ),
    );
  }
}
