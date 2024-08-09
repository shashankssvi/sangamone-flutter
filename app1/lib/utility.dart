import 'package:audioplayers/audioplayers.dart';

class Utility1{
  static List<String> list1 = ["cat","cow","crow","sheep","Goat","dog","cuckoos","cock"];

  static var audio = AudioPlayer();
  static playaudio()async{
    await audio.play(AssetSource("cat1.mp3"));
  }

}