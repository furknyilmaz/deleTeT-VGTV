class Application {
  Application({
    required this.id,
    required this.applicantId,
    required this.companyName,
    required this.companyLocation,
    required this.companyIcon,
    required this.companyDesc,
    required this.applicationDate,
    required this.wayOfWorking,
    required this.advertsTitle,
    required this.advertsDescription,
    required this.status,
  });

  int id;
  int applicantId;
  String companyName;
  String companyLocation;
  String companyIcon;
  String companyDesc;
  String applicationDate;
  String wayOfWorking;
  String advertsTitle;
  String advertsDescription;
  int status;

  factory Application.fromJson(Map<String, dynamic> json) => Application(
        id: json["id"] == null ? null : json["id"],
        applicantId: json["applicantId"] == null ? null : json["applicantId"],
        companyName: json["companyName"] == null ? null : json["companyName"],
        companyLocation:
            json["companyLocation"] == null ? null : json["companyLocation"],
        companyIcon: json["companyIcon"] == null ? null : json["companyIcon"],
        companyDesc: json["companyDesc"] == null ? null : json["companyDesc"],
        applicationDate:
            json["applicationDate"] == null ? null : json["applicationDate"],
        wayOfWorking:
            json["wayOfWorking"] == null ? null : json["wayOfWorking"],
        advertsTitle:
            json["advertsTitle"] == null ? null : json["advertsTitle"],
        advertsDescription: json["advertsDescription"] == null
            ? null
            : json["advertsDescription"],
        status: json["status"] == null ? null : json["status"],
      );
}
