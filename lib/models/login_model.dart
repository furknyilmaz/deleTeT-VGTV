class LoginResponseModal {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? appUserRole;

  LoginResponseModal(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.appUserRole});

  factory LoginResponseModal.fromJson(Map<String, dynamic> json) {
    return LoginResponseModal(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'],
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
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? role;

  RegisterRequestModal(
      {this.firstName, this.lastName, this.email, this.password, this.role});

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> map = {
      'firstName': firstName?.trim(),
      'lastName': lastName?.trim(),
      'email': email?.trim(),
      'password': password?.trim(),
      'role': role,
    };
    return map;
  }
}

class RegisterResponseModal {
  String? name;
  String? email;
  String? password;

  RegisterResponseModal({this.name, this.email, this.password});

  factory RegisterResponseModal.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModal(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
