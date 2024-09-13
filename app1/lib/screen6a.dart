import 'package:app1/screen6b.dart';
import 'package:flutter/material.dart';

class Screen6a extends StatelessWidget {
  const Screen6a({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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

  /*static List<int> color1 = [0,15,31,63,127,255];*/
  //static List<int> color1 = [0,7,15,23,31,47,63,95,127,191,255];
  static List<int> color1 = [0,7,15,23,28,31,47,63,95,127,191,255];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Colors"),
        actions: [
          InkWell(
            child: const Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Details1()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: color1.length),itemCount: color1.length, itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromRGBO(0,0, color1[index], 1),
                ),
              );
            }),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: color1.length),itemCount: color1.length, itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromRGBO(0, color1[index],0, 1),
                ),
              );
            }),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  color1.length),itemCount: color1.length, itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromRGBO(color1[index],0,0, 1),
                ),
              );
            }),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  color1.length),itemCount: color1.length, itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromRGBO(0, color1[index],color1[index], 1),
                ),
              );
            }),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  color1.length),itemCount: color1.length, itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromRGBO(color1[index],color1[index],0, 1),
                ),
              );
            }),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  color1.length),itemCount: color1.length, itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromRGBO(color1[index],0,color1[index], 1),
                ),
              );
            }),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  color1.length),itemCount: color1.length, itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromRGBO(color1[index],color1[index],color1[index], 1),
                ),
              );
            }),
          ),
        ],
      )
    );
  }
}
