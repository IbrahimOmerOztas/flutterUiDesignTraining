import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:uitraining/screens/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: width,
                height: height * 0.42,
                decoration: BoxDecoration(color: Colors.blueGrey[100]),
                child: ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    final user = controller.users[index];
                    return Dismissible(
                      key: Key(user.id.toString()),
                      onDismissed: (direction) {
                        controller.moveToFilteredUsers(user);
                      },
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.center,
                        color: Colors.greenAccent,
                        child: Text(
                          "Aktar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(4),
                        child: GestureDetector(
                          onTap: () {
                            controller.moveToFilteredUsers(user);
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(),
                              title: Text(user.name),
                              subtitle: Text(user.email),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: height * 0.03),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: width,
                height: height * 0.42,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100], // Colors.,
                ),
                child: Obx(() {
                  final userList = controller.filteredUsers.values.toList();
                  return ListView.builder(
                    itemCount: controller.filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = userList[index];
                      return Dismissible(
                        key: Key(user.id.toString()),
                        onDismissed: (direction) {
                          controller.moveBackToUsers(user);
                        },
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(4),
                          child: GestureDetector(
                            onTap: () => controller.showInfo(user),
                            child: Card(
                              color: Colors.amber,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(),
                                title: Text(user!.name),
                                subtitle: Text(user.email),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
