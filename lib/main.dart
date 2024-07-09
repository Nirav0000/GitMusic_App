import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:music_app/firebase_options.dart';
import 'Screens/BottomTabBar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await Hive.initFlutter();
  await Hive.openBox('GetMusicData');
  runApp(const GetMaterialApp(
// home: CarouselWithIndicatorDemo(),
    home: BottomTabBar(),
    debugShowCheckedModeBanner: false,
  ));
}
