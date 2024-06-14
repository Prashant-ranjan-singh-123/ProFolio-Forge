import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:resume_app1/shared/dialog_box/under_development_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/ContactInfo.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Education.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Experience.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/PersonalStatement.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Projects.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Skills.dart';

class ProfilePage extends StatelessWidget {
  List<Function> moreFunctions=[];

  ProfilePage() {
    moreFunctions = [
      contributeToProjectFunction,
      connectOnLinkedInFunction,
      reportABugFunction,
      privacyPolicyFunction,
      licenceFunction
    ];
  }

  List<String> drawer_name = [
    'Contact Info',
    'Professional Summary',
    'Education',
    'Key Skills',
    'Experience',
    'Projects'
  ];

  List<String> drawer_subheading = [
    'Edit Contact',
    'Edit Summary',
    'Edit Education',
    'Edit Skills',
    'Edit Experience',
    'Edit Projects'
  ];

  List<IconData> drawer_icon = [
    IconlyLight.call,
    Icons.stacked_bar_chart,
    Icons.school,
    CupertinoIcons.skew,
    Icons.work,
    Icons.web
  ];

  List<Widget> drawer_page = [
    const ContactInfo(),
    const PersonalStatement(),
    const EducationDetail(),
    const SkillsScreen(),
    const ExperienceDetail(),
    const ProjectsScreen()
  ];

  List<String> more_title = [
    'Contribute To Project',
    'Connect On Linkedin',
    'Report A Bug',
    'Privacy Policy',
    'Licence',
  ];

  List<IconData> more_icons = [
    MdiIcons.github,
    MdiIcons.linkedin,
    MdiIcons.bug,
    MdiIcons.note,
    MdiIcons.license
  ];

  Future<void> contributeToProjectFunction() async {
    // Your implementation here
    Future<bool> isGithubInInstalled() async {
      Uri url = Uri.parse('github://');
      if (await canLaunchUrl(url)) {
        return true;
      } else {
        return false;
      }
    }

    String dt =
        'https://github.com/Prashant-ranjan-singh-123/shoe_haven';
    bool isInstalled = await isGithubInInstalled();
    if (isInstalled != false) {
      AndroidIntent intent = AndroidIntent(action: 'action_view', data: dt);
      await intent.launch();
    } else {
      Uri url = Uri.parse(dt);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    
  }

  Future<void> connectOnLinkedInFunction() async {
    // Your implementation here
    Future<bool> isLinkedInInstalled() async {
      Uri url = Uri.parse('linkedin://');
      if (await canLaunchUrl(url)) {
        return true;
      } else {
        return false;
      }
    }

    String dt = 'https://www.linkedin.com/in/prashant-ranjan-singh-b9b6b9217/';
    bool isInstalled = await isLinkedInInstalled();
    if (isInstalled != false) {
      AndroidIntent intent = AndroidIntent(action: 'action_view', data: dt);
      await intent.launch();
    } else {
      Uri url = Uri.parse(dt);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  void reportABugFunction() {
    // Your implementation here
    Development.showDialogBox();
  }

  void privacyPolicyFunction() {
    // Your implementation here
  }

  void licenceFunction() {
    // Your implementation here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 20, 44, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(82, 59, 153, 0),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              top_card_widget(),
              heading(title: 'User Detals', top_padding: 40),
              project_detail_items(),
              heading(title: 'More', top_padding: 30),
              more_detail_items(),
              thank_you()
            ],
          ),
        ),
      ),
    );
  }

  Widget top_card_widget() {
    return SizedBox(
      width: Get.width,
      child: Card(
        color: const Color.fromRGBO(25, 26, 64, 1),
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: Get.height * 0.14 - 35,
                height: Get.height * 0.14 - 35,
                decoration: const ShapeDecoration(
                  shadows: [
                    BoxShadow(color: const Color.fromRGBO(12, 20, 44, 1))
                  ],
                  image: DecorationImage(
                    image: AssetImage("assets/img/person.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
              const SizedBox(width: 15),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Prashant Ranjan Singh',
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AutoSizeText(
                    '7067597028',
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget heading({required title, required double top_padding}) {
    return Padding(
      padding: EdgeInsets.only(top: top_padding),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Merriweater',
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget project_detail_items() {
    Widget goto_card(
        {required IconData icon,
        required String label,
        required String subHeading,
        required Widget wid}) {
      return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GestureDetector(
          onTap: () {
            Get.to(wid);
          },
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(12, 20, 44, 1)),
                // border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(96, 84, 163, 1),
                      blurRadius: 10,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.outer)
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                        size: Get.height * 0.03,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            label,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              fontFamily: 'Merriweather',
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AutoSizeText(
                            subHeading,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (_, index) {
        return goto_card(
            icon: drawer_icon[index],
            label: drawer_name[index],
            subHeading: drawer_subheading[index],
            wid: drawer_page[index]);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: drawer_page.length,
    );
  }

  Widget more_detail_items() {
    Widget goto_card(
        {required IconData icon,
        required String label,
        required Function wid}) {
      return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GestureDetector(
          onTap: () {
            wid();
          },
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(25, 26, 64, 1),
                border: Border.all(color: const Color.fromRGBO(12, 20, 44, 1)),
                // border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(96, 84, 163, 1),
                      blurRadius: 10,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.outer)
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                        size: Get.height * 0.03,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      AutoSizeText(
                        label,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          fontFamily: 'Merriweather',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (_, index) {
        return goto_card(
            icon: more_icons[index],
            label: more_title[index],
            wid: moreFunctions[index]);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: more_icons.length,
    );
  }

  Widget thank_you() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Center(
          child: Text(
        '----Thank You----',
        style: const TextStyle(fontSize: 30, fontFamily: 'OpenSans', color: Colors.white54),
      )),
    );
  }
}
