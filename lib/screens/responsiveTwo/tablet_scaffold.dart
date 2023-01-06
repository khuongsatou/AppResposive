import 'package:appresponsive/screens/constraints.dart';
import 'package:appresponsive/screens/widgets/myBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../widgets/myTile.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  _TabletScaffoldState createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  ScrollController _scrollController = ScrollController();
  double heightScroll = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (mounted) {
        setState(() {
          heightScroll = _scrollController.position.maxScrollExtent;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[800]),
      backgroundColor: Colors.grey[300],
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const ScrollPhysics(),
          controller: _scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: sizeScreen.width / 4,
                width: sizeScreen.width,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MyBox(),
                      );
                    }),
              ),
              Container(
                // height: constraints.maxHeight + heightScroll,
                height: 10 * (sizeScreen.height * 0.4),
                child: ListView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MyTile(),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      }),
      drawer: myDrawer,
    );
  }
}
