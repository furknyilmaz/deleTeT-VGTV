import 'package:deletedvgtv/pages/AdvertsScreen.dart';
import 'package:deletedvgtv/pages/ApplicationScreen.dart';
import 'package:deletedvgtv/pages/Corporate/CompanyApplication.dart';
import 'package:deletedvgtv/pages/Corporate/CompanyInterview.dart';
import 'package:deletedvgtv/pages/CompanyScreen.dart';
import 'package:deletedvgtv/pages/Corporate/CorparateHomepageScreen.dart';
import 'package:deletedvgtv/pages/ForumScreen.dart';
import 'package:deletedvgtv/pages/HomepageScreen.dart';
import 'package:deletedvgtv/pages/InterviewListScreen.dart';
import 'package:deletedvgtv/pages/InterviewScreen.dart';
import 'package:deletedvgtv/pages/ProfileScreen.dart';
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
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ApplicationScreen()));
              },
              child: Icon(Icons.fact_check_outlined, size: 22)),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InretviewListScreen()),
              );
            },
            child: Icon(Icons.record_voice_over, size: 24),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        ],
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
