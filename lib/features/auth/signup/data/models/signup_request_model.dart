class SignupRequestModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  SignupRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });


  Map<String, dynamic> toJson() {
    return {
      'username': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
