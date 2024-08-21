import 'package:app1/main.dart';
import 'package:app1/screen3.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

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
  List<String> list1 = ["cat.jpg", "cat.jpg", "cat.jpg", "cat.jpg"];
  var audio = AudioPlayer();
  playaudio() async {
    await audio.play(AssetSource("cat1.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Screen2 - Animals")),
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Screen1()));
          },
        ),
        actions: [
          InkWell(
            child: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Screen3()));
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: list1.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.center,
              child: InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/${list1[index]}"),
                    )),
                onTap: () async {
                  await playaudio();
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Screen3()));
        },
        child: const Text("Next"),
      ),
    );
  }
}
