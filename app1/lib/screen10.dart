import 'package:app1/screen11.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class Screen10 extends StatelessWidget {
  const Screen10({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Latlong(),
    );
  }
}

class Latlong extends StatefulWidget {
  const Latlong({super.key});

  @override
  State<Latlong> createState() => _LatlongState();
}

class _LatlongState extends State<Latlong> {

  @override
  void initState() {
    // TODO: implement initState
    getlocation();
    super.initState();
  }

  getlocation() async{
    Geolocator.requestPermission();
    Position loc1 = await Geolocator.getCurrentPosition();
    print(loc1);
    return loc1;
  }

  launch1()async{
    Position data1 =await getlocation();
    print("https://www.google.co.in/maps/@${data1.latitude},${data1.longitude},10.77z?entry=ttu");
    var url = Uri.parse("https://www.google.co.in/maps/@${data1.latitude},${data1.longitude},10.77z?entry=ttu&g_ep=EgoyMDI0MDkxMS4wIKXMDSoASAFQAw%3D%3D");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen10 - LatLong"),
          actions: [
      InkWell(
      child: const Icon(Icons.arrow_forward),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Camara1()));
      },
    ),
    ]),
      body: FutureBuilder(future: getlocation(),builder: (context,AsyncSnapshot<dynamic> snapshot){
        if (snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        else if(snapshot.hasData){
          var data = snapshot.data;
          return Column(
            children: [
              Text("Latitude : ${data!.latitude} \nLongitude : ${data.longitude} \nAltitude : ${data.altitude} \nSpeed : ${data.speed} \nDirection : ${data.heading}"),
              ElevatedButton(onPressed: (){
                launch1();
              }, child: Text("location")),
            ],
          );
        }
        else{
          return const Text("no data");
        }
      },),
    );
  }
}