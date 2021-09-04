class Profile {
  Profile({
    required this.id,
    required this.userId,
    required this.imageUrl,
    required this.fullName,
    required this.about,
    required this.tckn,
    required this.address,
    required this.website,
    required this.phoneNumber,
    required this.email,
    required this.university,
    required this.experiences,
    required this.followingTitles,
    required this.profilePoints,
    required this.forumPoints,
  });

  int id;
  int userId;
  String imageUrl;
  String fullName;
  String about;
  String tckn;
  String address;
  String website;
  String phoneNumber;
  String email;
  String university;
  String experiences;
  String followingTitles;
  int profilePoints;
  int forumPoints;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        imageUrl: json["imageUrl"] == null
            ? 'https://i.pinimg.com/originals/38/5d/0f/385d0fe51772be669a4827e8aa7c7637.png'
            : json["imageUrl"],
        fullName:
            json["fullName"] == null ? 'Adınız Soyadınız' : json["fullName"],
        about: json["about"] == null
            ? 'Kısaca kendinizi tanıtınız'
            : json["about"],
        tckn: json["tckn"] == null
            ? 'TC Kimlik Numaranızı giriniz'
            : json["tckn"],
        address:
            json["address"] == null ? 'Adresinizi giriniz' : json["address"],
        website:
            json["website"] == null ? 'Websitenizi Giriniz' : json["website"],
        phoneNumber: json["phoneNumber"] == null
            ? 'Telefon Numaranızı Giriniz'
            : json["phoneNumber"],
        email: json["email"] == null
            ? 'E-posta adresinizi giriniz'
            : json["email"],
        university: json["university"] == null
            ? 'Üniversitenizi giriniz'
            : json["university"],
        experiences: json["experiences"] == null
            ? 'Mesleğinizi giriniz'
            : json["experiences"],
        followingTitles: json["followingTitles"] == null
            ? 'Takip listesi oluşturmadınız'
            : json["followingTitles"],
        profilePoints:
            json["profilePoints"] == null ? null : json["profilePoints"],
        forumPoints: json["forumPoints"] == null ? null : json["forumPoints"],
      );
}
