import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/app_bar.dart';

class ExperienceDetail extends StatefulWidget {
  const ExperienceDetail({super.key});

  @override
  State<ExperienceDetail> createState() => _ExperienceDetailState();
}

class _ExperienceDetailState extends State<ExperienceDetail> {
  void add_button(){
    setState(() {
            controllerList1.add(ControllerModel(
                txtCompany: txtCompany,
                txtDetail: txtDetail,
                txtEYear: txtEYear,
                txtPosition: txtPosition,
                txtSYear: txtSYear));
          });
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 20, 44, 1),
      appBar: MyAppBar.customAppBarWithRRightButton(title: 'Experience', fun: add_button),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),
            ...List.generate(
              controllerList1.length,
              (index) => experience_chip(index: index),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          
        },
        child: Card(
          shadowColor: const Color.fromRGBO(32, 22, 211, 1),
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 21, 14, 143),
                border: Border.all(color: Colors.white54, width: 0.2),
                borderRadius:  BorderRadius.circular(20)),
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
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                                '${index+1}) Experience',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('early: ${controllerList1.length}');
                                  setState(() {
                                        controllerList1.removeAt(index - 1);
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
                                  con: controllerList1[index].txtCompany!,
                                  label: 'Company Name',
                                  icon: Icons.badge),
                              const SizedBox(
                                height: 10,
                              ),
                              takeData(
                                  con: controllerList1[index].txtPosition!,
                                  label: 'Job Title',
                                  icon: Icons.precision_manufacturing),
                              const SizedBox(
                                height: 10,
                              ),
                              takeData(
                                  con: controllerList1[index].txtSYear!,
                                  label: 'Starting Date',
                                  icon: Icons.calendar_month),
                              const SizedBox(
                                height: 10,
                              ),
                              takeData(
                                  con: controllerList1[index].txtEYear!,
                                  label: 'Ending Date',
                                  icon: Icons.calendar_month),const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              takeData(
                                  con: controllerList1[index].txtDetail!,
                                  label: 'Details',
                                  icon: Icons.edit_document),
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
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
      ),
    ),
  );
}

class ControllerModel {
  TextEditingController? txtCompany;
  TextEditingController? txtPosition;
  TextEditingController? txtSYear;
  TextEditingController? txtEYear;
  TextEditingController? txtDetail;

  ControllerModel(
      {this.txtCompany,
      this.txtEYear,
      this.txtPosition,
      this.txtSYear,
      this.txtDetail});
}

List<ControllerModel> controllerList1 = [
  ControllerModel(
    txtCompany: txtCompany,
    txtPosition: txtPosition,
    txtSYear: txtSYear,
    txtEYear: txtEYear,
    txtDetail: txtDetail,
  )
];

TextEditingController txtCompany = TextEditingController();
TextEditingController txtPosition = TextEditingController();
TextEditingController txtSYear = TextEditingController();
TextEditingController txtEYear = TextEditingController();
TextEditingController txtDetail = TextEditingController();
