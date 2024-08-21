import 'package:app1/main.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Details1(),
    );
  }
}

class Details1 extends StatefulWidget {
  const Details1({super.key});

  @override
  State<Details1> createState() => _Details1State();
}

class _Details1State extends State<Details1> {

  getdetails()async{
    final deviceinfo =await DeviceInfoPlugin().androidInfo;
    print(deviceinfo.data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen1()));
            },
          )
        ],
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
