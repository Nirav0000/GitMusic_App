import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:music_app/Constent/Colors.dart';
import 'package:music_app/DialogBox/TimerDialog.dart';
import 'package:music_app/Widget/widgets.dart';

class PlayAudio extends StatefulWidget {
  const PlayAudio({super.key, this.onPressedPlayPause});
  final VoidCallback? onPressedPlayPause;

  @override
  State<PlayAudio> createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> with TickerProviderStateMixin {
  bool play_pause = false;
  late LinearTimerController timerController1 = LinearTimerController(this);
  final audioPlayer = AudioPlayer();
  late AnimationController controller;
  Duration count = const Duration();
  double progress = 1.0;
  var timerDetails = Duration.zero;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String get countText {
    count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  List Time_ = [
    'Off',
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '30 minutes',
    '1 hours',
    '2 hours',
    '3 hours',
  ];
  String selectedTime = 'Off';

  void showRadioButtonDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TimerDialog(
          options: Time_,
          selectedOption: selectedTime,
          onOptionSelected: (Duration value) {
            setState(() {
              if (value == Duration(hours: 99999)) {
                selectedTime = 'Off';
              }

              timerDetails = value;
              print('---------lab--------> $timerDetails');
              controller = AnimationController(
                vsync: this,
                duration: const Duration(seconds: 30),
              );
              controller.addListener(() {
                if (controller.isAnimating) {
                  setState(() {
                    progress = controller.value;
                  });
                } else {
                  setState(() {
                    progress = 1.0;
                  });
                }
              });
              controller.duration = timerDetails;
              if (timerDetails != null) {
                print('step 2 ');

                controller.duration = timerDetails;
                controller.reverse(
                    from: controller.value == 0 ? 1.0 : controller.value);

                print('step 3 ');
                setState(() {
                  controller.duration =
                      timerDetails ?? const Duration(hours: 99999);
                });
              }
              print('---timerDetails--> $timerDetails');
              timerController1.start();
              storage.read('time');
              FocusManager.instance.primaryFocus?.unfocus();
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF403d59),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LinearTimer(
            duration: timerDetails,
            color: timerline,
            backgroundColor: themeColor,
            controller: timerController1,
            minHeight: 4,
            onTimerEnd: () {
              setState(() {
                play_pause = false;
                timerController1.reset();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white.withOpacity(.5),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/1033729/pexels-photo-1033729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Nature',
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
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: timerDetails != 'Off'
                          ? countText[0] != '9'
                              ? count != const Duration()
                                  ? AnimatedBuilder(
                                      animation: controller,
                                      builder: (context, child) => Text(
                                        countText,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: white,
                                            fontWeight: FontWeight.w400,
                                            shadows: [
                                              const Shadow(
                                                blurRadius: 30.0, // shadow blur
                                                color: Colors
                                                    .white, // shadow color
                                                offset: Offset(0.0,
                                                    0.0), // how much shadow will be shown
                                              ),
                                            ]),
                                      ),
                                    )
                                  : Container()
                              : Container()
                          : Container(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        splashColor: transparent,
                        hoverColor: transparent,
                        onTap: () {
                          setState(() {
                            showRadioButtonDialog();
                          });
                        },
                        child: const Image(
                          image: AssetImage('assets/images/timer.png'),
                          height: 40,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: transparent,
                      hoverColor: transparent,
                      onTap: widget.onPressedPlayPause,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Image(
                          image: AssetImage(play_pause == true
                              ? 'assets/images/play.png'
                              : 'assets/images/pause.png'),
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
