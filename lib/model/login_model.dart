class LoginModel {
  String email;
  String password;

  LoginModel({required this.email, required this.password});

  Map<String, dynamic> toJSON() {
    return {"email": email, "password": password};
  }
}
