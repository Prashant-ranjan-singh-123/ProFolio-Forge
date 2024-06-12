import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_app1/shared/app_bar.dart';
import 'package:resume_app1/shared/dialog_box/under_development_dialog.dart';

class PersonalStatement extends StatefulWidget {
  const PersonalStatement({super.key});

  @override
  State<PersonalStatement> createState() => _PersonalStatementState();
}

TextEditingController txtSkill = TextEditingController();

class _PersonalStatementState extends State<PersonalStatement> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 20, 44, 1),
      appBar: MyAppBar.customAppBar(title: 'Professional Summary'),
      body: Form(
        child: Column(
          children: [
            takeData(con: txtSkill, label: 'Summary', icon: Icons.pages),
            saveOrDelete(),
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
      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
      child: Column(
        children: [
          Card(
            elevation: 25,
            color: const Color.fromRGBO(82, 59, 153, 0.2),
            child: TextFormField(
              controller: con,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 8,
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
