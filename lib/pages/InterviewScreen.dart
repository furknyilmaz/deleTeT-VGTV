import 'package:deletedvgtv/pages/broadcast_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _channelName = TextEditingController();
  String check = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 100,
                child: Image.asset("assets/logo.png"),
              ),
              Container(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.2,
                child: TextFormField(
                  controller: _channelName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Kanal İsmi',
                  ),
                ),
              ),
              /* TextButton(
                onPressed: () => onJoin(isBroadcaster: false),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Katıl',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      Icons.remove_red_eye,
                    ) 
                  ],
                ),
              ),
              */
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.pink,
                ),
                onPressed: () => onJoin(isBroadcaster: true),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Oturuma Katıl    ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.live_tv)
                  ],
                ),
              ),
              Text(
                check,
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ));
  }

  Future<void> onJoin({required bool isBroadcaster}) async {
    await [Permission.camera, Permission.microphone].request();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BroadcastPage(
          channelName: _channelName.text,
          isBroadcaster: isBroadcaster,
        ),
      ),
    );
  }
}
