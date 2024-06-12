import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../shared/app_bar.dart';

class EducationDetail extends StatefulWidget {
  const EducationDetail({super.key});

  @override
  State<EducationDetail> createState() => _EducationDetailState();
}

class _EducationDetailState extends State<EducationDetail> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 20, 44, 1),
      appBar: MyAppBar.customAppBar(title: 'Education'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(
                controllerList.length,
                (index) => Column(
                  children: [
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      shadowColor: const Color.fromRGBO(32, 22, 211, 1),
                      child: Container(
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white54, width: 0.5),
                              color: const Color.fromRGBO(57, 21, 164, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
                                height: height * 0.1 - 40,
                                width: width * 0.9,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Education',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            controllerList.removeAt(index - 1);
                                          });
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
                                          con: controllerList[index].txtSchool!,
                                          label: 'school/University',
                                          icon: Icons.home),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      takeData(
                                          con: controllerList[index].txtCourse!,
                                          label: 'Course',
                                          icon: Icons.book),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      takeData(
                                          con: controllerList[index].txtGrade!,
                                          label: 'Grade',
                                          icon: Icons.numbers),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      takeData(
                                          con: controllerList[index].txtYear!,
                                          label: 'Year',
                                          icon: Icons.calendar_month)
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
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            controllerList.add(ControllerModel(
                txtCourse: txtCourse,
                txtGrade: txtPercentage,
                txtYear: txtStart,
                txtSchool: txtSchool));
          });
        },
        child: Card(
          shadowColor: const Color.fromRGBO(32, 22, 211, 1),
          elevation: 20,
          child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(57, 21, 164, 1),
                border: Border.all(color: Colors.white54, width: 0.5),
                borderRadius:  BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }

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
}

class ControllerModel {
  TextEditingController? txtSchool;
  TextEditingController? txtCourse;
  TextEditingController? txtGrade;
  TextEditingController? txtYear;

  ControllerModel(
      {this.txtSchool, this.txtCourse, this.txtGrade, this.txtYear});
}

List<ControllerModel> controllerList = [
  ControllerModel(
      txtSchool: txtSchool,
      txtYear: txtStart,
      txtGrade: txtPercentage,
      txtCourse: txtCourse)
];

TextEditingController txtSchool = TextEditingController();
TextEditingController txtCourse = TextEditingController();
TextEditingController txtPercentage = TextEditingController();
TextEditingController txtStart = TextEditingController();
