import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Constent/Colors.dart';
import 'package:music_app/Widget/widgets.dart';

class SetingFields extends StatelessWidget {
  SetingFields({super.key, this.name, this.onPressed, this.isVersion});
  final name;
  VoidCallback? onPressed;
  final isVersion;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: transparent,
      hoverColor: transparent,
      onTap: onPressed,
      child: Container(
        height: 80,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white.withOpacity(.2),
          border: Border.all(width: 1.5, color: white.withOpacity(0.2)),
        ),
        child: Transform.translate(
          offset: Offset(8, 8),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: white.withOpacity(.1)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    '$name',
                                    style: Wid_Con.Text_Style(
                                        color: white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          const Shadow(
                                            blurRadius: 30.0, // shadow blur
                                            color: Colors.white, // shadow color
                                            offset: Offset(0.0,
                                                0.0), // how much shadow will be shown
                                          ),
                                        ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: white,
                                    size: 30,
                                  ),
                                )
                              ]),
                          isVersion == true
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 15),
                                  child: Text(
                                    '1.0.1',
                                    style: Wid_Con.Text_Style(
                                        color: white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          const Shadow(
                                            blurRadius: 30.0, // shadow blur
                                            color: Colors.white, // shadow color
                                            offset: Offset(0.0,
                                                0.0), // how much shadow will be shown
                                          ),
                                        ]),
                                  ),
                                )
                              : Container(),
                        ]),
                  ))),
        ),
      ),
    );
  }
}
