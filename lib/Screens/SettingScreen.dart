import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:launch_review/launch_review.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:music_app/Screens/Category_view.dart';
import 'package:music_app/Widget/SettingFields.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    onPressed: () async {
                      String email = Uri.encodeComponent("dninfotech16@gmail.com");
                      String subject =
                      Uri.encodeComponent("Hello Sir, - Caller App");
                      String body = Uri.encodeComponent("Hi! ");
                      print(subject); //output: Hello%20Flutter
                      Uri mail =
                      Uri.parse("mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                      //email app opened
                      } else {
                      //email app is not opened
                      }
                    },
                  ),
                  SetingFields(
                    name: 'Privacy Policy',
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://www.termsfeed.com/live/f9805160-fc5b-425a-8c37-9889ec39dd1c'));
                    },
                  ),
                  SetingFields(
                    name: 'Rate Us',
                    onPressed: () {
                      LaunchReview.launch(androidAppId: "com.example.music_app");
                    },
                  ),
                  SetingFields(
                    name: 'Share Us',
                    onPressed: () {
                      FlutterShare.share(
                          linkUrl:
                          "https://play.google.com/store/apps/details?id=com.example.music_app",
                          title: 'Caller App');
                    },
                  ),
                  SetingFields(
                    name: 'App Version',
                    onPressed: () {},
                    isVersion: true,
                    version: '1.0.1',
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
