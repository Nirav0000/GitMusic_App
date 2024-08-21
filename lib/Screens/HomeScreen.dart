import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:lottie/lottie.dart';
import 'package:music_app/Constent/Colors.dart';
import 'package:music_app/Widget/PlayAudio.dart';
import 'package:music_app/Widget/widgets.dart';
import '../Model/AppData.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _current = 0;
  bool isFavorite = false;
  bool play_pause = false;
  bool? isLoading;
  String itemIndex = 'animal';
  List<dynamic> MusicData = [];
  List FevoritsItme = [];
  var categoryData;
  late LinearTimerController timerController1 = LinearTimerController(this);
  final CarouselController _controller = CarouselController();
  final audioPlayer = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    MusicData = storage.read('MusicDataAPI');
    categoryData = MusicData[0];
    loadSelectedItems('animal1');
    print('----app----> ${MusicData}');
  }

  //  List<Widget> imageSliders =
  //     .toList();

  @override
  void dispose() {
    timerController1.dispose();
    super.dispose();
  }

  Future<void> saveSelectedItems(indexName) async {
    // final prefs = await SharedPreferences.getInstance();
    // const key = 'selected_items';
    // ignore: prefer_null_aware_operators
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        final value = FevoritsItme.map((item) => item['id']).join(',');
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

        loadSelectedItems(indexName);
      });
    });

    // await prefs.setString(key, value);
  }

  Future<void> loadSelectedItems(indexName) async {
    List value1 = [];
    if (storage.read(indexName) != null) {
      final value = storage.read(indexName);

      print('-------dzsfdgvzs------> ${storage.read('FavriteSound')}');

      final list = value.split(',').toList();
      setState(() {});
      var rValue;
      var selectedList;
      // for (var i = 0; i < MusicData.length; i++) {
      // selectedList = MusicData.where((item) {
      List itemdata = [];

      setState(() {
        itemdata = MusicData[_current]['items'];
      });
      // print('-------itemdata------> ${item}');
      final iitem = itemdata.where((ii) {
        return list.contains(ii['id']);
      }).toList();
      print('-------iitemmmm------> ${iitem}');

      setState(() {
        FevoritsItme = iitem ?? [];
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            storage.write(categoryData['title'], FevoritsItme);
          });
        });
      });
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading != true
          ? Column(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 20, right: 20, bottom: 30),
                          child: Text(
                            'Category',
                            style: Wid_Con.Text_Style(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  const Shadow(
                                    blurRadius: 30.0, // shadow blur
                                    color: Colors.white, // shadow color
                                    offset: Offset(0.0,
                                        0.0), // how much shadow will be shown
                                  ),
                                ]),
                          ),
                        ),
                        CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                            height: 150,
                            autoPlay: false,
                            aspectRatio: 2.0, enlargeFactor: 0.2,
                            viewportFraction: 0.8,
                            enlargeCenterPage: true,
                            // enableInfiniteScroll: false,
                            pageSnapping: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                                categoryData = MusicData[index];
                                itemIndex = categoryData['title'];
                                print('------index---> ${index}');
                                print('------index---> ${categoryData}');
                              });
                            },
                          ),
                          items: MusicData.map((item) => Container(
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Stack(
                                        children: <Widget>[
                                          Image.network(
                                              "${item['items'][0]['imgUrl']}",
                                              fit: BoxFit.cover,
                                              width: 1000.0),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: ClipRRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 10.0, sigmaY: 10.0),
                                                child: Container(
                                                  height: 40,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 20.0),
                                                  child: Text(
                                                    '${item['title'] ?? ''}',
                                                    style: Wid_Con.Text_Style(
                                                      color: Colors.white,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              )).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: MusicData.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    _controller.animateToPage(entry.key),
                                child: Container(
                                  width: _current == entry.key ? 40 : 15,
                                  height: 8,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            color: themeColor)
                                      ],
                                      borderRadius: BorderRadius.circular(30),
                                      color: themeColor.withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: Text(
                            '${categoryData['title']}',
                            style: Wid_Con.Text_Style(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  const Shadow(
                                    blurRadius: 30.0, // shadow blur
                                    color: Colors.white, // shadow color
                                    offset: Offset(0.0,
                                        0.0), // how much shadow will be shown
                                  ),
                                ]),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 20, right: 20, bottom: 5),
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: GridView.builder(
                                itemCount: categoryData['items'].length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemBuilder: (context, i) {
                                  final itemData = categoryData['items'][i];
                                  return InkWell(
                                    splashColor: transparent,
                                    highlightColor: transparent,
                                    onTap: () async {
                                      await audioPlayer.setAudioSource(
                                          AudioSource.uri(Uri.parse(
                                              "${itemData['audioUrl']}")));
                                      audioPlayer.play();
                                    },
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.5,
                                                  color:
                                                      white.withOpacity(0.2)),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: white.withOpacity(.2),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      '${itemData['imgUrl']}'))),
                                          child: Column(
                                            children: [
                                              const Spacer(),
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(20),
                                                        bottomRight:
                                                            Radius.circular(
                                                                20)),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 5.0, sigmaY: 5.0),
                                                  child: Container(
                                                    height: 40,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            20),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20)),
                                                        color: white
                                                            .withOpacity(.1)),
                                                    child: Center(
                                                      child: Text(
                                                        '${itemData['title']}',
                                                        style:
                                                            Wid_Con.Text_Style(
                                                                color: white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                shadows: [
                                                              const Shadow(
                                                                blurRadius:
                                                                    30.0, // shadow blur
                                                                color: Colors
                                                                    .white, // shadow color
                                                                offset: Offset(
                                                                    0.0,
                                                                    0.0), // how much shadow will be shown
                                                              ),
                                                            ]),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 15.0, sigmaY: 15.0),
                                                child: InkWell(
                                                  hoverColor: transparent,
                                                  splashColor: transparent,
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: white
                                                                .withOpacity(
                                                                    .3),
                                                            width: 1.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            isFavorite =
                                                                !isFavorite;
                                                          });
                                                          setState(() {
                                                            // provider.toggleFavorite(currentItem);
                                                            if (FevoritsItme
                                                                .contains(
                                                                    itemData)) {
                                                              FevoritsItme
                                                                  .remove(
                                                                      itemData);
                                                            } else {
                                                              FevoritsItme.add(
                                                                  itemData);
                                                            }

                                                            saveSelectedItems(
                                                                '${itemIndex}1');
                                                          });
                                                        },
                                                        icon: Image(
                                                          image: AssetImage(FevoritsItme
                                                                  .contains(
                                                                      itemData)
                                                              ? 'assets/images/Favorite.png'
                                                              : 'assets/images/Unfavorite.png'),
                                                          height: 20,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )

                                        // Center(
                                        //   child: Lottie.asset(
                                        //       'assets/lotties/playAnimation.json',
                                        //       // height: 20,
                                        //       width: 50),
                                        // )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                PlayAudio(), // Container(
                //   height: 65,
                //   width: double.infinity,
                //   decoration: const BoxDecoration(
                //     color: Color(0xFF403d59),
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       LinearTimer(
                //         duration: const Duration(seconds: 5),
                //         color: timerline,
                //         backgroundColor: themeColor,
                //         controller: timerController1,
                //         minHeight: 4,
                //         onTimerEnd: () {
                //           setState(() {
                //             play_pause = false;
                //             timerController1.reset();
                //           });
                //         },
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(bottom: 10),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Row(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 15),
                //                   child: Container(
                //                     height: 40,
                //                     width: 40,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(8),
                //                         color: white.withOpacity(.5),
                //                         image: const DecorationImage(
                //                           image: NetworkImage(
                //                               'https://images.pexels.com/photos/1033729/pexels-photo-1033729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                //                           fit: BoxFit.cover,
                //                         )),
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 15),
                //                   child: Text(
                //                     'Nature',
                //                     style: Wid_Con.Text_Style(
                //                         color: white,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.bold,
                //                         shadows: [
                //                           const Shadow(
                //                             blurRadius: 30.0, // shadow blur
                //                             color: Colors.white, // shadow color
                //                             offset: Offset(0.0,
                //                                 0.0), // how much shadow will be shown
                //                           ),
                //                         ]),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             InkWell(
                //               splashColor: transparent,
                //               hoverColor: transparent,
                //               onTap: () {
                //                 setState(() {
                //                   audioPlayer.stop();
                //                   play_pause = !play_pause;
                //                   play_pause == true
                //                       ? timerController1.start()
                //                       : timerController1.stop();
                //                 });
                //               },
                //               child: Padding(
                //                 padding: const EdgeInsets.only(right: 15),
                //                 child: Image(
                //                   image: AssetImage(play_pause == true
                //                       ? 'assets/images/play.png'
                //                       : 'assets/images/pause.png'),
                //                   height: 40,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            )
          : Center(
              child: CupertinoActivityIndicator(
                animating: true,
                color: themeDarkColor,
              ),
            ),
    );
  }
}
