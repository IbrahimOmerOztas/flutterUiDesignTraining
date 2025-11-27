import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uitraining/app_routes.dart';
import 'package:uitraining/core/app_binding.dart';
import 'package:uitraining/core/services/api_service.dart';
import 'package:uitraining/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<ApiService>(() async => await ApiService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
