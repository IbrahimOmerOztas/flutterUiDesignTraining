import 'package:uitraining/models/user_model.dart';

abstract class UserRepositories {
  Future<List<UserModel>> getUsers();
}
