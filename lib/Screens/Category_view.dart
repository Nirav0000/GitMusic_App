import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:music_app/Widget/PlayAudio.dart';

import '../Constent/Colors.dart';
import '../Widget/widgets.dart';

class View_Category extends StatefulWidget {
  const View_Category({super.key, this.cat_data, this.cat_title});
  final cat_data;
  final cat_title;

  @override
  State<View_Category> createState() => _View_CategoryState();
}

class _View_CategoryState extends State<View_Category>
    with TickerProviderStateMixin {
  bool isFavorite = false;
  bool play_pause = false;
  List itemData = [];
  late LinearTimerController timerController1 = LinearTimerController(this);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    itemData = widget.cat_data;
    print('---view-->${itemData}');
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
                    child: Row(
                      children: [
                        InkWell(
                          hoverColor: transparent,
                          splashColor: transparent,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            '${widget.cat_title}',
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: GridView.builder(
                          itemCount: itemData.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: (context, i) {
                            final data = itemData[i];
                            return Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
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
                                        image:
                                            NetworkImage('${data['imgUrl']}')),
                                  ),
                                  child: Column(
                                    children: [
                                      const Spacer(),
                                      // Expanded(child: Padding(
                                      //   padding: const EdgeInsets.only(bottom: 10),
                                      //   child: Image.network('https://images.pexels.com/photos/1033729/pexels-photo-1033729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',fit: BoxFit.cover,),
                                      // )),
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
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20)),
                                                    color:
                                                        white.withOpacity(.1)),
                                                child: Center(
                                                  child: Text(
                                                    '${data['title']}',
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
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 15.0, sigmaY: 15.0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: white.withOpacity(.3),
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isFavorite = !isFavorite;
                                                });
                                              },
                                              icon: Image(
                                                image: AssetImage(isFavorite ==
                                                        true
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
                    ),
                  )
                ],
              ),
            ),
          ),
          PlayAudio(),
        ],
      ),
    );
  }
}
