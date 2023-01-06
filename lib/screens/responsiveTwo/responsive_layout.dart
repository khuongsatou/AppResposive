import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
    this.flatformMobileWidget,
  }) : super(key: key);
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;
  final FlatformMobileWidget? flatformMobileWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth < 600) {
        // Nếu là iPhone và nếu là Android sẽ thêm 1 giao diện
        if (flatformMobileWidget != null) {
          if (Theme.of(context).platform == TargetPlatform.iOS) {
            // 500 mobile
            return flatformMobileWidget!.iosScaffold;
          }
          // android and web
          return flatformMobileWidget!.androidScaffold;
        }
        return mobileScaffold;
      }
      if (constraints.maxWidth < 1100) {
        return tabletScaffold;
      }
      return desktopScaffold;
    }));
  }
}

class FlatformMobileWidget {
  final Widget iosScaffold;
  final Widget androidScaffold;

  FlatformMobileWidget(
      {required this.androidScaffold, required this.iosScaffold});
}
