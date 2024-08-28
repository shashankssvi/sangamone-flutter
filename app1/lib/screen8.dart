import 'package:flutter/material.dart';

class Screen8 extends StatelessWidget {
  const Screen8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        title: Text("Screen8 - System"),
      ),
      body: ListView.builder(shrinkWrap: true,itemCount: list1.length,itemBuilder: (context,index){
        return Card(
            child: ExpansionTile(title: Text(list1[index]),
            children: [
              ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: 10,itemBuilder: (context,ind){
                return Card(child: ListTile(
                  title: Text("Aug 8"),
                  leading: CircleAvatar(child: Text("${ind}"),),
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
