import 'package:app1/main.dart';
import 'package:app1/screen5.dart';
import 'package:app1/utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Richtext1(),
    );
  }
}

class Richtext1 extends StatefulWidget {
  const Richtext1({super.key});

  @override
  State<Richtext1> createState() => _Richtext1State();
}

class _Richtext1State extends State<Richtext1> {
  bool a = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Screen4 - Cat")),
        actions: [
          InkWell(
            child: const Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Screen5()));
            },
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "${Utility1.list1[0]}\n",style: const TextStyle(fontSize: 40),recognizer: TapGestureRecognizer()..onTap=(){
                    setState(() {
                      a==true?a=false:a=true;
                    });
                  }),
                ],style: const TextStyle(color: Colors.black,),
              ),
            ),
            a?Container(
              child: InkWell(child: Image.asset("assets/cat.jpg"),onTap: (){
                Utility1.playaudio();
              },),
            ):Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.home),
          onPressed: ()=>
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Screen1()))),
    );
  }
}
