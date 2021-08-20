import 'package:deletedvgtv/api/api_services.dart';
import 'package:deletedvgtv/models/login_model.dart';
import 'package:deletedvgtv/pages/RegisterScreen.dart';
import 'package:deletedvgtv/utils/token.dart';
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
                return ok == true ? BottomMenu() : LoginScreenPage();
              } else {
                return Container();
              }
            })
        //MyHomePage(title: 'Home page'),
        );
  }
}

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: globalKeyForm,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text("Giriş Ekranı"),
                    SizedBox(
                      height: 25,
                    ),
                    new TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) => !input!.contains('@')
                          ? "Geçerli bir adres girinikz!"
                          : null,
                      onSaved: (input) => requestModal.email = input,
                      decoration: new InputDecoration(
                        hintText: 'E-posta adresi',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    new TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      onSaved: (input) => requestModal.password = input,
                      decoration: new InputDecoration(
                        hintText: 'Parola',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (validateAndSave()) {
                            print("selamla");
                            APIServices apiServices = new APIServices();
                            apiServices.login(requestModal).then((value) {
                              print(value.email);
                              print(value.name);
                            });
                          }
                        },
                        child: Text('Giriş yap'))
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  bool validateAndSave() {
    final form = globalKeyForm.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
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
                TextInputWidget("username"),
                TextInputWidget("password"),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Oturum Aç'),
                ),
                LoginRegisterButton("Henuz Hesabınız yok mu?", 'Hemen Kayıt Ol')
              ],
            ),
          ),
        )));
  }
}
//BottomMenu(),

class TextInputWidget extends StatelessWidget {
  String value;
  TextInputWidget(this.value);

  late LoginRequestModal requestModal;

  @override
  void initState() {
    // super.initState();
    requestModal = new LoginRequestModal();
    print(requestModal);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        onSaved: (input) => requestModal.password = input,
        obscureText: value == 'password' ? true : false,
        controller: value == 'password' ? tfPassword : tfUsername,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.0),
          hintText: value == 'password'
              ? 'Şifrenizi giriniz '
              : 'E-posta adresinizi giriniz',
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
    );
  }
}

class LoginRegisterButton extends StatelessWidget {
  String text, buttonText;
  LoginRegisterButton(this.text, this.buttonText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Text(text),
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
                buttonText,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
