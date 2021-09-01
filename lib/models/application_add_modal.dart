class ApplicationAddModal {
  int? applicantId;
  int? companyid;
  int? advertId;
  String? companyName;
  String? companyLocation;
  String? companyIcon;
  String? companyDesc;
  String? applicationDate;
  String? wayOfWorking;
  String? advertsTitle;
  String? advertsDescription;
  int? status;

  ApplicationAddModal({
    this.applicantId,
    this.companyid,
    this.advertId,
    this.companyName,
    this.companyLocation,
    this.companyIcon,
    this.companyDesc,
    this.applicationDate,
    this.wayOfWorking,
    this.advertsTitle,
    this.advertsDescription,
    this.status,
  });

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> map = {
      'applicantId': applicantId,
      'companyId': companyid,
      'advertId': advertId,
      'companyName': companyName?.trim(),
      'companyLocation': companyLocation?.trim(),
      'companyIcon': companyIcon?.trim(),
      'companyDesc': companyDesc?.trim(),
      'applicationDate': applicationDate?.trim(),
      'wayOfWorking': wayOfWorking?.trim(),
      'advertsTitle': advertsTitle?.trim(),
      'advertsDescription': advertsDescription?.trim(),
      'status': status
    };
    return map;
  }
}
