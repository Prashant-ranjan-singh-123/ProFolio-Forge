import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_app1/shared/app_bar.dart';
import 'package:resume_app1/shared/dialog_box/under_development_dialog.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

TextEditingController txtEmail = TextEditingController();
TextEditingController txtName = TextEditingController();
TextEditingController txtPhone = TextEditingController();
TextEditingController txtAddress = TextEditingController();
TextEditingController txtBirthday = TextEditingController();

GlobalKey<FormState> formKey = GlobalKey();

ImagePicker imagePicker = ImagePicker();
File? fileImage;

double returnSmaller() {
  if (Get.width > Get.height) {
    return Get.width;
  } else {
    return Get.height;
  }
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 20, 44, 1),
      appBar: MyAppBar.customAppBar(title: 'Contact Info'),
      body: myForm(children: [
        image_at_top(top: 30, bottom: 30)
            .animate()
            .fadeIn(duration: 2000.ms)
            .slideY(duration: 1000.ms, curve: Curves.decelerate),
        takeData(con: txtName, label: 'Full name', icon: IconlyLight.profile)
            .animate()
            .flip(delay: 450.ms, duration: 500.ms, curve: Curves.decelerate)
            .fadeIn(delay: 450.ms, duration: 1000.ms, curve: Curves.decelerate),
        takeData(con: txtEmail, label: 'Email', icon: IconlyLight.message)
            .animate()
            .flip(delay: 550.ms, duration: 500.ms, curve: Curves.decelerate)
            .fadeIn(delay: 550.ms, duration: 1000.ms, curve: Curves.decelerate),
        takeData(con: txtPhone, label: 'Phone', icon: IconlyLight.call)
            .animate()
            .flip(delay: 650.ms, duration: 500.ms, curve: Curves.decelerate)
            .fadeIn(delay: 650.ms, duration: 1000.ms, curve: Curves.decelerate),
        takeData(con: txtAddress, label: 'Address', icon: IconlyLight.home)
            .animate()
            .flip(delay: 750.ms, duration: 500.ms, curve: Curves.decelerate)
            .fadeIn(delay: 750.ms, duration: 1000.ms, curve: Curves.decelerate),
        takeData(
                con: txtAddress,
                label: 'Date Of Birth',
                icon: CupertinoIcons.calendar)
            .animate()
            .flip(delay: 850.ms, duration: 500.ms, curve: Curves.decelerate)
            .fadeIn(delay: 850.ms, duration: 1000.ms, curve: Curves.decelerate),
        saveOrDelete()
            .animate()
            .flip(delay: 950.ms, duration: 500.ms, curve: Curves.decelerate)
            .fadeIn(delay: 950.ms, duration: 1000.ms, curve: Curves.decelerate)
      ]),
    );
  }

  Widget myForm({required List<Widget> children}) {
    return Form(
        key: formKey,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children)));
  }

  Widget image_at_top({required double top, required double bottom}) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: Container(
        height: returnSmaller() * 0.15,
        width: returnSmaller() * 0.15,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(82, 59, 153, 0.2),
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            ClipOval(
              child: fileImage != null
                  ? Image.file(
                      fileImage!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/img/person.png',
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () async {
                  XFile? xfileImage =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    fileImage = File(xfileImage!.path);
                  });
                },
                child: const CircleAvatar(
                  backgroundColor: Color.fromRGBO(69, 99, 155, 1),
                  child: Icon(
                    Icons.camera,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget takeData(
      {required TextEditingController con,
      required String label,
      required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 15),
      child: Column(
        children: [
          Card(
            elevation: 25,
            color: const Color.fromRGBO(82, 59, 153, 0.2),
            child: TextFormField(
              controller: con,
              style:
                  const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: label,
                prefixIcon: Icon(
                  icon,
                  color: Colors.white,
                ),
                focusedBorder: InputBorder.none,
                labelStyle: const TextStyle(
                    color: Colors.white60, fontFamily: 'OpenSans'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget saveOrDelete() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              height: Get.height * 0.1 - 30,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(76, 67, 130, 1),
                      blurRadius: 45,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.outer),
                ],
                border: Border.all(
                    color: const Color.fromRGBO(182, 91, 210, 1), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Development.showDialogBox();
                    },
                    child: const AutoSizeText(
                      maxLines: 1,
                      'Delete Selection',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'OpenSans',
                          fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: Get.height * 0.1 - 30,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(82, 59, 153, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'OpenSans',
                      fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
