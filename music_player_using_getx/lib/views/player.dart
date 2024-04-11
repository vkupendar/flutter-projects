import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_using_getx/consts/colors.dart';
import 'package:music_player_using_getx/consts/textstyle.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../controllers/player_controller.dart';

class Player extends StatelessWidget {
  final List<SongModel> data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                  child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 350,
                width: 350,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: QueryArtworkWidget(
                  id: data[controller.playIndex.value].id,
                  type: ArtworkType.AUDIO,
                  artworkHeight: double.infinity,
                  artworkWidth: double.infinity,
                  nullArtworkWidget: const Icon(Icons.music_note),
                ),
              )),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  color: whiteColor),
              child: Obx(
                () => Column(
                  children: [
                    Text(
                      data[controller.playIndex.value].displayNameWOExt,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: ourstyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      data[controller.playIndex.value].artist.toString(),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: ourstyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            controller.position.value,
                            style: ourstyle(color: bgDarkColor),
                          ),
                          Expanded(
                            child: Slider(
                              thumbColor: sliderColor,
                              activeColor: sliderColor,
                              inactiveColor: bgColor,
                              min: const Duration(seconds: 0)
                                  .inSeconds
                                  .toDouble(),
                              max: controller.max.value,
                              value: controller.value.value,
                              onChanged: (newValue) {
                                controller
                                    .changeDurationToSeconds(newValue.toInt());
                                newValue = newValue;
                              },
                            ),
                          ),
                          Text(
                            controller.duration.value,
                            style: ourstyle(color: bgDarkColor),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.playSong(
                                  data[controller.playIndex.value - 1].uri,
                                  controller.playIndex.value - 1);
                            },
                            icon: const Icon(
                              Icons.skip_previous_rounded,
                              size: 40,
                              color: bgDarkColor,
                            )),
                        Obx(
                          () => CircleAvatar(
                            radius: 35,
                            backgroundColor: bgDarkColor,
                            child: Transform.scale(
                              scale: 3,
                              child: IconButton(
                                  onPressed: () {
                                    if (controller.isplaying.value) {
                                      controller.audioPlayer.pause();
                                      controller.isplaying(false);
                                    } else {
                                      controller.audioPlayer.play();
                                      controller.isplaying(true);
                                    }
                                  },
                                  icon: controller.isplaying.value
                                      ? const Icon(
                                          Icons.pause,
                                          size: 54,
                                          color: whiteColor,
                                        )
                                      : const Icon(
                                          Icons.play_arrow_rounded,
                                          size: 54,
                                          color: whiteColor,
                                        )),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.playSong(
                                  data[controller.playIndex.value + 1].uri,
                                  controller.playIndex.value + 1);
                            },
                            icon: const Icon(
                              Icons.skip_next_rounded,
                              size: 40,
                              color: bgDarkColor,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
