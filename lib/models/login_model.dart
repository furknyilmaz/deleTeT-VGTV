class LoginResponseModal {
  int? id;
  String? fullName;
  String? email;
  String? password;
  String? appUserRole;

  LoginResponseModal(
      {this.id, this.fullName, this.email, this.password, this.appUserRole});

  factory LoginResponseModal.fromJson(Map<String, dynamic> json) {
    return LoginResponseModal(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      appUserRole: json['appUserRole'] as String,
    );
  }
}

class LoginRequestModal {
  String? email;
  String? password;

  LoginRequestModal({this.email, this.password});

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> map = {
      'email': email?.trim(),
      'password': password?.trim(),
    };
    return map;
  }
}

class RegisterRequestModal {
  String? fullName;
  String? email;
  String? password;
  int? role;

  RegisterRequestModal({this.fullName, this.email, this.password, this.role});

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> map = {
      'fullName': fullName?.trim(),
      'email': email?.trim(),
      'password': password?.trim(),
      'role': role,
    };
    return map;
  }
}

class RegisterResponseModal {
  String? fullName;
  String? email;
  String? password;

  RegisterResponseModal({this.fullName, this.email, this.password});

  factory RegisterResponseModal.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModal(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}

class ProfileUpdateModal {
  String? fullName;
  String? tckn;
  String? website;
  String? phoneNumber;
  String? university;
  String? experiences;
  String? address;
  String? imageUrl;
  String? about;

  ProfileUpdateModal({
    this.fullName,
    this.tckn,
    this.website,
    this.phoneNumber,
    this.university,
    this.experiences,
    this.address,
    this.imageUrl,
    this.about,
  });

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> map = {
      'fullName': fullName?.trim(),
      'tckn': tckn?.trim(),
      'website': website?.trim(),
      'phoneNumber': phoneNumber?.trim(),
      'university': university?.trim(),
      'experiences': experiences?.trim(),
      'address': address,
      'imageUrl': imageUrl,
      'about': about
    };
    return map;
  }
}
