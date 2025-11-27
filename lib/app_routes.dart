import 'package:get/get_navigation/get_navigation.dart';
import 'package:uitraining/screens/home/home_binding.dart';
import 'package:uitraining/screens/home/home_screen.dart';

abstract class AppRoutes {
  static const String home = '/home';

  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
