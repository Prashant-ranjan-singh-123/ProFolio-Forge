import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class MyAppBar {
  static AppBar customAppBar({required String title}) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Builder(
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                IconlyLight.filter,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(82, 59, 153, 0.2),
    );
  }

  static AppBar customAppBarWithRRightButton({required String title, required Function fun}) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Builder(
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                IconlyLight.filter,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                fun();
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(82, 59, 153, 0.2),
    );
  }
}
