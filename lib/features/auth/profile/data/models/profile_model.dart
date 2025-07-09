class Authority {
  final String authority;

  Authority({required this.authority});

  factory Authority.fromJson(Map<String, dynamic> json) {
    return Authority(authority: json['authority']);
  }

  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
    };
  }
}

class UserModel {
  final int userId;
  final String username;
  final String password;
  final String email;
  final String confirmPassword;
  final String? theme;
  final String role;
  final bool enabled;
  final List<Authority> authorities;
  final bool accountNonExpired;
  final bool credentialsNonExpired;
  final bool accountNonLocked;

  UserModel({
    required this.userId,
    required this.username,
    required this.password,
    required this.email,
    required this.confirmPassword,
    required this.theme,
    required this.role,
    required this.enabled,
    required this.authorities,
    required this.accountNonExpired,
    required this.credentialsNonExpired,
    required this.accountNonLocked,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      confirmPassword: json['confirmPassword']??'',
      theme: json['theme'],
      role: json['role'],
      enabled: json['enabled'],
      authorities: (json['authorities'] as List)
          .map((e) => Authority.fromJson(e))
          .toList(),
      accountNonExpired: json['accountNonExpired'],
      credentialsNonExpired: json['credentialsNonExpired'],
      accountNonLocked: json['accountNonLocked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'password': password,
      'email': email,
      'confirmPassword': confirmPassword,
      'theme': theme,
      'role': role,
      'enabled': enabled,
      'authorities': authorities.map((e) => e.toJson()).toList(),
      'accountNonExpired': accountNonExpired,
      'credentialsNonExpired': credentialsNonExpired,
      'accountNonLocked': accountNonLocked,
    };
  }
}
