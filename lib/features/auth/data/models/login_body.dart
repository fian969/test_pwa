class LoginBody {
  final String email;
  final String password;

  const LoginBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };

  /// Jika kamu lebih suka langsung Map
  Map<String, dynamic> asMap() => toJson();
}
