import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
        keyboardType: TextInputType.multiline,
        style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: (BorderSide(
              color: Colors.grey.shade300,
            )),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
          ),
          contentPadding: EdgeInsets.only(left: 5.0),
          hintText: 'İlanlar arasında ara',
          hintStyle: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 24,
          ),
        ));
  }
}
