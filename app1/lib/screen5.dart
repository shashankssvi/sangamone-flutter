import 'package:flutter/material.dart';
import 'chess1.dart';

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
  Map<int,dynamic> dict={
    0:"\u2656",1:"\u2658",2:"\u2657",3:"\u2654",4:"\u2655",5:"\u2657",6:"\u2658",7:"\u2656",
    8:"\u2659",9:"\u2659",10:"\u2659",11:"\u2659",12:"\u2659",13:"\u2659",14:"\u2659",15:"\u2659",
    48:"\u265F",49:"\u265F",50:"\u265F",51:"\u265F",52:"\u265F",53:"\u265F",54:"\u265F",55:"\u265F",
    56:"\u265C",57:"\u265E",58:"\u265D",59:"\u265A",60:"\u265B",61:"\u265D",62:"\u265E",63:"\u265C"
  };

  var list1 = Chess.list1[0];

  nextstep(a){
      var b = list1[a];
      setState(() {
        dict[b[0]]=dict[b[1]];
        dict[b[1]]=null;
      });
  }
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Screen5 - Chess Board")),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: 64,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8),
                itemBuilder: (context,index){
                  int row = index ~/ 8;
                  int col = index % 8;
                  List<int> list1 = [];
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      color: (row+col)%2==0?Colors.grey:Colors.white,
                      child: Center(
                          child: RichText(
                  text: TextSpan(style: TextStyle(color: Colors.black),
                  children: [TextSpan(text: "${index}\n",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10)),
                    TextSpan(text: dict[index]==null?null:"${dict[index]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                  ]
                  ),
                  ),
                      ),
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              child: Text("Next",style: TextStyle(color: Colors.blue,fontSize: 40,fontWeight: FontWeight.bold),),
              onPressed: (){
                setState(() {
                  count++;
                });
                nextstep(count);
              },
            ),
          )
        ],
      ),
    );
  }
}
