class ListModel<T> {
  final List<T> items;
  final String? nextPageToken;

  ListModel({
    required this.items,
    this.nextPageToken,
  });

  /// Parse từ JSON với function convert
  factory ListModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];
    final values = itemsJson
        .map((e) => fromJsonT(e as Map<String, dynamic>))
        .toList();

    return ListModel(
      items: values,
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  /// Convert ngược lại sang JSON
  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'items': items.map((e) => toJsonT(e)).toList(),
      'nextPageToken': nextPageToken,
    };
  }
}
