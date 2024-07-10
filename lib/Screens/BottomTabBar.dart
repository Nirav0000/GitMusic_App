import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:music_app/Screens/HomeScreen.dart';
import 'package:http/http.dart' as http;
import '../Constent/Colors.dart';
import '../Model/AppData.dart';
import 'CategoryScreen.dart';
import 'FavoriteScreen.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _selectedIndex = 0;
  static const List _widgetOptions = [
    HomeScreen(),
    FavoriteScreen(),
    CategoryScreen(),
    CategoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF33313e),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _onItemTapped(0);
                });
              },
              hoverColor: transparent,
              splashColor: transparent,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    boxShadow: _selectedIndex == 0
                        ? [
                            BoxShadow(
                              color: shadowColor,
                              blurRadius: 15,
                            )
                          ]
                        : [],
                    image: const DecorationImage(
                        image: AssetImage('assets/images/HomeBottom.png'))),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _onItemTapped(1);
                });
              },
              hoverColor: transparent,
              splashColor: transparent,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    boxShadow: _selectedIndex == 1
                        ? [
                            BoxShadow(
                              color: shadowColor,
                              blurRadius: 15,
                            )
                          ]
                        : [],
                    image: const DecorationImage(
                        image: AssetImage('assets/images/FavoriteBottom.png'))),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _onItemTapped(2);
                });
              },
              hoverColor: transparent,
              splashColor: transparent,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    boxShadow: _selectedIndex == 2
                        ? [
                            BoxShadow(
                              color: shadowColor,
                              blurRadius: 15,
                            )
                          ]
                        : [],
                    image: const DecorationImage(
                        image: AssetImage('assets/images/CategoryBottom.png'))),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _onItemTapped(3);
                });
              },
              hoverColor: transparent,
              splashColor: transparent,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    boxShadow: _selectedIndex == 3
                        ? [
                            BoxShadow(
                              color: shadowColor,
                              blurRadius: 15,
                            )
                          ]
                        : [],
                    image: const DecorationImage(
                        image: AssetImage('assets/images/SettingsBottom.png'))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
