import 'package:uitraining/core/services/api_service.dart';
import 'package:uitraining/logic/repositories/user_repositories.dart';
import 'package:uitraining/models/user_model.dart';

class UserRepositoriesImpl implements UserRepositories {
  final ApiService _apiService;

  UserRepositoriesImpl(ApiService apiService) : _apiService = apiService;
  @override
  Future<List<UserModel>> getUsers() async {
    try {
      var response = await _apiService.get("users");

      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
