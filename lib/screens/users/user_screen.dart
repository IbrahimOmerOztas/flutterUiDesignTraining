import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uitraining/screens/users/user_controller.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});
  final UserController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.purple,
        backgroundColor: Colors.yellow,
        title: Text("User Screen"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          final users = controller.users.value;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        }
      }),
    );
  }
}
