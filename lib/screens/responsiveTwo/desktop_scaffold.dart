import 'package:appresponsive/screens/constraints.dart';
import 'package:appresponsive/screens/widgets/myBox.dart';
import 'package:appresponsive/screens/widgets/myTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  _DesktopScaffoldState createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  ScrollController _scrollController = ScrollController();
  double heightScroll = 0.0;

  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
    //   if (mounted) {
    //     setState(() {
    //       heightScroll = _scrollController
    //           .position.maxScrollExtent; // chỉ nội dung chứa scroll
    //     });
    //   }
    // });
    Future.delayed(Duration.zero, () {
      if (mounted) {
        setState(() {
          // heightScroll = _scrollController
          //     .position.maxScrollExtent; // chỉ nội dung chứa scroll
          heightScroll = _scrollController.position.extentAfter;
        });
      }
    });

    _scrollController.addListener(() {
      // _scrollController.position.extentAfter;
      // print(heightScroll);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    // print("heightScroll ${heightScroll}");
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[800]),
      backgroundColor: Colors.grey[300],
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const ScrollPhysics(),
          controller: _scrollController,
          child: Container(
            height: (sizeScreen.height * 0.2) * 10 +
                sizeScreen.height * 0.25 +
                105 +
                8,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: sizeScreen.width * 0.2,
                    child: myDrawer,
                    height: (sizeScreen.height * 0.2) * 10 +
                        sizeScreen.height * 0.25,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: (sizeScreen.height * 0.2) * 10 +
                        sizeScreen.height * 0.25,
                    width: sizeScreen.width * 0.8,
                    // color: Colors.red,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Container(
                                    // color: Colors.yellow,
                                    // width: sizeScreen.width * 0.5,
                                    height: double.infinity,
                                    child: GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          childAspectRatio:
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      0.4),
                                        ),
                                        itemCount: 4,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: LayoutBuilder(builder:
                                                (context,
                                                    BoxConstraints
                                                        constraints) {
                                              return Container(
                                                width: 100,
                                                height: double.infinity,
                                                color: Colors.blue,
                                                child: Center(
                                                    child: Text(
                                                        "${100} x ${double.infinity} ")),
                                              );
                                            }),
                                          );
                                        }),
                                  ),
                                ),
                              ),
                              Container(
                                // color: Colors.red,
                                width: sizeScreen.width * 0.5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ListView.builder(
                                      itemCount: 10,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: ((context, index) {
                                        return Container(child: const MyTile());
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: 8, right: 8, left: 8),
                                    // margin: const EdgeInsets.only(
                                    //     right: 8.0, top: 8.0, bottom: 8.0),
                                    width: double.infinity,
                                    child: Center(
                                      child: Text(
                                          "maxWidth ${constraints.maxWidth} x maxHeight ${constraints.maxHeight}"),
                                    ),
                                    color: Colors.purple[800]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
