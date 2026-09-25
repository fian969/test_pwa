import '../../domain/entities/users.dart';

class UserByIdModel extends Users {
  const UserByIdModel({
    required super.id,
    required super.name,
    required super.email,
    super.username,
    super.phoneNumber,
    super.roleId,
    super.roleName,
    super.entitasId,
    super.store,
    super.parent,
    super.lastLogin,
    super.createdAt,
    super.updatedAt,
  });

  factory UserByIdModel.fromJson(Map<String, dynamic> json) {
    return UserByIdModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      username: json['username'] as String?,
      phoneNumber: json['phone_number'] as String?,
      roleId: (json['role_id'] as num?)?.toInt(),
      roleName: json['role_name'] as String?,
      entitasId: (json['entitas_id'] as num?)?.toInt(),
      store: json['store'] != null
          ? StoreUserModel.fromJson(json['store'] as Map<String, dynamic>)
          : null,
      parent: json['parent'] != null
          ? ParentModel.fromJson(json['parent'] as Map<String, dynamic>)
          : null,
      lastLogin: json['last_login'] != null
          ? DateTime.tryParse(json['last_login'] as String)
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'role_id': roleId,
        'role_name': roleName,
        'entitas_id': entitasId,
        'store': store is StoreUserModel
            ? (store as StoreUserModel).toJson()
            : (store != null
                ? {
                    'id': store!.id,
                    'name': store!.name,
                    'address': store!.address,
                    'code': store!.code,
                  }
                : null),
        'parent': parent is ParentModel
            ? (parent as ParentModel).toJson()
            : (parent != null
                ? {
                    'id': parent!.id,
                    'name': parent!.name,
                    'role': parent!.role,
                  }
                : null),
        'last_login': lastLogin?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

/// Model untuk parent yang kompatibel dengan entitas
class ParentModel extends Parent {
  const ParentModel({
    required super.id,
    required super.name,
    required super.role,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) => ParentModel(
        id: (json['id'] as num).toInt(),
        name: json['name'] as String,
        role: json['role'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'role': role,
      };
}

/// ⬇️ Model untuk store
class StoreUserModel extends StoreUser {
  const StoreUserModel({
    required super.id,
    required super.name,
    required super.address,
    required super.code,
  });

  factory StoreUserModel.fromJson(Map<String, dynamic> json) => StoreUserModel(
        id: (json['id'] as num).toInt(),
        name: json['name'] as String,
        address: json['address'] as String,
        code: json['code'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'code': code,
      };
}
