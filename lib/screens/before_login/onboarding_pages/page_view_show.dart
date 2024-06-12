import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewShow extends StatelessWidget {
  String image_path;
  String heading;
  String subtitle;
  bool isLottie;
  PageViewShow(
      {super.key,
      required this.image_path,
      required this.heading,
      required this.subtitle,
      required this.isLottie
      });

  @override
  Widget build(BuildContext context) {
    // String imagePath = 'assets/image/onboarding_page1.jpg';
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 20,44, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(height: MediaQuery.of(context).size.height * 0.13),
          if (isLottie) Center(
            child: SizedBox(
                  width: 350,
                  height: 350,
                  child: Lottie.asset(image_path, reverse: true,),
                ).animate()
                .scale(duration: 1000.ms, curve: Curves.decelerate)
                .fadeIn(duration: 2000.ms),
          )
              else 
              Image.asset(image_path,)
              .animate()
              .scale(duration: 1000.ms, curve: Curves.decelerate)
              .fadeIn(duration: 2000.ms),
          const SizedBox(height: 10),
          Text(heading,
          textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins')).animate()
              .scale(duration: 1000.ms, curve: Curves.decelerate)
              .fadeIn(duration: 2000.ms),
          const SizedBox(height: 15),
          SizedBox(
            width: Get.width * 0.8,
            child: Text(
              subtitle,
              style: const TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.white60,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              textAlign: TextAlign.center,
            ).animate()
                .scale(duration: 1000.ms, curve: Curves.decelerate)
                .fadeIn(duration: 2000.ms),
          ),
        ],
      ),
    );
  }
}