import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? username;
  final String? phoneNumber;
  final int? roleId;
  final String? roleName;
  final int? entitasId;
  final StoreUser? store;
  final Parent? parent;
  final DateTime? lastLogin;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Users({
    required this.id,
    required this.name,
    required this.email,
    this.username,
    this.phoneNumber,
    this.roleId,
    this.roleName,
    this.entitasId,
    this.store,
    this.parent,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        username,
        phoneNumber,
        roleId,
        roleName,
        entitasId,
        store,
        parent,
        lastLogin,
        createdAt,
        updatedAt,
      ];
}

class Parent extends Equatable {
  final int id;
  final String name;
  final String role;

  const Parent({
    required this.id,
    required this.name,
    required this.role,
  });

  @override
  List<Object?> get props => [id, name, role];
}

/// ⬇️ entitas baru untuk store
class StoreUser extends Equatable {
  final int id;
  final String name;
  final String address;
  final String code;

  const StoreUser({
    required this.id,
    required this.name,
    required this.address,
    required this.code,
  });

  @override
  List<Object?> get props => [id, name, address, code];
}
