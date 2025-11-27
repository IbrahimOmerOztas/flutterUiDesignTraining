import 'package:get/get.dart';
import 'package:uitraining/logic/repositories/user_repositories.dart';
import 'package:uitraining/models/user_model.dart';

class HomeController extends GetxController {
  final UserRepositories _userRepositories;

  HomeController(UserRepositories userRepositories)
    : _userRepositories = userRepositories;

  final RxList<UserModel> users = RxList([]);
  final RxMap<int, UserModel> filteredUsers = RxMap({});
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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

  void filterUsers(UserModel user) {
    if (!filteredUsers.containsKey(user.id)) {
      filteredUsers[user.id] = user;
    }
  }

  void showInfo(UserModel user) {
    Get.snackbar("${user.id}", "${user.name} ${user.username}");
  }

  void moveToFilteredUsers(UserModel user) {
    filteredUsers[user.id] = user;
    users.remove(user);
  }

  void moveBackToUsers(UserModel user) {
    users.add(user);
    filteredUsers.remove(user.id);
  }
}
