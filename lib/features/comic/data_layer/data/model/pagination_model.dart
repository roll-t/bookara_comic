class PaginationModel {
  final int? totalItems;
  final int? totalItemsPerPage;
  final int? currentPage;
  final int? pageRanges;

  PaginationModel({
    this.totalItems,
    this.totalItemsPerPage,
    this.currentPage,
    this.pageRanges,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      totalItems: json['totalItems'],
      totalItemsPerPage: json['totalItemsPerPage'],
      currentPage: json['currentPage'],
      pageRanges: json['pageRanges'],
    );
  }
}
