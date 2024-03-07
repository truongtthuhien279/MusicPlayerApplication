import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_player/consts/colors.dart';
import 'package:music_player/consts/text_style.dart';
import 'package:music_player/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  final SongModel data;

  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<PlayerController>();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,),
              alignment: Alignment.center,
              child: QueryArtworkWidget(id: data.id, type: ArtworkType.AUDIO, artworkHeight: double.infinity, artworkWidth: double.infinity,),
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
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16))),
              child: Column(
                children: [
                  Text(data.displayNameWOExt,
                      style: ourStyle(
                        color: bgDarkColor,
                        family: bold,
                        size: 20,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    data.artist.toString(),
                    style: ourStyle(
                      color: bgDarkColor,
                      family: regular,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Obx( ()=>
                     Row(
                      children: [
                        Text(
                          controller.positon.value,
                          style: ourStyle(color: bgDarkColor),
                        ),
                        Expanded(
                          child: Slider(
                              thumbColor: sliderColor,
                              inactiveColor: bgDarkColor,
                              activeColor: sliderColor,
                              min: const Duration(seconds: 0).inSeconds.toDouble(),
                              max: controller.max.value,
                              value: controller.value.value,
                              onChanged: (newValue) {
                                controller.changeDurationToSeconds(newValue.toInt());
                                newValue = newValue;
                              },),
                        ),
                        Text(
                          controller.duration.value,
                          style: ourStyle(color: bgDarkColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_previous_rounded,
                            color: bgDarkColor,
                            size: 30,
                          )),
                      Obx( ()=>
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: bgDarkColor,
                            child: Transform.scale(
                                scale: 2.0,
                                child: IconButton(
                                    onPressed: () {
                                      if(controller.isPlaying.value) {
                                        controller.audioPlayer.pause();
                                        controller.isPlaying(false);
                                      } else {
                                        controller.audioPlayer.play();
                                        controller.isPlaying(true);
                                      }

                                    },
                                    icon: controller.isPlaying.value ?
                                    Icon(
                                      Icons.pause,
                                      color: Colors.white,
                                    ):
                                    Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                    )))),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_next_rounded,
                            color: bgDarkColor,
                            size: 30,
                          )),
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
