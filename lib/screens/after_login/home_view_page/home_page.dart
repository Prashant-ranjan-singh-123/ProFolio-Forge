import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:resume_app1/screens/after_login/global_bottom_nav.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/ContactInfo.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Education.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Experience.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/PersonalStatement.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Projects.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Reference.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Skills.dart';
import 'package:resume_app1/screens/after_login/pdf_view_page/pdfScreen.dart';
import 'package:resume_app1/utils/bottom_nav_util/size_config.dart';
import 'package:resume_app1/utils/global_var.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
// ignore: non_constant_identifier_names
  void _contact_button() {
    print('hello');
    Get.to(const ContactInfo());
  }

  // ignore: non_constant_identifier_names
  void _education_button() {
    Get.to(const EducationDetail());
  }


  void _experience_button() {
    // Navigator.of(context).pushNamed('/exp');
    Get.to(const ExperienceDetail());
    // ExperienceDetail()
  }

  void _personal_statement_button() {
    // Navigator.of(context).pushNamed('/person');
    Get.to(const PersonalStatement());
    // PersonalStatement()
  }

  void _project_button() {
    // Navigator.of(context).pushNamed('/pro');
    Get.to(const ProjectsScreen());
    // ProjectsScreen()
  }

  void _reference_button() {
    // Navigator.of(context).pushNamed('/ref');
    Get.to(const ReferenceScreen());
    // ReferenceScreen()
  }

  void _skills_button() {
    // Navigator.of(context).pushNamed('/skill');
    Get.to(const SkillsScreen());
    // SkillsScreen()

  }

  void _view_cv() {
    Navigator.of(context).pushNamed('/pdf');
    Get.to(const PdfScreen());
    // PdfScreen()
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _drawerController = AwesomeDrawerBarController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 20, 44, 1),
      appBar: AppBar(
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
                  Scaffold.of(context).openDrawer();
                },
              ),
              const Text(
                'ProFolio Forge',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white),
              ).animate().fadeIn(duration: 1000.ms, delay: 500.ms),
              SizedBox()
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(82, 59, 153, 0.2),
      ),
      drawer: drawer_app(),
      body: Padding(
        padding: EdgeInsets.only(
            left: 15, right: 15, top: 15, bottom: bottomSkipWidth + 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Animate(
                  effects: [
                    FadeEffect(duration: 2000.ms),
                    SlideEffect(duration: 1000.ms, curve: Curves.decelerate)
                  ],
                  child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Lottie.asset('assets/lottie/create_resume.json'))),
              const AutoSizeText(
                maxLines: 1,
                'Create Your Resume Now',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white),
              ).animate().fadeIn(duration: 1000.ms, delay: 500.ms),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '--------Craft Your Career Legacy--------',
                style: TextStyle(fontFamily: 'OpenSans', color: Colors.white),
              )
                  .animate()
                  .fadeIn(duration: 1500.ms, delay: 500.ms)
                  .scaleY(duration: 1000.ms, curve: Curves.decelerate)
            ],
          ),
        ),
      ),
    );
  }

  Widget drawer_item(
      {required String heading,
      required IconData icon_name,
      required Function fun}) {
    return GestureDetector(
      onTap: () {
        fun();
      },
      child: ListTile(
        leading: Icon(
          icon_name,
          size: 25,
          color: Colors.blueGrey,
        ),
        title: Text(
          heading,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget drawer_app() {
    return Drawer(
      backgroundColor: Color.fromRGBO(10, 20, 44, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(25, 28, 64, 1),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/img/cv.png'),
                          ),
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ProFolio Forge',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  drawer_item(
                      heading: 'Contact Info',
                      icon_name: IconlyLight.call,
                      fun: _contact_button),
                  drawer_item(
                      heading: 'Personal Statement',
                      icon_name: Icons.stacked_bar_chart,
                      fun: _personal_statement_button),
                  drawer_item(
                      heading: 'Education',
                      icon_name: Icons.school,
                      fun: _education_button),
                  drawer_item(
                      heading: 'Key Skills',
                      icon_name: CupertinoIcons.skew,
                      fun: _skills_button),
                  drawer_item(
                      heading: 'Experience',
                      icon_name: Icons.work,
                      fun: _experience_button),
                  drawer_item(
                      heading: 'Projects',
                      icon_name: Icons.web,
                      fun: _project_button),
                  // drawer_item(
                  //     heading: 'Reference',
                  //     icon_name: IconlyBold.profile,
                  //     fun: _reference_button),
                  // drawer_item(
                  //     heading: 'View CV',
                  //     icon_name: Icons.remove_red_eye_outlined,
                  //     fun: _view_cv),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
