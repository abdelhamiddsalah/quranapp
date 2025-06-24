
  class Auth {
  final String message;
  final int status;
  final String? token; // ممكن يكون null

  Auth({
    required this.message,
    required this.status,
    this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
      token: json['token']??'', // ممكن تكون null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'token': token,
    };
  }
}

