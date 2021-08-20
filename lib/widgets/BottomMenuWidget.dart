import 'package:deletedvgtv/main.dart';
import 'package:deletedvgtv/pages/AdvertsScreen.dart';
import 'package:deletedvgtv/pages/ApplicationScreen.dart';
import 'package:deletedvgtv/pages/CompanyScreen.dart';
import 'package:deletedvgtv/pages/HomepageScreen.dart';
import 'package:deletedvgtv/pages/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomMenu extends StatefulWidget {
  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

/// This is the private State class that goes with BottomMenu.
class _BottomMenuState extends State<BottomMenu> {
  int _selectedIndex = 2;
  String name = 'İsim Soyisim';

  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    ProfileScreen("Hello World", "dec"),
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
    sp.remove("user_id");
    sp.remove("user_email");
    sp.remove("name");
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
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 120,
              child: DrawerHeader(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.network(
                              'https://pbs.twimg.com/media/DTm1DagWkAEDsFL.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Görevi - Çalışma Alanı',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Icon(Icons.album_outlined),
                        Text(
                          'Uygulama Hakkında',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Icon(Icons.phone_android),
                        Text(
                          'İletişim Bilgileri',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        Text(
                          'Ayarlar',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
        title: const Text('DELETET AKADEMİ'),
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
            label: 'Mülakat',
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
