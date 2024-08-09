import 'package:app1/screen2.dart';
import 'package:app1/screen4.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:GridView1(),
    );
  }
}



class GridView1 extends StatefulWidget {
  const GridView1({super.key});

  @override
  State<GridView1> createState() => _GridView1State();
}

class _GridView1State extends State<GridView1> {

  List<String> list1= ["cat.jpg","cat.jpg","cat.jpg","cat.jpg","cat.jpg","cat.jpg","cat.jpg","cat.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Screen3 - Animals")),
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2()));
          },
        ),
        actions: [
          InkWell(
            child: const Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Richtext1()));
            },
          )
        ],
      ),
      body: Container(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,mainAxisSpacing: 12),
              itemCount: list1.length,
              itemBuilder: (context,index){
            return Image.asset("assets/${list1[index]}");
          })
      ),
    );
  }
}
