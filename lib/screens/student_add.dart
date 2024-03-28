import 'package:first_flutter_project/main.dart';
import 'package:first_flutter_project/models/student.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(this.students);
  @override
  State<StatefulWidget> createState() {
    return _StudentAdd();
  }
}

final Color customColor = Color.fromARGB(255, 19, 84, 100);

class _StudentAdd extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  @override
  Student student = Student.withId(0, "", "", 0);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Student",
            style: TextStyle(color: Colors.white, fontFamily: 'Ubuntu')),
        backgroundColor: customColor,
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildSurNameField(),
              buildGradeField(),
              buildButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Firstname", hintText: "Hudayberdi"),
      onSaved: (String? value) {

        student.firstName = value!;
      },
    );
  }

  Widget buildSurNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Surname ", hintText: "Polatov"),
      onSaved: (String? value) {
        student.surName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Grade", hintText: "78"),
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          student.id = widget.students.length + 1;
          widget.students.add(student);
          formKey.currentState?.save();
          Navigator.pop(context);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              customColor), // Set button background color
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.zero, // Set button border radius to zero
            ),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            'Add Student',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ]),
      ),
    );
  }
}
