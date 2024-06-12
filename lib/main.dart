import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:resume_app1/screens/after_login/global_bottom_nav.dart';
import 'package:resume_app1/screens/before_login/login_page/login.dart';
import 'package:resume_app1/utils/routes.dart';

import 'screens/SplashScreen.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: AppRoutes.routes,
      home: SplashScreen(),
      // home: LoginPage(),
      // home: GlobalBottomNav(),
    );
  }
}
