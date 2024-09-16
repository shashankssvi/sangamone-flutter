import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Screen11 extends StatelessWidget {
  const Screen11({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Camara1(),
    );
  }
}

class Camara1 extends StatefulWidget {
  const Camara1({super.key});

  @override
  State<Camara1> createState() => _Camara1State();
}

class _Camara1State extends State<Camara1> {

  CameraController? _cameraController;
  List<CameraDescription>? camaras;
  @override
  void initState() {
    // TODO: implement initState
    setcamara1();
    super.initState();
  }
  setcamara1()async{
    await Permission.camera.request();
    camaras = await availableCameras();
    _cameraController = CameraController(camaras![0], ResolutionPreset.high);
    _cameraController?.initialize();
    setState(() {
    });
  }


  ontourch()async{
    _cameraController?.setFlashMode(FlashMode.torch);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cameraController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen11 - Camara"),
      ),
      body: Column(
        children: [
          Container(
              child: CameraPreview(_cameraController!))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>ontourch(),child: Icon(Icons.flash_on),),
    );
  }
}
