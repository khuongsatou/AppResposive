import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key,
      required this.mobileScaffold,
      required this.tabletScaffold,
      required this.desktopScaffold})
      : super(key: key);
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth < 600) {
        // 500 mobile
        return mobileScaffold;
      }
      if (constraints.maxWidth < 1100) {
        return tabletScaffold;
      }
      return desktopScaffold;
    }));
  }
}