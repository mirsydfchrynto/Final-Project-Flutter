import 'package:final_project/navigation/pg1.dart';
import 'package:flutter/material.dart';
import 'package:final_project/navigation/pg2.dart';
import 'package:final_project/navigation/pg3.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Pg1(),
    Pg2(),
    Pg3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.20),
                    blurRadius: 48,
                    spreadRadius: 0,
                    offset: Offset(0, 0)
                )
              ]
          ),
          height: 73,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
      });
    },

        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/navigasi icon/Home.png', width: 24, height: 24,),label: ''),
          BottomNavigationBarItem(icon: Image.asset('assets/navigasi icon/Icon.png', width: 24, height: 24,),label: ''),
          BottomNavigationBarItem(icon: Image.asset('assets/navigasi icon/Profile.png', width: 24, height: 24,),label: ''),
        ],
        ),
        ),
    );
  }
}
