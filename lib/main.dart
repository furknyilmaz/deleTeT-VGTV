import 'package:deletedvgtv/pages/forget_password_screen.dart';
import 'package:deletedvgtv/pages/register_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: MyHomePage(title: 'Home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  // This widget is the home page of your application.
  final String title;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double height = screen.size.height;
    final double width = screen.size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              width: width / 1.5,
              child: Image.asset("assets/logo.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: height / 60,
              left: width / 10,
              right: width / 10,
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15.0, bottom: 0.0, top: 0.0),
                hintText: 'E-posta adresinizi giriniz',
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
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: height / 40,
              left: width / 10,
              right: width / 10,
            ),
            child: TextField(
              obscureText: true,
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
          ),
          SizedBox(
            width: width - (width / 5),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
              child: Text('Giriş yap'),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: width * 0.1),
              child: TextButton(
                child: Text(
                  'Şifremi Unuttum',
                  style: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPassword(),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 20),
            child: Text("Henüz hesabınız yok mu?"),
          ),
          TextButton(
            child: Text(
              'Hemen Kayıt Ol',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
