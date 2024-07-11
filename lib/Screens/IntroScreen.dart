import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:music_app/Constent/Colors.dart';
import 'package:music_app/Screens/BottomTabBar.dart';
import 'package:music_app/Screens/ErrorScreen.dart';
import 'package:music_app/Widget/widgets.dart';
import '../Model/AppData.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  int _current = 0;
  bool isFavorite = false;
  bool play_pause = false;
  bool isLoading = false;
  String token = '';
  List<Map<String, dynamic>> MusicData = [];
  late LinearTimerController timerController1 = LinearTimerController(this);
  final CarouselController _controller = CarouselController();

  remotconfig() async {
    print('remote----> 1');
    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.onConfigUpdated.listen((RemoteConfigUpdate event) async {
      print('remote----> 2');
      await remoteConfig.activate();
      setState(() {
        print('remote----> 3');
        token = remoteConfig.getString('token');
        storage.write('firebaseToken', token);
        print('remote----> $token');
      });
    });
  }

  Future appAPIData(token) async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('https://www.dninfotechin.com/music/get-files');
    final headers = {'asd00': '$token'};
    print('----token---> $token');

    try {
      final response = await http.get(url, headers: headers);

      print(response.body);

      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        print(res);
        storage.write('MusicDataAPI', res['data']);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomTabBar(),
            ));
      } else if (response.statusCode == 403) {
        Wid_Con.NavigationOff(ErrorScreen(
          StatusCode: '403',
          Message: 'Internal server\nerror',
        ));
      } else if (response.statusCode == 404) {
        Wid_Con.NavigationOff(ErrorScreen(
          StatusCode: '404',
          Message: 'Oops!\nNo Data Found',
        ));
      } else if (response.statusCode == 500) {
        Wid_Con.NavigationOff(ErrorScreen(
          StatusCode: '403',
          Message: 'Internal server\nerror',
        ));
      } else {
        Wid_Con.NavigationOff(ErrorScreen(
          StatusCode: '${response.statusCode}',
          Message: 'Internal server\nerror',
        ));
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    remotconfig();
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
                      image: AssetImage('assets/images/bg2.png'),
                      fit: BoxFit.cover)),
              // ignore: prefer_const_constructors
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/headphone.png',
                    width: 300,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Behavioral Health\nService',
                    textAlign: TextAlign.center,
                    style: Wid_Con.Text_Style(
                        color: white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          const Shadow(
                            blurRadius: 30.0, // shadow blur
                            color: Colors.white, // shadow color
                            offset: Offset(
                                0.0, 0.0), // how much shadow will be shown
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Transforming lives by offering hope and opportunities for recovery, wellness, and independence.',
                      textAlign: TextAlign.center,
                      style: Wid_Con.Text_Style(
                          color: white,
                          fontSize: 14,
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
                  storage.read('firebaseToken') != null
                      ? InkWell(
                          splashColor: transparent,
                          hoverColor: transparent,
                          onTap: () {
                            appAPIData(storage.read('firebaseToken') ?? '');
                          },
                          child: isLoading != true
                              ? Container(
                                  height: 70,
                                  width: 70,
                                  margin: EdgeInsets.only(top: 70),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Center(
                                      child: Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 28,
                                    color: themeColor,
                                  )),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 70),
                                  child: CupertinoActivityIndicator(
                                    radius: 30,
                                    animating: true,
                                    color: white,
                                  ),
                                ),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 70),
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
