import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/consts/colors.dart';
import 'package:music_player/consts/text_style.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red),
              alignment: Alignment.center,
              child: const Icon(Icons.music_note),
            )),
            SizedBox(
              height: 12,
            ),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16))
                  ),
                  child: Column(
                    children: [
                      Text("Music Name", style: ourStyle(
                        color: bgDarkColor,
                        family: bold,
                        size: 20,
                      )),
                      SizedBox(
                        height: 12,
                      ),
                      Text("Artist Name", style: ourStyle(
                        color: bgDarkColor,
                        family: regular,
                        size: 18,
                      ),),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text("0:0", style: ourStyle(
                            color: bgDarkColor
                          ),),
                          Expanded(child: Slider(
                              thumbColor: sliderColor,
                              inactiveColor: bgDarkColor,
                              activeColor: sliderColor,
                              value: 0.0, onChanged: (newValue){}),),
                          Text("04:0",style: ourStyle(
                            color: bgDarkColor
                          ),)
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous_rounded,color: bgDarkColor,size: 30,)),
                          CircleAvatar(
                            radius: 25,
                              backgroundColor: bgDarkColor,
                              child: Transform.scale(
                            scale: 2.0,
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow_rounded, color: Colors.white,)))),
                          IconButton(onPressed: (){}, icon: Icon(Icons.skip_next_rounded, color: bgDarkColor,size: 30,)),
                        ],
                      )
                    ],
                  ),
            )),
          ],
        ),
      ),
    );
  }
}
