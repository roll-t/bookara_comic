import 'package:intl/intl.dart';

extension VietnamTimeExtension on String {
  String toVietnamTime({String pattern = 'dd/MM/yyyy'}) {
    DateTime utcTime = DateTime.parse(this);
    DateTime vnTime = utcTime.add(const Duration(hours: 7));
    return DateFormat(pattern).format(vnTime);
  }
}
