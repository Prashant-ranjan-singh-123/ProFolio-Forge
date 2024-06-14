import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:resume_app1/utils/bottom_nav_util/bottom_nav_btn.dart';
import 'package:resume_app1/utils/bottom_nav_util/clipper.dart';
import 'package:resume_app1/utils/bottom_nav_util/constants.dart';
import 'package:resume_app1/utils/bottom_nav_util/size_config.dart';
import 'package:resume_app1/utils/global_var.dart';

class GlobalBottomNav extends StatefulWidget {
  const GlobalBottomNav({Key? key}) : super(key: key);

  @override
  _GlobalBottomNavState createState() => _GlobalBottomNavState();
}

class _GlobalBottomNavState extends State<GlobalBottomNav> {
  int _currentIndex = 0;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(
        milliseconds: 400,
      ),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 20, 44, 1),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    controller: pageController,
                    children: screens,
                  ),
                ),
                SizedBox(
                  height: bottomSkipWidth,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: bottomNav(),
          ).animate().slideY(
            begin: 12,
            // delay: 150.ms,
            duration: 2000.ms,
            curve: Curves.decelerate,
          ),
        ],
      ),
    );
  }

  Widget bottomNav() {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        height: AppSizes.blockSizeHorizontal * 17,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(25, 26, 64, 1),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: AppSizes.blockSizeHorizontal * 3,
              right: AppSizes.blockSizeHorizontal * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomNavBTN(
                    onPressed: (val) {
                      animateToPage(val);
                      setState(() {
                        _currentIndex = val;
                      });
                    },
                    icon: IconlyLight.home,
                    currentIndex: _currentIndex,
                    index: 0,
                  ),
                  BottomNavBTN(
                    onPressed: (val) {
                      animateToPage(val);

                      setState(() {
                        _currentIndex = val;
                      });
                    },
                    icon: IconlyLight.paper,
                    currentIndex: _currentIndex,
                    index: 1,
                  ),
                  BottomNavBTN(
                    onPressed: (val) {
                      animateToPage(val);
                      setState(() {
                        _currentIndex = val;
                      });
                    },
                    icon: Icons.auto_fix_high_rounded,
                    currentIndex: _currentIndex,
                    index: 2,
                  ),
                  BottomNavBTN(
                    onPressed: (val) {
                      animateToPage(val);

                      setState(() {
                        _currentIndex = val;
                      });
                    },
                    icon: IconlyLight.profile,
                    currentIndex: _currentIndex,
                    index: 3,
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
              top: 0,
              left: animatedPositionedLEftValue(_currentIndex),
              child: Column(
                children: [
                  Container(
                    height: AppSizes.blockSizeHorizontal * 1.0,
                    width: AppSizes.blockSizeHorizontal * 12,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      height: AppSizes.blockSizeHorizontal * 15,
                      width: AppSizes.blockSizeHorizontal * 12,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: gradient,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
