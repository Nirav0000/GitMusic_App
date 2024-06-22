import 'package:flutter/material.dart';
import 'package:music_app/Screens/HomeScreen.dart';

import '../Constent/Colors.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {

  int _selectedIndex = 0;
  static const List _widgetOptions = [
   HomeScreen(),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
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
        decoration: BoxDecoration(
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
                  boxShadow:_selectedIndex==0? [
                    BoxShadow(
                      color:shadowColor,
                      blurRadius: 15,
                    )
                  ]:[],
                  image: DecorationImage(image: AssetImage('assets/images/HomeBottom.png'))
                ),
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
                    boxShadow:_selectedIndex==1 ? [
                      BoxShadow(
                        color:shadowColor,
                        blurRadius: 15,
                      )
                    ]:[],
                    image: DecorationImage(image: AssetImage('assets/images/FavoriteBottom.png'))
                ),
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
                    boxShadow:_selectedIndex==2 ? [
                      BoxShadow(
                        color:shadowColor,
                        blurRadius: 15,
                      )
                    ]:[],
                    image: DecorationImage(image: AssetImage('assets/images/CategoryBottom.png'))
                ),
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
                    boxShadow:_selectedIndex == 3 ? [
                      BoxShadow(
                        color:shadowColor,
                        blurRadius: 15,
                      )
                    ]:[],
                    image: DecorationImage(image: AssetImage('assets/images/SettingsBottom.png'))
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
