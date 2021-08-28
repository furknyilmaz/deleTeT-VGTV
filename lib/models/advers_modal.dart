class Advers {
  Advers({
    required this.categoryId,
    required this.companyName,
    required this.companyLocation,
    required this.companyIcon,
    required this.companyDesc,
    required this.advertsDate,
    required this.wayOfWorking,
    required this.advertsAbout,
    required this.advertsTitle,
    required this.advertsDescription,
  });
  int categoryId;
  String companyName;
  String companyLocation;
  String companyIcon;
  String companyDesc;
  String advertsDate;
  String wayOfWorking;
  String advertsAbout;
  String advertsTitle;
  String advertsDescription;

  factory Advers.fromJson(Map<String, dynamic> json) => Advers(
        categoryId: json['categoryId'] == null ? null : json['categoryId'],
        companyName: json["companyName"] == null ? null : json["companyName"],
        companyLocation:
            json["companyLocation"] == null ? null : json["companyLocation"],
        companyIcon: json["companyIcon"] == null ? null : json["companyIcon"],
        companyDesc: json["companyDesc"] == null ? null : json["companyDesc"],
        advertsDate: json["advertsDate"] == null ? null : json["advertsDate"],
        wayOfWorking:
            json["wayOfWorking"] == null ? null : json["wayOfWorking"],
        advertsAbout:
            json["advertsAbout"] == null ? null : json["advertsAbout"],
        advertsTitle:
            json["advertsTitle"] == null ? null : json["advertsTitle"],
        advertsDescription: json["advertsDescription"] == null
            ? null
            : json["advertsDescription"],
      );
}
