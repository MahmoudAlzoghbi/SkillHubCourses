import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegisterCourses extends StatefulWidget {
  @override
  _RegisterCoursesState createState() => _RegisterCoursesState();
}

class _RegisterCoursesState extends State<RegisterCourses> {

  int length = 0;

  var coursesId = new List();

  var coursesName = new List();

  List<String> image = [
    'images/C#.png',
    'images/crm.png',
    'images/sql.jpg',
    'images/java.png',
    'images/kids.jpg',
    'images/deploma.png'
  ];

  List<String> courseName = [
    'C# for beginners',
    'CRM Functional business',
    'SQL for beginners',
    'Java for beginners',
    'كورس البرمجه للاطفال PFK',
    ' الدبلومة'
  ];

  @override
  Widget build(BuildContext context) {

    getRegisterCourses();

    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: coursesName.reversed.map((data) {
          return ListTile(
            title: Text(data),
          );
        }).toList(),
      ),
    );



    /*ListView.builder(
        itemCount: length,
        itemBuilder:(context , pos){
          return SingleChildScrollView(
            child: Row(
              children:[
               Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: (){
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetails(pos)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        title: Text(
                            courseName[coursesId[pos]]
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ],
            ),
          );
        }
    );*/
  }

  Future getRegisterCourses()async{

    final CollectionReference coursesReference = Firestore.instance.collection('SkillHubCourses');

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    await coursesReference.document(user.uid).get().then((value) => {

      setState((){
        coursesId = value['coursesId'];
        length = coursesId.length;

        coursesId.forEach((element) {
          coursesName.add(courseName[element]);
        });
      })
    });

    print(coursesName);
  }

}
