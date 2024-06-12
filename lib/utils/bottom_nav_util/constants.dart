import 'package:flutter/material.dart';
import 'package:resume_app1/utils/bottom_nav_util/sample_widget.dart';
import 'package:resume_app1/utils/bottom_nav_util/size_config.dart';

import '../../screens/after_login/home_view_page/home_page.dart';

List<Widget> screens = [
  Home_page(),
  const SampleWidget(
    label: 'Home',
    color: Colors.amber,
  ),
  const SampleWidget(
    label: 'View Resume',
    color: Colors.cyan,
  ),
  const SampleWidget(
    label: 'Ats Score',
    color: Colors.deepOrangeAccent,
  ),
  const SampleWidget(
    label: 'Profile',
    color: Colors.redAccent,
  ),
];

double animatedPositionedLEftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 8.5;
    case 1:
      return AppSizes.blockSizeHorizontal * 32.5;
    case 2:
      return AppSizes.blockSizeHorizontal * 55.5;
    case 3:
      return AppSizes.blockSizeHorizontal * 79;
    default:
      return 0;
  }
}
final List<Color> gradient = [
  Colors.white.withOpacity(0.8),
  Colors.white.withOpacity(0.5),
  Colors.transparent
];
