import 'package:auto_find/main/user/data/model/user_model.dart';
import 'package:auto_find/main/user/domain/repositories/user_repository.dart';

class UserUseCase {
  final UserRepository _repository;

  UserUseCase(this._repository);

  Future<UserModel?> getUserById(String id) => _repository.getUserById(id);

  Future<List<UserModel>> getAllUsers() => _repository.getAllUsers();

  Future<UserModel> login(String email, String password) {
    final user = UserModel.login(email: email, password: password);
    return _repository.login(user);
  }

  Future<UserModel> register(String displayName, String email, String password,
      {String? photoURL}) {
    final user = UserModel.create(
      displayName: displayName,
      email: email,
      password: password,
      photoURL: photoURL,
    );
    return _repository.register(user);
  }

  Future<UserModel> updateUser(UserModel user) => _repository.updateUser(user);

  Future<void> deleteUser(String id) => _repository.deleteUser(id);
}
