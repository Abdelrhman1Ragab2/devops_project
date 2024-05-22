class WebUser {
  final int id;
  final String name;
  final String email;
  final String password;
  final String createdAt;

  WebUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
  });

  factory WebUser.fromJson(Map<String, dynamic> json) {
    return WebUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      createdAt: json['created_at'],
    );
  }

  static Map<String,dynamic> toJson(WebUser webUser) {
    return {
      'name': webUser.name,
      'email': webUser.email,
      'password':webUser.password,
    };

  }
}