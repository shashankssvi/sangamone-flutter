import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
    const Screen1({super.key});
    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen1(),
      );
    }
}
class Demo1 extends StatefulWidget {
    const Demo1({super.key});

    @override
    State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
    
            List<String> imgname = ['dog', 'cat', 'cow'];
            List<String> imgs = ['dog.jpg', 'cat.jpg', 'cow.jpg'];
            
    @override
    Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Screen2 - Animals")),
        leading: InkWell(
            child: const Icon(Icons.arrow_back),
            onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const Demo1()));
            },
        ),
        actions: [
            InkWell(
                child: const Icon(Icons.arrow_forward),
                onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const Demo1()));
            },
                ),
            ],
        ),
      body:ListView.builder(
          itemCount: imgs.length,
          itemBuilder: (context, index) {
            return const Text('hellow');
          })
      ,
      );
    }
}