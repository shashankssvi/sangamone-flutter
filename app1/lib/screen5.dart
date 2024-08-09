import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Chess1(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class Chess1 extends StatefulWidget {
  const Chess1({super.key});

  @override
  State<Chess1> createState() => _Chess1State();
}

class _Chess1State extends State<Chess1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Screen5 - Chess Board")),
      ),
      body: GridView.builder(
          itemCount: 64,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          itemBuilder: (context,index){
            int row = index ~/ 8;
            int col = index % 8;
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                color: (row+col)%2==0?Colors.grey:Colors.white,
              ),
            );
          }),
    );
  }
}
