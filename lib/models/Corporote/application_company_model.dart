class ApplicationCompany {
  ApplicationCompany({
    required this.id,
    required this.applicantId,
    required this.advertId,
    required this.companyName,
    required this.companyLocation,
    required this.companyIcon,
    required this.companyDesc,
    required this.applicationDate,
    required this.wayOfWorking,
    required this.advertsTitle,
    required this.advertsDescription,
    required this.status,
    required this.applicantName,
    required this.applicantImg,
    required this.applicantAbout,
  });

  int id;
  int applicantId;
  int advertId;
  String companyName;
  String companyLocation;
  String companyIcon;
  String companyDesc;
  String applicationDate;
  String wayOfWorking;
  String advertsTitle;
  String advertsDescription;
  String applicantName;
  String applicantImg;
  String applicantAbout;
  int status;

  factory ApplicationCompany.fromJson(Map<String, dynamic> json) =>
      ApplicationCompany(
        id: json["id"] == null ? null : json["id"],
        applicantId: json["applicantId"] == null ? null : json["applicantId"],
        advertId: json["advertId"] == null ? null : json["advertId"],
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
        applicantName:
            json["applicantName"] == null ? null : json["applicantName"],
        applicantImg:
            json["applicantImg"] == null ? null : json["applicantImg"],
        applicantAbout:
            json["applicantAbout"] == null ? null : json["applicantAbout"],
      );

  get length => null;
}
