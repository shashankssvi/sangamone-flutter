import 'package:app1/screen8.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: System1(),
    );
  }
}

class System1 extends StatefulWidget {
  const System1({super.key});

  @override
  State<System1> createState() => _System1State();
}

class _System1State extends State<System1> {

  late Future<dynamic> map1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    map1 = getdeviceinfo();
  }
  getdeviceinfo() async{
    var device1 = await DeviceInfoPlugin().androidInfo;
    var info1 = device1.data;
    return info1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("System parameters"),
        actions: [
          InkWell(
            child: const Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sysparam()));
            },
          )
        ],
      ),
      body: Container(
        child: FutureBuilder(future: map1, builder: (context,snapshot){

          if (snapshot.connectionState==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          else if (snapshot.hasError){
            return Text("${snapshot.error}");
          }
          else if (snapshot.hasData){
            Map<dynamic,dynamic> data = snapshot.data;
            List<dynamic> a=data.keys.toList();
            return ListView.builder(itemCount: a.length,itemBuilder: (context,index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${a[index]} : ${data[a[index]]}"),
                ),
              );
            });
          }
          else{
            return const Text("no data found");
          }
        }),
      ),
    );
  }
}
