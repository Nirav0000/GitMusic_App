import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:music_app/Widget/PlayAudio.dart';

import '../Constent/Colors.dart';
import '../Widget/widgets.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with TickerProviderStateMixin {
  bool isFavorite = false;
  bool play_pause = false;
  final audioPlayer = AudioPlayer();
  List cat_animal = [];
  List cat_bird = [];
  List cat_city = [];
  List cat_home = [];
  List cat_nature = [];
  List cat_night = [];
  List cat_ocean = [];
  List cat_rain = [];
  List cat_relaxing = [];
  List cat_river = [];
  List cat_vehicle = [];
  List cat_windfire = [];
  late LinearTimerController timerController1 = LinearTimerController(this);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('-----fav--> ${storage.read('animal')}');
    cat_animal = storage.read('animal') ?? [];
    cat_bird = storage.read('bird') ?? [];
    cat_city = storage.read('city') ?? [];
    cat_home = storage.read('home') ?? [];
    cat_nature = storage.read('nature') ?? [];
    cat_night = storage.read('night') ?? [];
    cat_ocean = storage.read('ocean') ?? [];
    cat_rain = storage.read('rain') ?? [];
    cat_relaxing = storage.read('relaxing') ?? [];
    cat_river = storage.read('river') ?? [];
    cat_vehicle = storage.read('vehicle') ?? [];
    cat_windfire = storage.read('wind & fire') ?? [];
    //   });

    // });
  }

  Future<void> saveSelectedItems(indexName, FevList) async {
    // final prefs = await SharedPreferences.getInstance();
    // const key = 'selected_items';
    // ignore: prefer_null_aware_operators
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        final value = FevList.map((item) => item['id']).join(',');
        if (indexName == 'animal1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'bird1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'city1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'home1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'nature1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'night1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'ocean1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'rain1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'relaxing1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'river1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'vehicle1') {
          storage.write(indexName, value.toString());
        } else if (indexName == 'wind & fire1') {
          storage.write(indexName, value.toString());
        }
        storage.write(indexName, value.toString());
        print('----favitem--> ${value}');

        // loadSelectedItems(indexName);
      });
    });

    // await prefs.setString(key, value);
  }

  gridwidget({List? itemCount, String? title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          child: Text(
            '$title',
            style: Wid_Con.Text_Style(
                color: white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [
                  const Shadow(
                    blurRadius: 30.0, // shadow blur
                    color: Colors.white, // shadow color
                    offset: Offset(0.0, 0.0), // how much shadow will be shown
                  ),
                ]),
          ),
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GridView.builder(
              itemCount: itemCount?.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (context, i) {
                final data = itemCount?[i];
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    InkWell(
                      splashColor: transparent,
                      hoverColor: transparent,
                      onTap: () async {
                        await audioPlayer.setAudioSource(
                            AudioSource.uri(Uri.parse("${data['audioUrl']}")));
                        audioPlayer.play();
                      },
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: white.withOpacity(.2),
                          border: Border.all(
                              width: 1.5, color: white.withOpacity(0.2)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('${data['imgUrl']}')),
                        ),
                        child: Column(
                          children: [
                            const Spacer(),
                            ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 5.0, sigmaY: 5.0),
                                    child: Container(
                                      height: 40,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20)),
                                          color: white.withOpacity(.1)),
                                      child: Center(
                                        child: Text(
                                          '${data['title']}',
                                          style: Wid_Con.Text_Style(
                                              color: white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                const Shadow(
                                                  blurRadius:
                                                      30.0, // shadow blur
                                                  color: Colors
                                                      .white, // shadow color
                                                  offset: Offset(0.0,
                                                      0.0), // how much shadow will be shown
                                                ),
                                              ]),
                                        ),
                                      ),
                                    )))
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: white.withOpacity(.3), width: 1.5),
                                  borderRadius: BorderRadius.circular(8)),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      setState(() {
                                        // provider.toggleFavorite(currentItem);
                                        if (itemCount!.contains(data)) {
                                          itemCount.remove(data);
                                        } else {
                                          itemCount.add(data);
                                        }
                                        saveSelectedItems(
                                            '${title}1', itemCount);
                                      });
                                    });
                                  },
                                  icon: Image(
                                    image: AssetImage(itemCount!.contains(data)
                                        ? 'assets/images/Favorite.png'
                                        : 'assets/images/Unfavorite.png'),
                                    height: 20,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.png'),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       top: 50, left: 20, right: 20, bottom: 20),
                    //   child: Text(
                    //     'Favorite',
                    //     style: Wid_Con.Text_Style(
                    //         color: white,
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold,
                    //         shadows: [
                    //           const Shadow(
                    //             blurRadius: 30.0, // shadow blur
                    //             color: Colors.white, // shadow color
                    //             offset: Offset(
                    //                 0.0, 0.0), // how much shadow will be shown
                    //           ),
                    //         ]),
                    //   ),
                    // ),
                    cat_animal.isNotEmpty
                        ? gridwidget(itemCount: cat_animal, title: 'animal')
                        : Container(),
                    cat_bird.isNotEmpty
                        ? gridwidget(itemCount: cat_bird, title: 'bird')
                        : Container(),
                    cat_city.isNotEmpty
                        ? gridwidget(itemCount: cat_city, title: 'city')
                        : Container(),
                    cat_home.isNotEmpty
                        ? gridwidget(itemCount: cat_home, title: 'home')
                        : Container(),
                    cat_nature.isNotEmpty
                        ? gridwidget(itemCount: cat_nature, title: 'nature')
                        : Container(),
                    cat_night.isNotEmpty
                        ? gridwidget(itemCount: cat_night, title: 'night')
                        : Container(),
                    cat_ocean.isNotEmpty
                        ? gridwidget(itemCount: cat_ocean, title: 'ocean')
                        : Container(),
                    cat_rain.isNotEmpty
                        ? gridwidget(itemCount: cat_rain, title: 'rain')
                        : Container(),
                    cat_relaxing.isNotEmpty
                        ? gridwidget(itemCount: cat_relaxing, title: 'relaxing')
                        : Container(),
                    cat_river.isNotEmpty
                        ? gridwidget(itemCount: cat_river, title: 'river')
                        : Container(),
                    cat_vehicle.isNotEmpty
                        ? gridwidget(itemCount: cat_vehicle, title: 'vehicle')
                        : Container(),
                    cat_windfire.isNotEmpty
                        ? gridwidget(
                            itemCount: cat_windfire, title: 'wind & fire')
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
          PlayAudio(),
        ],
      ),
    );
  }
}
