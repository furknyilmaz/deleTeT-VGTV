import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/models/login_model.dart';
import 'package:deletedvgtv/pages/RegisterScreen.dart';
import 'package:deletedvgtv/widgets/BottomMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({Key? key}) : super(key: key);

  @override
  _LoginScreenPAgeState createState() => _LoginScreenPAgeState();
}

class _LoginScreenPAgeState extends State<LoginScreenPage> {
  final scoffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalKeyForm = new GlobalKey<FormState>();

  late LoginRequestModal requestModal;

  @override
  void initState() {
    super.initState();
    requestModal = new LoginRequestModal();
    print(requestModal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scoffoldKey,
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Form(
                    key: globalKeyForm,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: SizedBox(
                            width: 200,
                            height: 100,
                            child: Image.asset("assets/logo.png"),
                          ),
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) => !input!.contains('@')
                              ? "Geçerli bir adres girinikz!"
                              : null,
                          onSaved: (input) => requestModal.email = input,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15.0),
                            hintText: 'E-posta adresiniz giriniz',
                            hintStyle: TextStyle(fontSize: 12),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.blue,
                              size: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            onSaved: (input) => requestModal.password = input,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15.0),
                              hintText: 'Şifrenizi Giriniz',
                              hintStyle: TextStyle(fontSize: 12),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.blue,
                                size: 18,
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              validateAndSave();
                            },
                            child: Text('Giriş yap')),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text("Zaten bir hesabınız var mı?"),
                        ),
                        TextButton(
                          child: Text(
                            'Hemen Oturum Aç',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> validateAndSave() async {
    final form = globalKeyForm.currentState;

    if (form!.validate()) {
      form.save();
      APIServices apiServices = new APIServices();
      apiServices.login(requestModal).then((response) async {
        print(response.statusCode);
        if (response.statusCode == 200) {
          var data = LoginResponseModal.fromJson(json.decode(response.body));

          var sp = await SharedPreferences.getInstance();
          sp.setString("user_id", data.id.toString());
          sp.setString("user_email", data.email.toString());
          sp.setString("name", data.name.toString());

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomMenu(),
            ),
          );
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
      });
    }
  }
}
