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
      initialRoute: AppRoutes.users,
      getPages: AppRoutes.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:uitraining/screens/minimal_mobil_app/minimal_mobile_app.dart';

void main() {
  runApp(ModernMinimalListApp());
}

class ModernMinimalListApp extends StatelessWidget {
  const ModernMinimalListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xff5e81ac),
          primary: Color(0xff2e3440),
          onSurface: Color(0xff2e3440),
          surface: Color(0xfff5f5f5),
        ),
        iconTheme: IconThemeData(color: Color(0xff5e81ac)),
      ),
      home: MinimalMobileApp(),
    );
  }
}*/
