import 'dart:async';
import 'dart:convert';

import 'package:deletedvgtv/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse(companyAPI));
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int id;
  final String title;
  final String imageUrl;
  final String department;
  final String year;
  final String personCount;
  final String adress;
  final String phone;
  final String about;
  final String websites;
  final DateTime currentDate;

  const Photo({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.department,
    required this.year,
    required this.personCount,
    required this.adress,
    required this.phone,
    required this.about,
    required this.websites,
    required this.currentDate,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json["id"] as int,
      title: json["title"] as String,
      imageUrl: json["imageUrl"] as String,
      department: json["department"] as String,
      year: json["year"] as String,
      personCount: json["personCount"] as String,
      adress: json["adress"] as String,
      phone: json["phone"] as String,
      about: json["about"] as String,
      websites: json["websites"] as String,
      // ignore: unnecessary_cast
      currentDate: DateTime.parse(json["currentDate"]) as DateTime,
    );
  }
}

void main() => runApp(const Firmalar());

class Firmalar extends StatelessWidget {
  const Firmalar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Isolate Demo';

    return const MaterialApp(
      title: appTitle,
      home: FirmalarScreen(title: appTitle),
    );
  }
}

class FirmalarScreen extends StatelessWidget {
  const FirmalarScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Text(
            photos[0].imageUrl); //Image.network(photos[index].imageUrl);
      },
    );
  }
}
