class LoginResponseModal {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  LoginResponseModal({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory LoginResponseModal.fromJson(Map<String, dynamic> json) {
    return LoginResponseModal(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
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
