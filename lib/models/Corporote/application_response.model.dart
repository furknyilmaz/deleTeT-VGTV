class ApplicationResponse {
  ApplicationResponse({
    required this.id,
    required this.applicantId,
    required this.companyId,
    required this.advertId,
    required this.companyName,
    required this.companyLocation,
    required this.companyIcon,
    required this.companyDesc,
    required this.applicationDate,
    required this.wayOfWorking,
    required this.advertsTitle,
    required this.advertsDescription,
    required this.advertsAbout,
    required this.status,
    required this.applicantName,
    required this.applicantImg,
    required this.applicantAbout,
  });

  int id;
  int applicantId;
  int companyId;
  int advertId;
  String companyName;
  String companyLocation;
  String companyIcon;
  String companyDesc;
  String applicationDate;
  String wayOfWorking;
  String advertsTitle;
  String advertsDescription;
  String advertsAbout;
  int status;
  String applicantName;
  String applicantImg;
  String applicantAbout;

  factory ApplicationResponse.fromJson(Map<String, dynamic> json) =>
      ApplicationResponse(
        id: json["id"],
        applicantId: json["applicantId"],
        companyId: json["companyId"],
        advertId: json["advertId"],
        companyName: json["companyName"],
        companyLocation: json["companyLocation"],
        companyIcon: json["companyIcon"],
        companyDesc: json["companyDesc"],
        applicationDate: json["applicationDate"],
        wayOfWorking: json["wayOfWorking"],
        advertsTitle: json["advertsTitle"],
        advertsDescription: json["advertsDescription"],
        advertsAbout: json["advertsAbout"],
        status: json["status"],
        applicantName: json["applicantName"],
        applicantImg: json["applicantImg"],
        applicantAbout: json["applicantAbout"],
      );
}
