import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class youtube extends StatefulWidget {
  var adres;
  youtube(String adress){
    adres=adress;
  }
  @override
  _youtubeState createState() => _youtubeState(adres);
}

class _youtubeState extends State<youtube> {
  var adres;
  _youtubeState(String adress){
    adres=adress;
  }
  @override
  Widget build(BuildContext context) {
    if(adres!=''){
    return YoutubePlayer(
      controller: YoutubePlayerController(
      initialVideoId: adres, //Add videoID.
      flags: YoutubePlayerFlags(
        hideControls: false,
        controlsVisibleAtStart: true,
        autoPlay: false,
        mute: false,
      ),
    ),

    );}
    else{
      return SizedBox.shrink();
    }
  }
}
