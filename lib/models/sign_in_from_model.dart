class SignInFromModel {
  final String? email;
  final String? password;

  SignInFromModel({
    this.email,
    this.password,
  });

  Map<String, dynamic>? toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
