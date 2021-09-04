class Newsfeed {
  Newsfeed({
    required this.id,
    required this.companyName,
    required this.companyIconUrl,
    required this.newsDescription,
    required this.newsImage,
    required this.likeCount,
    required this.commentCount,
    required this.newsTag,
  });

  int id;
  String companyName;
  String companyIconUrl;
  String newsDescription;
  String newsImage;
  int likeCount;
  int commentCount;
  String newsTag;

  factory Newsfeed.fromJson(Map<String, dynamic> json) => Newsfeed(
        id: json["id"] as int,
        companyName: json["companyName"] as String,
        companyIconUrl: json["companyIconUrl"] as String,
        newsDescription: json["newsDescription"] as String,
        newsImage: json["newsImage"] as String,
        likeCount: json["likeCount"] as int,
        commentCount: json["commentCount"] as int,
        newsTag: json["newsTag"] as String,
      );
}
