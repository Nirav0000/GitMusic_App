import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Constent/Colors.dart';
import 'package:music_app/Widget/widgets.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({super.key, this.StatusCode, this.Message});
  final StatusCode;
  final Message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_error.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Center(
                child: Text(
                  '${StatusCode ?? ''}',
                  textAlign: TextAlign.center,
                  style: Wid_Con.Text_Style(
                      color: white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        const Shadow(
                          blurRadius: 30.0, // shadow blur
                          color: Colors.white, // shadow color
                          offset:
                              Offset(0.0, 0.0), // how much shadow will be shown
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  '${Message ?? ''}'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Wid_Con.Text_Style(
                      color: white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        const Shadow(
                          blurRadius: 30.0, // shadow blur
                          color: Colors.white, // shadow color
                          offset:
                              Offset(0.0, 0.0), // how much shadow will be shown
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
