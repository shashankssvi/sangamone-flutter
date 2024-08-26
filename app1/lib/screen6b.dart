import 'package:app1/main.dart';
import 'package:app1/screen7.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Screen6b extends StatelessWidget {
  const Screen6b({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    int a, b, c;
      for (int i = 0; i <= 255 ~/ 17; i++) {
        a = i*17;
        b = 0;
        c = 0;
        list1.add([a, b, c]);
//     print("${a},${b},${c}");
      }
    for (int i = 0; i <= 255 ~/ 17; i++) {
      a = 0;
      b = i*17;
      c = 0;
      list1.add([a, b, c]);
//     print("${a},${b},${c}");
    }
    for (int i = 0; i <= 255 ~/ 17; i++) {
      a = 0;
      b = 0;
      c = i*17;
      list1.add([a, b, c]);
//     print("${a},${b},${c}");
    }
      for (int i = 0; i <= 255 ~/ 17; i++) {
        a = 0;
        b = i * 17;
        c = i*17;
        list1.add([a, b, c]);
//     print("${a},${b},${c}");
      }
      for (int i = 0; i <= 255 ~/ 17; i++) {
        a = i*17;
        b = 0;
        c = i * 17;
        list1.add([a, b, c]);
//     print("${a},${b},${c}");
      }
    for (int i = 0; i <= 255 ~/ 17; i++) {
      a = i*17;
      b = i*17;
      c = 0;
      list1.add([a, b, c]);
//     print("${a},${b},${c}");
    }
    for (int i = 0; i <= 255 ~/ 17; i++) {
      a = i*17;
      b = i*17;
      c = i * 17;
      list1.add([a, b, c]);
//     print("${a},${b},${c}");
    }
  }

  static List<List<dynamic>> list1=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>System1()));
            },
          )
        ],
      ),
      body: ListView.builder(itemCount: list1.length,itemBuilder: (context,index){
        var a = list1[index];
        return Padding(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            child: Container(
              height: 10,
              color: Color.fromRGBO(a[0], a[1], a[2], 1),
            ),
            onTap: (){
              getdetails();
            },
            onHover: (onhover){
              setState(() {
                if (onhover){
                  print(list1[index]);
                }
              });

            }
          ),
        );
      },
      ),
    );
  }
}
