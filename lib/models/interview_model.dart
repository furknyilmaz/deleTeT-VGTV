class Interview {
  Interview({
    required this.id,
    required this.applicantName,
    required this.applicantId,
    required this.applicantIcon,
    required this.companyName,
    required this.companyId,
    required this.companyIcon,
    required this.applicationId,
    required this.title,
    required this.applicationDesc,
    required this.companyOfficer,
    required this.companyDepartment,
    required this.position,
    required this.interDate,
    required this.location,
    required this.applicationStatus,
    required this.interStatus,
  });

  int id;
  String applicantName;
  int applicantId;
  String applicantIcon;
  String companyName;
  int companyId;
  String companyIcon;
  int applicationId;
  String title;
  String applicationDesc;
  String companyOfficer;
  String companyDepartment;
  String position;
  String interDate;
  String location;
  String applicationStatus;
  String interStatus;

  factory Interview.fromJson(Map<String, dynamic> json) => Interview(
        id: json["id"],
        applicantName: json["applicantName"],
        applicantId: json["applicantId"],
        applicantIcon: json["applicantIcon"],
        companyName: json["companyName"],
        companyId: json["companyId"],
        companyIcon: json["companyIcon"],
        applicationId: json["applicationId"],
        title: json["title"],
        applicationDesc: json["applicationDesc"],
        companyOfficer: json["companyOfficer"],
        companyDepartment: json["companyDepartment"],
        position: json["position"],
        interDate: json["interDate"],
        location: json["location"],
        applicationStatus: json["applicationStatus"],
        interStatus: json["interStatus"],
      );
}
