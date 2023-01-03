import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  _DesktopBodyState createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  _DesktopBodyState();

  ScrollController? scrollController = ScrollController();

  double? heightScroll = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          heightScroll = scrollController!.position.maxScrollExtent;
        });
      }

      print(scrollController!.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text("D E S K T O P"),
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return SingleChildScrollView(
          controller: scrollController,
          physics: const ScrollPhysics(),
          child: Row(
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  width: currentWidth,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 250,
                            width: double.infinity,
                            child: const SizedBox.shrink(),
                            color: Colors.purple[800]),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 18,
                        itemBuilder: ((context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 100,
                                  color: Colors.deepPurple[300],
                                  height: 120));
                        }),
                      )
                    ],
                  ),
                ),
              ),
              // Flexible(
              //   flex: 1,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Container(
              //           padding: EdgeInsets.all(8.0),
              //           width: double.infinity,
              //           height: heightScroll,
              //           child: const SizedBox.shrink(),
              //           color: Colors.purple[800]),
              //     ],
              //   ),
              // ),
              Flexible(
                child: ConstrainedBox(
                  constraints: constraints.copyWith(
                      minHeight: constraints.maxHeight,
                      maxHeight: double.infinity),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          width: double.infinity,
                          height: heightScroll! + constraints.maxHeight - 16,
                          child: const SizedBox.shrink(),
                          color: Colors.purple[800]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
