import 'package:first_flutter_project/models/student.dart';
import 'package:first_flutter_project/screens/student_add.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  List<Student> students = [
    Student.withId(1, "Hudayberdi", "Polatov", 20),
    Student.withId(2, "Yrysgal", "Garajayev", 45),
    Student.withId(3, "Nuryagdy", "jumayew", 78),
  ];

  Student selectedStudent = Student.withId(0, "No selected", "", 0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student control system",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 10, 102, 10),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      students[index].firstName.toString() +
                          " " +
                          students[index].surName.toString(),
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Quicksand'),
                    ),
                    subtitle: Text(
                      "Synagdan alan baly: ${students[index].grade.toString()}" +
                          "[ " +
                          students[index].getStatus +
                          " ]",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(Student.imageUrl),
                    ),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        this.selectedStudent = students[index];
                      });
                    },
                    onLongPress: () {
                      print("long click");
                    },
                  );
                })),
        Text(
          "Selected student:" + selectedStudent.firstName,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 10, 102, 10),
          ),
        ),
        Container(
          margin: EdgeInsets.zero,
          child:    Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child:
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentAdd(students)),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Set button background color
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Set button border radius to zero
                      ),
                    ),
                  ),
                  child: Row(children: <Widget>[
                    Icon(Icons.add, color: Colors.white,),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Add Student',
                      style: TextStyle(color: Colors.white),
                    ),
                  ]
                  ),

                ),

              ),
              ElevatedButton(
                onPressed: () {
                  print("test");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Set button background color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Set button border radius to zero
                    ),
                  ),
                ),
                child: Row(children: <Widget>[
                  Icon(Icons.edit , color: Colors.white,),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  ),
                ]
                ),

              ),
              ElevatedButton(
                onPressed: () {
                  print("test");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Set button background color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Set button border radius to zero
                    ),
                  ),
                ),
                child: Row(children: <Widget>[
                  Icon(Icons.delete, color: Colors.white,),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                ]
                ),

              ),
            ],
          ),
        )


      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade > 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
