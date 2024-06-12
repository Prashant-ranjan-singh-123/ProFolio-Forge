import 'package:flutter/material.dart';
import 'package:resume_app1/screens/before_login/login_page/login.dart';
import 'package:resume_app1/screens/before_login/onboarding_pages/page_view_config.dart';
import 'package:resume_app1/utils/shared_pref.dart';

class OnboardingOrMainScreen extends StatelessWidget {
  const OnboardingOrMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckFirstRun.setFirstRunBoolOnboardFalse();
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return waitingScreen();
          } else {
            if (snap.hasError) {
              return hasError();
            } else {
              bool isFirstRunVar = snap.data as bool;
              if (isFirstRunVar) {
                return const OnBoardingScreen();
              } else {
                return const OnBoardingScreen();
                // return const LoginPage();
                // return const BottomNavBar();
              }
            }
          }
        },
        future: CheckFirstRun.isFirstRunOnboard(),
      ),
    );
  }

  Widget waitingScreen() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget hasError() {
    return const Center(
      child: Card(
        child: Column(
          children: [
            Text(
              'Error Occur',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins'),
            ),
            Text(
              'Some Error Occur Please Contact the developer at prashant.singh.12312345@gmail.com with screen shot of application',
              style: TextStyle(fontFamily: 'OpenSans'),
            )
          ],
        ),
      ),
    );
  }
}