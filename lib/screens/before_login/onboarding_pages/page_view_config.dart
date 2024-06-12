import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resume_app1/screens/before_login/login_page/login.dart';
import 'package:resume_app1/screens/before_login/onboarding_pages/page_view_show.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
              onPageChanged: (int val) {
                if (val == 2) {
                  isLast = true;
                } else {
                  isLast = false;
                }
                setState(() {
                  isLast;
                });
              },
              controller: controller,
              children: [
                PageViewShow(
                  image_path: 'assets/lottie/onboard_1st.json',
                  heading: 'Create Your Profile',
                  isLottie: true,
                  subtitle:
                      'Easily build your professional profile. Input your personal details, work experience, education, skills, and more. Your resume will be securely saved with us, ready for future updates and revisions.',
                ),
                PageViewShow(
                  image_path: 'assets/lottie/onboard_2nd.json',
                  heading: 'Generate Your Resume',
                  isLottie: true,
                  subtitle:
                  'Effortlessly generate polished resumes tailored to your needs. Choose from a variety of sleek templates and customize them to showcase your unique skills and experiences. With just a few clicks, your professional document is ready to impress.',
                ),

                PageViewShow(
                  image_path: 'assets/lottie/create_resume.json',
                  heading: 'Check Your Resume ATS Score',
                  isLottie: true,
                  subtitle:
                  'Ensure your resume passes the Applicant Tracking System (ATS) with flying colors. Our built-in feature analyzes your resume\'s compatibility with ATS algorithms, providing insights and suggestions to enhance your chances of landing interviews.',
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isLast)
                    InkWell(
                        onTap: () {
                          controller.jumpToPage(2);
                        },
                        child: Container(
                          height: 40,
                          decoration: const BoxDecoration(
                              // color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ))
                  else
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          // color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Center(
                          child: Text('Skip',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(10, 20,44, 1),
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                        dotColor: Colors.white30,
                        activeDotColor: Colors.white,
                        // fixedCenter: true,
                        dotWidth: 8,
                        // activeDotScale: 1.1,
                        dotHeight: 8),
                  ),
                  if (!isLast)
                    InkWell(
                        onTap: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          height: 40,
                          decoration: const BoxDecoration(
                              // color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5))),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                          color: Colors.white,
                                    fontSize: 14, fontFamily: 'OpenSans',fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ))
                  else
                    InkWell(
                        onTap: () {
                          Get.off(const LoginPage(),
                              transition: Transition.fadeIn,
                              duration: const Duration(seconds: 1));
                        },
                        child: Container(
                          height: 40,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5))),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 18, left: 18),
                            child: Center(
                              child: Text(
                                'Done',
                                style: TextStyle(
                          color: Colors.white,
                                    fontSize: 14, fontFamily: 'OpenSans',fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}