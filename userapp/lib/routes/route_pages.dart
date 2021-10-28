import 'package:get/get.dart';
import 'package:userapp/pages/loginpage/login_view.dart';
import 'package:userapp/pages/splashscreen/splashscreen_view.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: "/SplashScreen",
      page: () => SplashScreen(),
    ),
    GetPage(
      name: "/login",
      page: () => LoginView(),
    ),
  ];
}
