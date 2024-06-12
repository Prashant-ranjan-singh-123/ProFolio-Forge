import 'package:flutter/material.dart';

import '../../../../shared/app_bar.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 20, 44, 1),
      appBar: MyAppBar.customAppBar(title: 'Key-Skills'),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            txtControllerList.length,
            (index) => ListTile(
              title: TextField(
                controller: txtControllerList[index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      TextEditingController txtController =
                          TextEditingController();
                      setState(() {
                        txtControllerList.add(txtController);
                      });
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Color(0xff1a2838),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          txtControllerList.removeAt(index - 1);
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        color: Color(0xff1a2838),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            skills = '';
            for (int i = 0; i < txtControllerList.length; i++) {
              skills = '$skills' + '  ' + '${txtControllerList[i].text}';
            }
            // print(skills);
            Navigator.of(context).pushNamed('/show');
          });
        },
        child: Icon(
          Icons.shortcut,
          color: Colors.green,
        ),
      ),
    );
  }
}

String skills = '';
TextEditingController txtController = TextEditingController();
List<TextEditingController> txtControllerList = [txtController];
