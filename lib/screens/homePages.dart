import 'package:appresponsive/screens/responsive/desktop_body.dart';
import 'package:appresponsive/screens/responsive/mobile_body.dart';
import 'package:appresponsive/screens/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor:
            currentWidth < 600 ? Colors.deepPurple[600] : Colors.green[300],
        // body: Center(
        //   child: Text("${currentWidth}"),
        // ),
        body: ResponsiveLayout(
            mobileBody: MobileBody(), desktopBody: DesktopBody()));
    // return ResponsiveLayout(
    //     mobileBody: MobileBody(), desktopBody: DesktopBody());
  }
}
