import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:music_app/Constent/Colors.dart';
import 'package:music_app/Screens/ErrorScreen.dart';
import 'package:music_app/Screens/IntroScreen.dart';
import 'package:music_app/firebase_options.dart';
import 'Screens/BottomTabBar.dart';

// AudioPlayer audioPlayer = AudioPlayer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  // audioPlayer = AudioPlayer();
  // audioPlayer.setReleaseMode(ReleaseMode.loop);
  runApp(GetMaterialApp(
// home: CarouselWithIndicatorDemo(),
    // home: ErrorScreen(),
    home: storage.read('MusicDataAPI') != null ? BottomTabBar() : IntroScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
