import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';

class Forum extends StatelessWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            child: ImageCached(
              url: "https://vizyonergenc.com/company/vg.png",
              width: 100.0,
              height: 100.0,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
            child: Text(
              'Forum sayfası şuan tasarım aşamasında...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade800,
                fontFamily: 'Nunito',
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ));
  }
}
