import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linear_timer/linear_timer.dart';
import 'Screens/BottomTabBar.dart';


void main() {
  runApp(
    const GetMaterialApp(
// home: CarouselWithIndicatorDemo(),
home: BottomTabBar(),
      debugShowCheckedModeBanner: false,
    )
  );
}


final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];



class LinearWidgetDemo extends StatefulWidget {
  const LinearWidgetDemo({super.key});

  @override
  State<LinearWidgetDemo> createState() => _LinearWidgetDemoState();
}

class _LinearWidgetDemoState extends State<LinearWidgetDemo>
    with TickerProviderStateMixin {
  late LinearTimerController timerController1 = LinearTimerController(this);


  @override
  void dispose() {
    timerController1.dispose();



    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text("simple linear timer (5 seconds forward)"),
            ),
            LinearTimer(
              duration: const Duration(seconds: 5),
              color: Colors.green,
              backgroundColor: Colors.grey[200],
              controller: timerController1,
              onTimerEnd: () {

              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      timerController1.start();
                    },
                    icon: const Icon(Icons.play_arrow)),
                IconButton(
                    onPressed: () {
                      timerController1.stop();
                    },
                    icon: const Icon(Icons.stop)),
                IconButton(
                    onPressed: () {
                      timerController1.reset();
                    },
                    icon: const Icon(Icons.restart_alt))
              ],
            ),

          ],
        ),
      ),
    );
  }
}