import 'package:deletedvgtv/pages/AdvertsScreen.dart';
import 'package:deletedvgtv/pages/Corporate/CompanyInterview.dart';
import 'package:deletedvgtv/pages/Corporate/CorparateHomepageScreen.dart';
import 'package:deletedvgtv/widgets/MainDraver.dart';
import 'package:flutter/material.dart';

class CompanyBottomMenu extends StatefulWidget {
  @override
  State<CompanyBottomMenu> createState() => _CompanyBottomMenuState();
}

/// This is the private State class that goes with CompanyBottomMenu.
class _CompanyBottomMenuState extends State<CompanyBottomMenu> {
  int _selectedIndex = 1;
  // ignore: unused_field
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static final List<Widget> _widgetOptions = <Widget>[
    AdvertScreen(),
    CorparateHomepageScreen(), //HomePageScreen(),
    CompanyInterview()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: MainDraver()),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
        centerTitle: true,
        title: const Text(
          'Kurumsal',
          style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              fontSize: 18.0),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Başvurular',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 28.0),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_outlined, size: 28.0),
            label: 'Mülakatlar',
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
