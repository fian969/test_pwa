import 'package:flutter_setup_clean_architectute/features/documentation/domain/entities/feature_entity.dart';

class FeatureModel extends FeatureEntity {
  FeatureModel({
    required super.id,
    required super.name,
    required super.description,
    required super.category,
    required super.usage,
    required super.tags,
    required super.example,
    super.imageUrl,
    super.createdAt,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      usage: json['usage'] as String,
      tags: List<String>.from(json['tags'] as List),
      example: json['example'] as String,
      imageUrl: json['imageUrl'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'usage': usage,
      'tags': tags,
      'example': example,
      'imageUrl': imageUrl,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
