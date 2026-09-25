import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final List<String> roles;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
  });

  @override
  List<Object?> get props => [id, name, email, roles];
}
