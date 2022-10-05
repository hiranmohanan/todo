import 'package:get/get.dart';
import 'package:todo_app/screens/details_screen.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/modify_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: '/login',
      page: () =>  LoginScreen(),
    ),
    GetPage(
      name: '/',
      page: () =>  HomeScreen(),
    ),
        GetPage(
      name: '/details',
      page: () =>  DetailsScreen(),
    ),
        GetPage(
      name: '/update',
      page: () =>   ModifyScreen(),
    ),
  ];
}
