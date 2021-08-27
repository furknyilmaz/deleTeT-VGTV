class Advers {
  Advers({
    required this.id,
    required this.userName,
    required this.companyName,
    required this.companyLocaliton,
    required this.companyIcon,
    required this.companyDesc,
    required this.adversDate,
    required this.wayOfWorking,
    required this.adversAbout,
    required this.adversTitle,
    required this.adversDescription,
  });
  int id;
  String userName;
  String companyName;
  String companyLocaliton;
  String companyIcon;
  String companyDesc;
  String adversDate;
  String wayOfWorking;
  String adversAbout;
  String adversTitle;
  String adversDescription;

  factory Advers.fromJson(Map<String, dynamic> json) => Advers(
        id: json['id'] as int,
        userName: json["userName"] as String,
        companyName: json["companyName"] as String,
        companyLocaliton: json["companyLocaliton"] as String,
        companyIcon: json["companyIcon"] as String,
        companyDesc: json["companyDesc"] as String,
        adversDate: json["adversDate"] as String,
        wayOfWorking: json["wayOfWorking"] as String,
        adversAbout: json["adversAbout"] as String,
        adversTitle: json["adversTitle"] as String,
        adversDescription: json["adversDescription"] as String,
      );
}
