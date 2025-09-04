import 'package:auto_find/core/local_storage/app_get_storage.dart';
import 'package:auto_find/main/user/data/model/auth_response.dart';
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
      final AuthResponse? result = await _repository.login(user);
      if (result != null) {
        AppGetStorage.saveToken(result.token);
        AppGetStorage.saveUser(result.user);
        return true;
      }
      return false;
    } catch (e) {
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
