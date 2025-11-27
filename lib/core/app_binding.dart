import 'package:get/get.dart';
import 'package:uitraining/core/services/api_service.dart';
import 'package:uitraining/logic/repositories/user_repositories.dart';
import 'package:uitraining/logic/repositories_impl/user_repositories_impl.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepositories>(
      () => UserRepositoriesImpl(Get.find<ApiService>()),
    );
  }
}
