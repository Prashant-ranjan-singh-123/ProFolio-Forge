import 'package:flutter/material.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Education.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Experience.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Projects.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Skills.dart';
import 'package:resume_app1/screens/before_login/login_page/login.dart';
import 'package:resume_app1/screens/after_login/pdf_view_page/pdfScreen.dart';
import '../screens/SplashScreen.dart';
import '../screens/after_login/home_view_page/drawer_item/ContactInfo.dart';
import '../screens/after_login/home_view_page/drawer_item/PersonalStatement.dart';
import '../screens/after_login/home_view_page/drawer_item/Reference.dart';
import '../screens/after_login/home_view_page/home_page.dart';



class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes  =   {

    '/':(context)=>const SplashScreen(),
    '/person':(context)=>const PersonalStatement(),
    '/draw':(context) => const Home_page(),
     '/info':(context)=> const ContactInfo(),
     '/edu':(context)=> const EducationDetail(),
     '/exp':(context)=> const ExperienceDetail(),
     '/skill':(context)=> const SkillsScreen(),
     '/ref':(context)=> const ReferenceScreen(),
     '/pro':(context)=> const ProjectsScreen(),
     '/pdf':(context)=>  const PdfScreen(),
     '/log':(context)=>  const LoginPage(),
  };

}