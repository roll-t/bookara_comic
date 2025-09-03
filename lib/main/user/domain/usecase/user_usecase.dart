import 'package:auto_find/core/config/const/app_enum.dart';
import 'package:auto_find/core/ui/widgets/dialogs/dialog_utils.dart';
import 'package:auto_find/main/user/data/model/user_model.dart';
import 'package:auto_find/main/user/domain/repositories/user_repository.dart';

class UserUseCase {
  final UserRepository _repository;

  UserUseCase(this._repository);

  Future<UserModel?> getUserById(String id) => _repository.getUserById(id);

  Future<List<UserModel>> getAllUsers() => _repository.getAllUsers();

  Future<bool> login(
    String email,
    String password,
  ) async {
    final user = UserModel(
      username: email,
      password: password,
    );
    try {
      final result = await _repository.login(user);
      return result is UserModel;
    } catch (e) {
      DialogUtils.showAlert(
        alertType: AlertType.error,
        title: "Đăng nhập thất bại",
        content: "$e",
      );
      return false;
    }
  }

  Future<UserModel> register(
    String displayName,
    String email,
    String password, {
    String? photoURL,
  }) {
    final user = UserModel.create(
      username: email,
      password: password,
    );
    return _repository.register(user);
  }

  Future<UserModel> updateUser(UserModel user) => _repository.updateUser(user);

  Future<void> deleteUser(String id) => _repository.deleteUser(id);
}