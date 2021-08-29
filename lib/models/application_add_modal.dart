class ApplicationAddModal {
  String? applicantId;
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
      'applicantId': applicantId?.trim(),
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
