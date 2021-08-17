import 'package:deletedvgtv/main.dart';
import 'package:deletedvgtv/pages/AdvertsScreen.dart';
import 'package:deletedvgtv/pages/ApplicationScreen.dart';
import 'package:deletedvgtv/pages/CompanyScreen.dart';
import 'package:deletedvgtv/pages/HomepageScreen.dart';
import 'package:deletedvgtv/pages/ProfileScreen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

/// This is the private State class that goes with BottomMenu.
class _BottomMenuState extends State<BottomMenu> {
  int _selectedIndex = 2;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ProfileScreen(),
    ApplicationScreen(),
    HomePageScreen(),
    AdvertScreen(),
    CompanyScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> logOut() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove("value");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
        title: const Text('Benim Kariyerim'),
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: Icon(
              Icons.logout_outlined,
              size: 24,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 28.0,
            ),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
            ),
            label: 'Başvurular',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 28.0,
            ),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fact_check_outlined,
              size: 28.0,
            ),
            label: 'İlanlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business_outlined,
              size: 28.0,
            ),
            label: 'Şirketler',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.black26,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedFontSize: 11,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
