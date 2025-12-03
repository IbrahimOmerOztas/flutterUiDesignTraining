import 'package:get/get.dart';
import 'package:uitraining/logic/repositories/user_repositories.dart';
import 'package:uitraining/models/user_model.dart';

class UserController extends GetxController {
  final UserRepositories _userRepositories;

  UserController(UserRepositories userRepositories)
    : _userRepositories = userRepositories;

  final isLoading = false.obs;
  final RxList<UserModel> users = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    try {
      final fetchedUsers = await _userRepositories.getUsers();

      users.value = fetchedUsers;
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
