class DocumentationHistoryEntity {
  final String id;
  final String featureName;
  final String action;
  final DateTime timestamp;
  final String? notes;

  DocumentationHistoryEntity({
    required this.id,
    required this.featureName,
    required this.action,
    required this.timestamp,
    this.notes,
  });
}
