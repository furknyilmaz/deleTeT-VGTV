import 'package:deletedvgtv/pages/RegisterScreen.dart';
import 'package:deletedvgtv/widgets/BottomMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());
var tfUsername = TextEditingController();
var tfPassword = TextEditingController();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // ignore: non_constant_identifier_names
  Future<bool> Control() async {
    var sp = await SharedPreferences.getInstance();
    String? username = sp.getString("value");

    if (username != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello World Flutter Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder<bool>(
            future: Control(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                bool? ok = snapshot.data;
                return ok == true
                    ? BottomMenu()
                    : MyHomePage(title: 'Homepage');
              } else {
                return Container();
              }
            })
        //MyHomePage(title: 'Home page'),
        );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;

    // final scoffoldKey = GlobalKey<ScaffoldState>();

    // ignore: non_constant_identifier_names
    Future<void> LoginControl() async {
      var username = tfUsername.text;
      var password = tfPassword.text;

      if (username == 'admin' && password == '12345') {
        var sp = await SharedPreferences.getInstance();
        sp.setString("value", username);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomMenu(),
          ),
        );
        print('oldu');
      } else {
        final snackBar = SnackBar(
          content: Text(
              'Kullanıcı adı veya şifreyi hatalı girdiniz. Lütfen kontrol ediniz.'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(
                    width: width / 1.5,
                    height: 100,
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
                TextFormField(
                  controller: tfUsername,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 0.0, bottom: 0.0, top: 0.0),
                    hintText: 'E-posta adresssinizi giriniz',
                    hintStyle: TextStyle(fontSize: 12),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: Colors.blue,
                      size: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  controller: tfPassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15.0),
                    hintText: 'Şifrenizi giriniz',
                    hintStyle: TextStyle(fontSize: 12),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.blue,
                      size: 18,
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                Container(
                  width: 10,
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    LoginControl();
                  },
                  child: Text('Oturum Aç'),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Text("Henüz hesabınız yok mu?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Hemen Kayıt Ol',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
              ],
            ),
          ),
        )));
  }
}
//BottomMenu(),
