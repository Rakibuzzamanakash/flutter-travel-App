import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HowToUseScreen extends StatelessWidget {

  videoView(data) {
    return AspectRatio(
      aspectRatio: 1,
      child: BetterPlayer.network(
        data['url'],
        // ignore: prefer_const_constructors
        betterPlayerConfiguration: BetterPlayerConfiguration(
          aspectRatio: 1,
          autoPlay: false,
          placeholderOnTop: true,
          showPlaceholderUntilPlay: false,
          fit: BoxFit.contain,
          controlsConfiguration: const BetterPlayerControlsConfiguration(
            showControls: true,
            showControlsOnInitialize: false,
            enableSkips: false,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How to use"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('how-to-use-video').doc('11100').snapshots() ,
          builder: (context,snapshot){
            var data = snapshot.data;

            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasError){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return videoView(data);
            }
          }
      ),

    );
  }
}