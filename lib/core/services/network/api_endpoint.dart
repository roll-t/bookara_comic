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

  static const cars = '/cars';
  static const allCars = '/cars/all';
  static String carDetail(int id) => '/cars/$id';
  static const carsCharts = '/cars/charts';
  static const carsProfitMatrix = '/cars/profit-matrix';
  static const carsSold = '/cars/sold';
  static const carsShowroom = '/cars/showroom';
  static const carsImported = '/cars/imported';
  static const carsTopBrands = '/cars/top/brands';
  static const carsTopProducts = '/cars/top/products';
  static const carsTopProfit = '/cars/top/profit';
  static const carsTopValue = '/cars/top/value';
  static const carsTopRecent = '/cars/top/recent';
}
