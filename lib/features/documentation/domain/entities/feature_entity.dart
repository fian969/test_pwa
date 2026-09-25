class FeatureEntity {
  final String id;
  final String name;
  final String description;
  final String category;
  final String usage;
  final List<String> tags;
  final String example;
  final String? imageUrl;
  final DateTime? createdAt;

  FeatureEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.usage,
    required this.tags,
    required this.example,
    this.imageUrl,
    this.createdAt,
  });
}
