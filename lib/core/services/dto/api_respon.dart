class ApiRespon {
  String? status;
  String? message;
  dynamic data;

  ApiRespon({
    this.status,
    this.message,
    this.data,
  });

  /// Parse from JSON
  factory ApiRespon.fromJson(Map<String, dynamic> json) {
    return ApiRespon(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }

  /// Optional: check if request is successful
  bool get isSuccess => status == 'success';
}
