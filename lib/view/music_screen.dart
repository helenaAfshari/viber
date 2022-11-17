

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/musicController/music_controller.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}
class _MusicScreenState extends State<MusicScreen>
    with SingleTickerProviderStateMixin {
   

  late AnimationController iconController; 
  bool isAnimated = false;

 SaveMusic saveMusic = Get.put(SaveMusic());
  @override
  void initState() {
    super.initState();
      
    iconController = AnimationController(
    vsync: this, duration: const Duration(milliseconds: 1000));

  saveMusic.addToLinkMusic();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 InkWell(child: const Icon(CupertinoIcons.backward_fill),onTap: (){
                   saveMusic.audioPlayer.seekBy(const Duration(seconds: -2));
                 },),
                  GestureDetector(
                    onTap: () {
                      AnimateIcon();
                    
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: iconController,
                      size: 50,
                      color: Color.fromARGB(255, 154, 32, 32),
                    ),
                  ),
                  InkWell(child: const Icon(CupertinoIcons.forward_fill,color: Colors.amber,),onTap: (){
                     saveMusic.audioPlayer.seekBy(const Duration(seconds: 200));
                     saveMusic.audioPlayer.seek(const Duration(seconds: 200));
                   saveMusic.audioPlayer.next();
                  },),
                ],
              ),
            ],
          ),
        ));
  }
  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;
     if(isAnimated)
       {
         iconController.forward();
          saveMusic.audioPlayer.play();
       }else{
       iconController.reverse();
       saveMusic.audioPlayer.pause();
     }
    });
  }

  @override
  void dispose() {
    iconController.dispose();
     saveMusic.audioPlayer.dispose();
    super.dispose();
  }
}








