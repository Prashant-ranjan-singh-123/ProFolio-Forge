import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_app1/shared/app_bar.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  void add_button_fun() {
    setState(() {
      txtControllerList.add(TextEditingController());
    });
  }

  void delete_button_fun(int index) {
    setState(() {
      txtControllerList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 20, 44, 1),
      appBar: MyAppBar.customAppBarWithRRightButton(title: 'Key-Skills', fun: add_button_fun),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            txtControllerList.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: takeData(
                      con: txtControllerList[index],
                      label: '${index + 1} Skills',
                      icon: CupertinoIcons.skew,
                    ),
                  ),
                  skills_custom_button(
                    color: const Color.fromRGBO(113, 43, 62, 1),
                    icon: Icons.close,
                    fun: () => delete_button_fun(index),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            skills = '';
            for (int i = 0; i < txtControllerList.length; i++) {
              skills = '$skills' + '  ' + '${txtControllerList[i].text}\n';
            }
            // print(skills);
            // Navigator.of(context).pushNamed('/show');
          });
        },
        child: Card(
          shadowColor: const Color.fromRGBO(32, 22, 211, 1),
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 21, 14, 143),
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

  Widget takeData({
    required TextEditingController con,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
      child: Card(
        elevation: 25,
        color: const Color.fromRGBO(82, 59, 153, 0.2),
        child: TextFormField(
          controller: con,
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 8,
          style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            focusedBorder: InputBorder.none,
            labelStyle: const TextStyle(color: Colors.white60, fontFamily: 'OpenSans'),
          ),
        ),
      ),
    );
  }

  Widget skills_custom_button({
    required Color color,
    required IconData icon,
    required VoidCallback fun,
  }) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: const EdgeInsets.only(top: 15, right: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

String skills = '';
List<TextEditingController> txtControllerList = [TextEditingController()];