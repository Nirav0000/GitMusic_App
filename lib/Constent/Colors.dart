import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final player = AudioPlayer();
final storage = GetStorage();

Color themeDarkColor = const Color(0xFF1D1B29);
Color shadowColor = const Color(0xFF4527A0);
Color themeColor = const Color(0xFF9290C3);
Color timerline = const Color(0xFFFF5858);
Color black = const Color(0xFF000000);
Color white = const Color(0xFFFFFFFF);
Color fillColor = const Color(0xFFC8C8C8);
Color grey = const Color(0xFF878787);
Color red = const Color(0xFFFF0000);
Color blue = const Color(0xFF00B0EA);
Color transparent = const Color(0xFFFFFF);

class AppColors {
  static const Color backgroundBlue = Color(0xFF003cc9);
  static const Color backgroundBlack = Color(0xFF17191a);

  static const Color backgroundLightBlack = Color(0xff222325);
  static const Color backgroundPink = Color(0xFFedacca);
  static const Color backgroundPista = Color(0xffb0bd8e);
  static const Color textColor = Color(0xFFFFFFFF);
}
