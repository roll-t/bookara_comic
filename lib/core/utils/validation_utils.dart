import 'package:auto_find/core/config/const/app_enum.dart';
import 'package:auto_find/core/ui/widgets/dialogs/dialog_utils.dart';

class ValidationUtils {
  static bool validateRequiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      DialogUtils.showAlert(
        alertType: AlertType.error,
        title: "Thông báo",
        content: "$fieldName không được bỏ trống",
      );
      return false;
    }
    return true;
  }
}
