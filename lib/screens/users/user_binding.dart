import 'package:get/instance_manager.dart';
import 'package:uitraining/logic/repositories/user_repositories.dart';
import 'package:uitraining/screens/users/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController(Get.find<UserRepositories>()));
  }
}
