class ApiEndpoint {
  // ---------------------- Users ---------------------- //
  static const String users = '/users';
  static const String allUsers = '/users/all';

  /// Auth
  static const String login = '/users/login';
  static const String register = '/users/register'; // 👈 Thêm đăng ký

  /// CRUD User
  static String userDetail(String userId) => '/users/$userId';
  static String updateUser(String userId) => '/users/$userId';
  static String deleteUser(String userId) => '/users/$userId';

  /// Password
  static String updatePassword(String userId) => '/users/$userId/password';
  static String resetPassword(String userId) => '/users/$userId/reset-password';
}
