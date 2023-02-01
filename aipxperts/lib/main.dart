import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:test_demo/controller/apihomepage.dart';
import 'package:test_demo/pages/Ui_pages.dart/Addproduct.dart';
import 'package:test_demo/pages/Ui_pages.dart/aboutus.dart';
import 'package:test_demo/pages/Ui_pages.dart/cart_page_new.dart';
import 'package:test_demo/pages/Ui_pages.dart/category.dart';
import 'package:test_demo/pages/Ui_pages.dart/homepage.dart';
import 'package:test_demo/pages/Ui_pages.dart/loginsinup.dart';
import 'package:test_demo/pages/Ui_pages.dart/mail(homepage).dart';
import 'package:test_demo/pages/Ui_pages.dart/notificationpage.dart';
import 'package:test_demo/pages/Ui_pages.dart/profile.dart';
import 'package:test_demo/pages/Ui_pages.dart/signup.dart';
import 'package:test_demo/pages/apireleted.dart';
import 'package:test_demo/pages/cart_page.dart';
import 'package:test_demo/pages/extrapage/launguage.dart';
import 'package:test_demo/pages/internetcheck.dart';
import 'package:test_demo/pages/Ui_pages.dart/introdution_page.dart';
import 'package:test_demo/pages/Ui_pages.dart/login_page.dart';
import 'package:test_demo/pages/extrapage/shared.dart';
import 'package:test_demo/utiles/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  Singleton.instance.isInternetConnected().then((intenet) {
    if (intenet != null && intenet) {
      Get.to(apiHomePage());
    } else {
      Get.to(const signup());
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        translations: launguage(),
        locale: const Locale('en' 'US'),
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        routes: {
          "/": (contex) => apiHomePage(),
          // HomePagedemo(),
          // MyRoutes.homeRoutes: (context) => const HomePage(),
          MyRoutes.loginRoutes: (context) => const LoginPage(),
          MyRoutes.logout: (context) => const LoginPage(),
          MyRoutes.profileRoutes: (context) => const ProfileScreen(),
          MyRoutes.Aboutus: (context) => const Aboutus(),
          MyRoutes.HomePage1: (context) => const HomePage1(),
          // MyRoutes.forgetpwd: (context) => const forgetpwd(),
          MyRoutes.signup: (context) => const signup(),
          MyRoutes.NotificationPage: (context) => const NotificationPage(),
          MyRoutes.MyDrawer: (context) => const Drawer(),
          // MyRoutes.setting2: (context) => const setting(),
          MyRoutes.Addproduct: (context) => Addproduct(),
          // MyRoutes.mainhomepage: (context) => const mainhomepage(),
          MyRoutes.loginsinguppage: (context) => const loginsinguppage(),

          MyRoutes.apireleted: (context) => const apireleted(),
          MyRoutes.loginsinguppage: (context) => const loginsinguppage(),
          // MyRoutes.cart_page:(context) => cart_page(catalog: catalog);

          MyRoutes.HomePagedemo: (context) => const HomePagedemo(),
          MyRoutes.category: (context) => category(),
          MyRoutes.CartPageNew: (context) => CartPageNew(),
          MyRoutes.OnBoardingPage: (context) => OnBoardingPage(),
          MyRoutes.cart_page: (context) => const cart_page(),

          // MyRoutes.mainhomepage2: (context) => const mainhomepage2(),
          MyRoutes.SharedPreferencesDemo: (context) =>
              const SharedPreferencesDemo(),
        },
      ),
    );
  }

  static init() {}
}
