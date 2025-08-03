import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoint {
  ///---> [Root-service]
  static final String baseUrl = dotenv.env["API_COMICS_KEY"] ?? "/";

  // Home
  static const String home = '/home';

  // List
  static String list(String type) => '/danh-sach/$type';

  // Categories
  static const String categories = '/the-loai';
  static String categoryDetail(String slug) => '/the-loai/$slug';

  // Comic detail
  static String comicDetail(String slug) => '/truyen-tranh/$slug';

  // Search
  static const String search = '/tim-kiem';
}
