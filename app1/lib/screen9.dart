import 'package:app1/screen10.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class Screen9 extends StatelessWidget {
  const Screen9({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
    final getalb = await PhotoManager.getAssetPathList(type: RequestType.image,hasAll: true,onlyAll: true);
    final album1 = getalb.last;
    final album2 = await album1.getAssetListPaged(page: 0, size: 1000);
    setState(() {
      list1=album2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen9 - Image photo"),
        actions: [
          InkWell(
            child: const Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Latlong()));
            },
          )
        ],
      ),
      body: list1.isEmpty?const Center(child: CircularProgressIndicator()):
          ListView.builder(itemCount: list1.length, itemBuilder: (context,index){
        return FutureBuilder(future: list1[index].thumbnailData, builder: (context,snapshot){
          if (snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }
          else if(snapshot.hasData){
            var data = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: ListTile(
                    title: Text("${list1[index].title}\n ${list1[index].size}\n ${DateFormat("yyyy-MM-dd HH:mm").format(list1[index].createDateTime)}"),
                    subtitle: Text("${index+1}"),
                    leading: Image.memory(data!,fit: BoxFit.fill,),
                  )
              ),
            );
          }
          else {
            return const Text("data");
          }
        });
        }),
    );
  }
}
