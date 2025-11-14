
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int selectedIndex = 0;
  List<Widget> widgetOptions = [
    Center(child: Text('HOME SCREEN')),
    Center(child: Text('SEARCH SCREEN')),
    Center(child: Text('SETTINGS SCREEN')),
  ];

  void onItemTap(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: widgetOptions[selectedIndex],
      bottomNavigationBar: NavigationBar( //BottomNavigationBar M2
          destinations: [
            NavigationDestination( //BottomNavigationBarItem M2
                icon: Icon(Icons.home),
                label: 'Home',
                tooltip: 'homeScreen'
            ),
            NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Search',
                tooltip: 'homeScreen'
            ),
            NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
                tooltip: 'homeScreen'
            ),
            NavigationDestination(
                icon: Icon(Icons.man),
                label: 'profile',
                tooltip: 'profile'
            )
          ],
       selectedIndex: selectedIndex,
       onDestinationSelected: onItemTap, //onTap M2
      ),
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
          onPressed: () {},
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
    );
  }
}
