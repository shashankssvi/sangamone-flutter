import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class Screen9 extends StatelessWidget {
  const Screen9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Imghistory(),
    );
  }
}

class Imghistory extends StatefulWidget {
  const Imghistory({super.key});

  @override
  State<Imghistory> createState() => _ImghistoryState();
}

class _ImghistoryState extends State<Imghistory> {

  List<AssetEntity> list1 = [];

  @override
  void initState() {
    getpermision();
    getimages();
    super.initState();
  }

  getpermision() async{
    await Permission.photos.request();
  }

  getimages() async{
    final getalb = await PhotoManager.getAssetPathList(type: RequestType.image,hasAll: true);
    final album1 = getalb.first;
    final album2 = await album1.getAssetListPaged(page: 0, size: 100);
    setState(() {
      list1=album2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen9 - Image photo"),
      ),
      body: list1.isEmpty?Center(child: CircularProgressIndicator()):
          GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),itemCount: list1.length, itemBuilder: (context,index){
        return FutureBuilder(future: list1[index].thumbnailData, builder: (context,snapshot){
          if (snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }
          else if(snapshot.hasData){
            var data = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.memory(data!,fit: BoxFit.fill,),
            );
          }
          else {
            return Text("data");
          }
        });
        }),
    );
  }
}
