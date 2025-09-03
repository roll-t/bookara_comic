// class ApiResponse {
//   String? status;
//   String? message;
//   dynamic data;

//   ApiResponse({
//     this.status,
//     this.message,
//     this.data,
//   });

//   /// Parse from JSON
//   factory ApiResponse.fromJson(Map<String, dynamic> json) {
//     return ApiResponse(
//       status: json['status'],
//       message: json['message'],
//       data: json['data'],
//     );
//   }

//   /// Convert to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'data': data,
//     };
//   }

//   /// Optional: check if request is successful
//   bool get isSuccess => status == 'success';
// }
