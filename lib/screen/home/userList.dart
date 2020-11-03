import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_hub_courses_v2/screen/home/courseDetailes.dart';


class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

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

    /*final user = Provider.of<QuerySnapshot>(context);
    for (var doc in user.documents){
      print(doc.data['name']);
    }*/
    return ListView.builder(
      itemCount: 6,
      itemBuilder:(context , pos){
        return SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetails(pos)));
                },
                child: Card(
                  color: Color.fromRGBO(41, 59, 40, 0.8),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 35.0,
                        child: Image(
                        image : AssetImage(image[pos]),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            courseName[pos],
                            style: TextStyle(
                              color: Color.fromRGBO(225, 161, 60, 0.8),
                            ),
                          ),
                          new Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            color: Color.fromRGBO(225, 161, 60, 0.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40.0,
                          child: Image(
                            image: AssetImage(image[pos]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 20, 0),
                        child: Text(
                          courseName[pos],
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),*/
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
