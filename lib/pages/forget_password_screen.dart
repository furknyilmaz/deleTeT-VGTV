import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                child: Image.asset("lib/img/logo.png"),
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
                bottom: height / 60,
                left: width / 8,
                right: width / 10,
              ),
              child: Text(
                "E-posta adresinize şifrenizi yenilemek için bir bağlantı göndereceğiz.",
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              width: width - (width / 5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPassword(),
                    ),
                  );
                },
                child: Text('Şifremi Yenile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
