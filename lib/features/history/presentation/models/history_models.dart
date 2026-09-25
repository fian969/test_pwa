class HistoryItem {
  final String featureName;
  final String action;
  final DateTime timestamp;
  final String category;

  HistoryItem({
    required this.featureName,
    required this.action,
    required this.timestamp,
    required this.category,
  });
}
