import 'package:ev_charging_operation_system/screens/Login.dart';
import 'package:ev_charging_operation_system/screens/navigator/FindStation.dart';
import 'package:ev_charging_operation_system/screens/navigator/HomeScreen.dart';
import 'package:ev_charging_operation_system/screens/navigator/MapScrenn.dart';
import 'package:ev_charging_operation_system/screens/navigator/PaymentScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MainScreens extends StatefulWidget {
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
            MapScreen(),
              FindStationScreen(),
                // PaymentScreen(),
                  Login(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff3a475c),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff26303F),
        unselectedItemColor: Color(0xff71809B),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
              label: '홈', icon: Icon(CupertinoIcons.home, color: Color(0xff71809B),size: 30,)),
          const BottomNavigationBarItem(
              label: '지도', icon: Icon(CupertinoIcons.placemark, color: Color(0xff71809B),size: 30)),
          const BottomNavigationBarItem(
              label: '즐겨찾기', icon: Icon(CupertinoIcons.star,color: Color(0xff71809B),size: 30)),
          // const BottomNavigationBarItem(
          //     label: '결제', icon: Icon(CupertinoIcons.square)),
          const BottomNavigationBarItem(
              label: '네정보', icon: Icon(CupertinoIcons.person,color: Color(0xff71809B),size: 30)),
        ],
      ),
    );
  }
}