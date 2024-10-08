import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:music_app/Screens/Category_view.dart';

import '../Constent/Colors.dart';
import '../Widget/widgets.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with TickerProviderStateMixin {
  bool isFavorite = false;
  bool play_pause = false;
  late LinearTimerController timerController1 = LinearTimerController(this);
  List<dynamic> MusicData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MusicData = storage.read('MusicDataAPI');
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 20),
                    child: Text(
                      'Categories',
                      style: Wid_Con.Text_Style(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            const Shadow(
                              blurRadius: 30.0, // shadow blur
                              color: Colors.white, // shadow color
                              offset: Offset(
                                  0.0, 0.0), // how much shadow will be shown
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: GridView.builder(
                          itemCount: MusicData.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: (context, i) {
                            return InkWell(
                              splashColor: transparent,
                              hoverColor: transparent,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => View_Category(
                                        cat_data: MusicData[i]['items'],
                                        cat_title: MusicData[i]['title'],
                                      ),
                                    ));
                              },
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white.withOpacity(.2),
                                  border: Border.all(
                                      width: 1.5,
                                      color: white.withOpacity(0.2)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          '${MusicData[i]['items'][0]['imgUrl']}')),
                                ),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    // Expanded(child: Padding(
                                    //   padding: const EdgeInsets.only(bottom: 10),
                                    //   child: Image.network('https://images.pexels.com/photos/1033729/pexels-photo-1033729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',fit: BoxFit.cover,),
                                    // )),
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 5.0, sigmaY: 5.0),
                                            child: Container(
                                              height: 40,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20)),
                                                  color: white.withOpacity(.1)),
                                              child: Center(
                                                child: Text(
                                                  '${MusicData[i]['title']}',
                                                  style: Wid_Con.Text_Style(
                                                      color: white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
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
        ],
      ),
    );
  }
}
