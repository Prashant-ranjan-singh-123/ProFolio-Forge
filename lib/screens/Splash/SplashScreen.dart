
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/route_manager.dart';
import 'package:resume_app1/screens/homeScreen/login%20page/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

Future<void> changeScreen() async {
  Timer(Duration(seconds: 3), () {
    Get.off(const LoginPage(), transition: Transition.fadeIn, duration: 500.ms);
  });
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    changeScreen();
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 26, 33, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/cv.png')
                .animate()
                .fadeIn(duration: 2000.ms)
                .slideY(duration: 1000.ms, curve: Curves.decelerate),
            const Text(
              'ProFolio Forge',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, fontFamily: 'Poppins', color: Colors.white),
            ).animate().fadeIn(duration: 1000.ms, delay: 500.ms),
            const SizedBox(height: 5,),
            const Text('--------Craft Your Career Legacy--------', style: TextStyle(fontFamily: 'OpenSans', color: Colors.white),)
                .animate()
                .fadeIn(duration: 1500.ms, delay: 500.ms).scaleY(
                duration: 1000.ms, curve: Curves.decelerate
            )
          ],
        ),
      ),
    );
  }
}
