import 'dart:async';

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



// void main() {
//   runApp(ProgressBarApp());
// }

// class ProgressBarApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ProgressBarHomePage(),
//     );
//   }
// }

// class ProgressBarHomePage extends StatefulWidget {
//   @override
//   _ProgressBarHomePageState createState() => _ProgressBarHomePageState();
// }

// class _ProgressBarHomePageState extends State<ProgressBarHomePage> {
//   Timer? _timer;
//   double _progress = 1.0;
//   int _totalTimeInSeconds = 60;
//   int _remainingTimeInSeconds = 60;

//   void _startTimer(int timeInSeconds) {
//     _timer?.cancel();
//     setState(() {
//       _totalTimeInSeconds = timeInSeconds;
//       _remainingTimeInSeconds = timeInSeconds;
//       _progress = 1.0;
//     });

//     int startTime = DateTime.now().millisecondsSinceEpoch;
//     int endTime = startTime + timeInSeconds * 1000;

//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       int now = DateTime.now().millisecondsSinceEpoch;
//       int remainingTime = endTime - now;
//       if (remainingTime <= 0) {
//         setState(() {
//           _progress = 0.0;
//           _remainingTimeInSeconds = 0;
//         });
//         _timer?.cancel();
//       } else {
//         setState(() {
//           _remainingTimeInSeconds = (remainingTime / 1000).ceil();
//           _progress = remainingTime / (timeInSeconds * 1000);
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   String _formatTime(int totalSeconds) {
//     int hours = totalSeconds ~/ 3600;
//     int minutes = (totalSeconds % 3600) ~/ 60;
//     int seconds = totalSeconds % 60;
//     return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Progress Bar Timer'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             LinearProgressIndicator(
//               value: _progress,
//               minHeight: 5.0,
//               backgroundColor: Color.fromARGB(255, 179, 76, 76),
//               valueColor: AlwaysStoppedAnimation<Color>(
//                   Color.fromARGB(255, 224, 224, 224)),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _startTimer(60),
//                   child: Text('1 min'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _startTimer(300),
//                   child: Text('5 min'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _startTimer(600),
//                   child: Text('10 min'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _startTimer(3600),
//                   child: Text('1 h'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Time remaining: ${_formatTime(_remainingTimeInSeconds)}',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
