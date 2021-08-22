import 'dart:convert';

Newsfeed newsfeedFromJson(String str) => Newsfeed.fromJson(json.decode(str));

String newsfeedToJson(Newsfeed data) => json.encode(data.toJson());

class Newsfeed {
  Newsfeed({
    required this.newsfeed,
  });

  List<NewsfeedElement> newsfeed;

  factory Newsfeed.fromJson(Map<String, dynamic> json) => Newsfeed(
        newsfeed: List<NewsfeedElement>.from(
            json["newsfeed"].map((x) => NewsfeedElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "newsfeed": List<dynamic>.from(newsfeed.map((x) => x.toJson())),
      };
}

class NewsfeedElement {
  NewsfeedElement({
    required this.id,
    required this.userName,
    required this.timeAgo,
    required this.userImage,
    required this.title,
    required this.description,
    required this.imageUri,
    required this.likeCount,
    required this.commentCount,
  });

  int id;
  String userName;
  String timeAgo;
  String userImage;
  String title;
  String description;
  String imageUri;
  int likeCount;
  int commentCount;

  factory NewsfeedElement.fromJson(Map<String, dynamic> json) =>
      NewsfeedElement(
        id: json["id"],
        userName: json["userName"],
        timeAgo: json["timeAgo"],
        userImage: json["userImage"],
        title: json["title"],
        description: json["description"],
        imageUri: json["imageUri"],
        likeCount: json["likeCount"],
        commentCount: json["commentCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "timeAgo": timeAgo,
        "userImage": userImage,
        "title": title,
        "description": description,
        "imageUri": imageUri,
        "likeCount": likeCount,
        "commentCount": commentCount,
      };
}
