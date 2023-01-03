import 'package:appresponsive/screens/responsive/dimesion.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key, required this.mobileBody, required this.desktopBody})
      : super(key: key);

  final Widget mobileBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return mobileBody;
      }
      return desktopBody;
    }));
  }
}
