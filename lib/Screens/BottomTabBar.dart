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
  bool? isLoading;
  MusicData? musicData;
  final remoteConfig = FirebaseRemoteConfig.instance;

  static const List _widgetOptions = [
    HomeScreen(),
    FavoriteScreen(),
    CategoryScreen(),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  final Musicdata = Hive.box('GetMusicData');

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await Musicdata.add(newItem);
  }

  appAPIData(token) async {
    setState(() {
      isLoading = true;
    });
    // try {
    print('---->step 2');

    const url = 'https://www.dninfotechin.com/music/get-files';

    final response = await http
        .get(Uri.parse(url), headers: {'asd00': 'SOT3iiwz3HjFg4xIk1ZA'});
    var res = jsonDecode(response.body);

    print('<--->${response.body}');
    // storage.write('MusicDataAPI', res['data']);

    setState(() {
      isLoading = false;
    });
    // } catch (e) {
    //   setState(() {
    //     isLoading = false;
    //   });
    //   // Handle other error scenarios like network issues or unexpected responses
    //   log('Errorrrr: $e');
    // }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  remotconfig() async {
    print('remote----> 1');
    remoteConfig.onConfigUpdated.listen((RemoteConfigUpdate event) async {
      print('remote----> 2');
      await remoteConfig.activate();
      setState(() {
        print('remote----> 3');
        String token = remoteConfig.getString('token');
        print('remote----> $token');
        appAPIData(token);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('---is First');
    remotconfig();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading != true
          ? _widgetOptions[_selectedIndex]
          : Center(
              child: CupertinoActivityIndicator(
                color: themeDarkColor,
                animating: true,
              ),
            ),
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
