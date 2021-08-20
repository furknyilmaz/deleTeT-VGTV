class LoginResponseModal {
  int? id;
  String? name;
  String? email;
  String? email_verified_at;
  String? created_at;
  String? updated_at;

  LoginResponseModal(
      {this.id,
      this.name,
      this.email,
      this.email_verified_at,
      this.created_at,
      this.updated_at});

  factory LoginResponseModal.fromJson(Map<String, dynamic> json) {
    return LoginResponseModal(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['emai'] as String,
      email_verified_at: json['email_verified_at'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
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
