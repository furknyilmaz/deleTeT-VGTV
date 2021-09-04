class ApplicationAddModal {
  int? applicantId;
  int? companyid;
  int? advertId;
  int? status;

  ApplicationAddModal({
    this.applicantId,
    this.companyid,
    this.advertId,
    this.status,
  });

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> map = {
      'applicantId': applicantId,
      'companyId': companyid,
      'advertId': advertId,
      'status': status
    };
    return map;
  }
}
