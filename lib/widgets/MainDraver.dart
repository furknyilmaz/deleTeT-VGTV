import 'package:deletedvgtv/pages/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDraver extends StatefulWidget {
  @override
  _MainDraverState createState() => _MainDraverState();
}

class _MainDraverState extends State<MainDraver> {
  Future<void> logOut() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove("user_id");
    sp.remove("user_email");
    sp.remove("name");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreenPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    String name = 'İsim Soyisim';
    return Scaffold(
      body: ListView(
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
                        ' Uygulama Hakkında',
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
                        ' İletişim Bilgileri',
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
                        ' Ayarlar',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(Icons.logout_outlined),
                      GestureDetector(
                        onTap: () {
                          logOut();
                        },
                        child: Text(
                          ' Çıkış yap',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
