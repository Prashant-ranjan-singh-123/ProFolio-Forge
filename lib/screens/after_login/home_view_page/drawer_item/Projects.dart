import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:resume_app1/screens/after_login/home_view_page/drawer_item/Experience.dart';

import '../../../../shared/app_bar.dart';
import '../../../../shared/dialog_box/under_development_dialog.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  void add_item(){
    setState(() {
            controllerList2.add(ControllerModel(
              txtEndYear: txtEYear,
              txtProDetail: txtProDetail,
              txtProTitle: txtProTitle,
              txtStartYear: txtSYear));
          });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 20, 44, 1),
      appBar: MyAppBar.customAppBarWithRRightButton(title: 'Projects', fun: add_item),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            ...List.generate(
              controllerList2.length,
              (index) => experience_chip(index: index),
            ),

            // saveOrDelete(fun: (){Development.showDialogBox();}),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          
        },
        child: Card(
          shadowColor: const Color.fromRGBO(32, 22, 211, 1),
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 21, 14, 143),
                  border: Border.all(color: Colors.white54, width: 0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Icon(
                  Icons.check,
                  size: 30,
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }

  Widget saveOrDelete({required Function fun}) {
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
            child: GestureDetector(
              onTap: () {
                fun();
              },
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
          ),
        ],
      ),
    );
  }

  Widget experience_chip({required int index}) {
    Widget takeData(
        {required TextEditingController con,
        required String label,
        required IconData icon}) {
      return Card(
        elevation: 15,
        color: const Color.fromRGBO(82, 59, 153, 0.3),
        child: TextFormField(
          controller: con,
          style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            focusedBorder: InputBorder.none,
            labelStyle:
                const TextStyle(color: Colors.white60, fontFamily: 'OpenSans'),
          ),
        ),
      );
    }

    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: const Color.fromRGBO(32, 22, 211, 1),
              child: Container(
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 0.5),
                      color: const Color.fromARGB(255, 21, 14, 143),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * 0.1 - 40,
                        width: Get.width * 0.9,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(24, 28, 64, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${index + 1}) Projects',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('early: ${controllerList1.length}');
                                  setState(() {
                                    controllerList2.removeAt(index);
                                  });
                                  print('after: ${controllerList1.length}');
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            children: [
                              takeData(
                                  con: controllerList2[index].txtProTitle!,
                                  label: 'Project Title',
                                  icon: Icons.badge),
                              const SizedBox(
                                height: 10,
                              ),
                              takeData(
                                  con: controllerList2[index].txtProDetail!,
                                  label: 'Project Detail',
                                  icon: Icons.precision_manufacturing),
                              const SizedBox(
                                height: 10,
                              ),
                              takeData(
                                  con: controllerList2[index].txtStartYear!,
                                  label: 'Starting Date',
                                  icon: Icons.calendar_month),
                              const SizedBox(
                                height: 10,
                              ),
                              takeData(
                                  con: controllerList2[index].txtEndYear!,
                                  label: 'Ending Date',
                                  icon: Icons.calendar_month),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
        const Expanded(child: SizedBox())
      ],
    );
  }
}

Widget buildTextFormField(String label, TextEditingController controller) {
  return SizedBox(
    width: 340,
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
      ),
    ),
  );
}

class ControllerModel {
  TextEditingController? txtProTitle;
  TextEditingController? txtProDetail;
  TextEditingController? txtStartYear;
  TextEditingController? txtEndYear;

  ControllerModel(
      {required this.txtEndYear,
      required this.txtProDetail,
      required this.txtProTitle,
      required this.txtStartYear});
}

List<ControllerModel> controllerList2 = [
  ControllerModel(
      txtEndYear: txtEndYear,
      txtProDetail: txtProDetail,
      txtStartYear: txtStartYear,
      txtProTitle: txtProTitle)
];

TextEditingController txtProTitle = TextEditingController();
TextEditingController txtProDetail = TextEditingController();
TextEditingController txtStartYear = TextEditingController();
TextEditingController txtEndYear = TextEditingController();
