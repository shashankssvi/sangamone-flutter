import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen10 - LatLong"),
      ),
      body: FutureBuilder(future: getlocation(),builder: (context,AsyncSnapshot<dynamic> snapshot){
        if (snapshot.connectionState==ConnectionState.waiting){
          return Center(
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
          return Text("Latitude : ${data!.latitude} \nLongitude : ${data.longitude} \nAltitude : ${data.altitude} \nSpeed : ${data.speed} \nDirection : ${data.heading}");
        }
        else{
          return Text("no data");
        }
      },),
    );
  }
}
