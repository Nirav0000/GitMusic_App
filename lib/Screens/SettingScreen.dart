import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:music_app/Screens/Category_view.dart';
import 'package:music_app/Widget/SettingFields.dart';

import '../Constent/Colors.dart';
import '../Widget/widgets.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
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
                      'Settings',
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
                  SetingFields(
                    name: 'Contact Us',
                    onPressed: () {},
                  ),
                  SetingFields(
                    name: 'Privacy Policy',
                    onPressed: () {},
                  ),
                  SetingFields(
                    name: 'Rate Us',
                    onPressed: () {},
                  ),
                  SetingFields(
                    name: 'Share Us',
                    onPressed: () {},
                  ),
                  SetingFields(
                    name: 'App Version',
                    onPressed: () {},
                    isVersion: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
