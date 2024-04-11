import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_using_getx/consts/colors.dart';
import 'package:music_player_using_getx/consts/textstyle.dart';
import 'package:music_player_using_getx/controllers/player_controller.dart';
import 'package:music_player_using_getx/views/player.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(
        backgroundColor: bgDarkColor,
        appBar: AppBar(
          backgroundColor: bgDarkColor,
          centerTitle: true,
          leading: const Icon(
            Icons.sort_rounded,
            color: whiteColor,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: whiteColor,
                ))
          ],
          title: Text(
            "Beats",
            style: ourstyle(),
          ),
        ),
        body: FutureBuilder<List<SongModel>>(
          future: controller.audioQuery.querySongs(
              ignoreCase: true,
              orderType: OrderType.ASC_OR_SMALLER,
              sortType: null,
              uriType: UriType.EXTERNAL),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.isEmpty) {
              return Center(
                  child: Text(
                "no Song found",
                style: ourstyle(),
              ));
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Obx(
                        () => ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          tileColor: bgColor,
                          title: Text(
                            snapshot.data![index].displayNameWOExt,
                            style: ourstyle(),
                          ),
                          subtitle: Text(
                            "${snapshot.data![index].artist}",
                            style: ourstyle(),
                          ),
                          leading: QueryArtworkWidget(
                            id: snapshot.data![index].id,
                            type: ArtworkType.AUDIO,
                            nullArtworkWidget: const Icon(
                              Icons.music_note,
                              color: whiteColor,
                              size: 32,
                            ),
                          ),
                          trailing: controller.playIndex.value == index &&
                                  controller.isplaying.value
                              ? const Icon(
                                  Icons.play_arrow,
                                  color: whiteColor,
                                  size: 26,
                                )
                              : null,
                          onTap: () {
                            controller.playSong(
                                snapshot.data![index].uri, index);
                            Get.to(() => Player(data: snapshot.data!),
                                transition: Transition.downToUp);
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ));
  }
}
