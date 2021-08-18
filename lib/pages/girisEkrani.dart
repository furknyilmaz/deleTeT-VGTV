import 'package:deletedvgtv/widgets/BottomMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var username, password;

class GirisEkrani extends StatefulWidget {
  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  Future<void> loginControl() async {
    print(username);
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

  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selam')),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (username) {
                setState(() {
                  username = username;
                });
              },
              validator: (email) {
                return email!.length > 3 ? null : 'Geçersiz Email';
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15.0),
                hintText: 'Email  giriniz',
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
            TextFormField(
              onChanged: (password) {
                setState(() {
                  password = password;
                });
              },
              validator: (password) {
                return password!.length > 2 ? null : 'Geçersiz Şifre';
              },
              keyboardType: TextInputType.visiblePassword,
              // obscureText: true,
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
            ElevatedButton(
              onPressed: () {
                loginControl();
              },
              child: Text('Oturum Aç'),
            ),
          ],
        ),
      ),
    );
  }
}
