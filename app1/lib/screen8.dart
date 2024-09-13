import 'package:app1/screen9.dart';
import 'package:flutter/material.dart';

class Screen8 extends StatelessWidget {
  const Screen8({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sysparam(),
    );
  }
}

class Sysparam extends StatefulWidget {
  const Sysparam({super.key});

  @override
  State<Sysparam> createState() => _SysparamState();
}

class _SysparamState extends State<Sysparam> {

  List<String> list1 = ["incoming calls","outgoing calls","incoming SMS","outgoing SMS"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen8 - System"),
        actions: [
          InkWell(
            child: const Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Imghistory()));
            },
          )
        ],
      ),
      body: ListView.builder(shrinkWrap: true,itemCount: list1.length,itemBuilder: (context,index){
        return Card(
            child: ExpansionTile(title: Text(list1[index]),
            children: [
              ListView.builder(physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: 10,itemBuilder: (context,ind){
                return Card(child: ListTile(
                  title: const Text("Aug 8"),
                  leading: CircleAvatar(child: Text("${ind+1}"),),
                )
                );
              })
            ],
            ),
        );
      }),
    );
  }
}
