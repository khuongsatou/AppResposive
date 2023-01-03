import 'package:flutter/material.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text("M O B I LE"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                  height: 250,
                  width: double.infinity,
                  child: const SizedBox.shrink(),
                  color: Colors.purple[800]),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: ((context, index) {
                return Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Container(color: Colors.deepPurple[300], height: 120));
              }),
            ),
          )
        ],
      ),
    );
  }
}
