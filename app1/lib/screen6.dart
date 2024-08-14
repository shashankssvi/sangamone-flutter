import 'package:flutter/material.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Colors1(),
    );
  }
}

class Colors1 extends StatefulWidget {
  const Colors1({super.key});

  @override
  State<Colors1> createState() => _Colors1State();
}

class _Colors1State extends State<Colors1> {

  static List<int> list1 = [255,128,64,8];
  int dd = list1.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Colors"),
      ),
      body: ListView(
        children: [
          DropdownButton(
              items: list1.map<DropdownMenuItem<int>>((int value){
           return DropdownMenuItem(child: Text("${value}"),value: value,);
          }).toList(), onChanged: (value){
            setState(() {
              value=value;
              dd=value!;
            });
          }),
          Container(
            width: 200,
            height: 800,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),itemCount: dd, itemBuilder:(context,index){
              return Container(
                color: Color.fromRGBO((index*4)%dd, (index*16)%dd, (index*25)%dd, 1),
              );
            }),
          )
        ],
      )
    );
  }
}
