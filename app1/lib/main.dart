import 'package:app1/screen2.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main(){
  runApp(const Screen1());
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Audioplay(),
    );
  }
}

class Audioplay extends StatefulWidget {
  const Audioplay({super.key});
  @override
  State<Audioplay> createState() => _AudioplayState();
}

class _AudioplayState extends State<Audioplay> {
  var audio = AudioPlayer();
  playaudio()async{
    await audio.play(AssetSource("cat1.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(
          child: Text("Screen1 - cat"),
        ),
      ),
      body: ListView(
        children: [
          Align(
            alignment:Alignment.center,
            child: InkWell(
              child: Image.asset("assets/cat.jpg"),
              onTap: () async{
                await playaudio();
              },
            ),
          ),
          Align(
            alignment:Alignment.center,
            child: InkWell(
              child: Image.asset("assets/cat.jpg"),
              onTap: () async{
                await playaudio();
              },
            ),
          ),
          Align(
            alignment:Alignment.center,
            child: InkWell(
              child: Image.asset("assets/cat.jpg"),
              onTap: () async{
                await playaudio();
              },
            ),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Screen2()));
            },
            child: const Text("Next",style: TextStyle(color: Colors.blue),),
          ),
        ],
      ),
    );
  }
}
