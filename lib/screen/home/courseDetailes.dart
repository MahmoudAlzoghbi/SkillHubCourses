import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:skill_hub_courses_v2/screen/home/home.dart';
import 'package:skill_hub_courses_v2/services/database.dart';
import 'package:toast/toast.dart';


class CourseDetails extends StatefulWidget {

  final int id;

  // receive data from the FirstScreen as a parameter
  // ignore: unused_element
  CourseDetails(this.id);

  @override
  _CourseDetailsState createState() => _CourseDetailsState(this.id);
}

class _CourseDetailsState extends State<CourseDetails> {

  final int id;

  _CourseDetailsState( this.id ) ;

  double size = 160;

  String name ;
  String email;
  String mobile;

  var courses = new List();

  var coursesId = new List();

  List<String> courseDetail = [
    '8 Sessions in 8 weeks \nEvery Session \nFrom 3 hours to 4 hours \nCourse Price 1500',
    '4 sessions \n2 weeks \nCourse Price 3000',
    '8 Sessions in 8 weeks \nEvery Session From 3 hours to 4 hours \nCourse Price 1500',
    '8 Sessions in 8 weeks \nEvery Session From 3 hours to 4 hours \nCourse Price 1500',
    '4 Sessions \nEvery Session From 2 hours \n4 Levels... \n_Level 1.. From 6 years to 8 years \n_Level 2... From 8 years to 10 years \nLevel 3.. From 10 years to 12 years \nLevel 4.. From 12 years to open \nCourse Price 600',
    '1- MSCRM. \n2- #C. \n3- SQL. \n4- JAVASCRIPT'
  ];

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
    'PFK (Programmin for Kids)',
    ' الدبلومة'
  ];

  @override
  Widget build(BuildContext context) {

    if (id == 3){
      setState((){
        size = 70;
      });
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(225, 161, 60, 0.8),
              size: 25.0,
            ),
          ),
          title: Text(
            'Course Details',
            style: TextStyle(
              color: Color.fromRGBO(225, 161, 60, 0.8),
              fontSize: 25.0,
              fontFamily: 'Sourse Sans Pro',
              letterSpacing: 3.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: CircleAvatar(
                   backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
                   radius: 80.0,
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Image(
                       width: size,
                       fit: BoxFit.cover,
                       image: AssetImage(image[id]),
                     ),
                   ),
                 ),
               ),
               Center(
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
                   child: Text(
                     courseName[id],
                     style: TextStyle(
                       fontFamily: 'Sourse Sans Pro',
                       fontSize: 25.0,
                       color: Color.fromRGBO(225, 161, 60, 0.8),
                     ),
                   ),
                 ),
               ),
               Center(
                 child: Padding(
                   padding: const EdgeInsets.all(25.0),
                   child: Text(
                     courseDetail[id],
                     style: TextStyle(
                       letterSpacing: 3.0,
                       fontFamily: 'Sourse Sans Pro',
                       fontSize: 25.0,
                       color: Color.fromRGBO(225, 161, 60, 0.8),
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(200, 20, 0, 0),
                 child: FlatButton(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0),
                     side:BorderSide(
                         color: Color.fromRGBO(225, 161, 60, 0.8))
                   ),
                     onPressed: ()async {
                       updateUserCourses();
                     },
                     child: Text(
                       'Enroll Now',
                       style: TextStyle(
                         letterSpacing: 3.0,
                         fontFamily: 'Piazzolla',
                         fontSize: 25.0,
                         color: Color.fromRGBO(225, 161, 60, 0.8),
                       ),
                     ),
                 ),
               ),
             ],
            ),
          ),
        ),
      ),
    );
  }

  Future sendMail() async {
    String username = 'mahmodalzoghby111@gmail.com'; //Your Email;
    String password = '1062008303'; //Your Email's password;

    final smtpServer = gmail(username, password);
    // Creating the Gmail server

    //Get The User
    getUser();
    String nameCourse = courseName[id];
    // Create our email message.
    final message = Message()
      ..from = Address(username, 'Mahmoud AlZoghby')
      ..recipients.add(username)
    /*..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      ..bccRecipients.add(Address('bccAddress@example.com'))*/
      ..subject = 'Skill Hub Course 😀 '
      ..text = 'New User Registration \n\n - $name \n\n - $email \n\n - $mobile \n\n Need to Register in $nameCourse '; //body of the email
    //print ('Ana Hena');
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' +
          sendReport.toString());

      FirebaseUser user = await FirebaseAuth.instance.currentUser();

      print (user.uid);

    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }

  Future getUser() async{

    final CollectionReference collectionReference = Firestore.instance
        .collection('SkillHubUsers');

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    await collectionReference.document(user.uid).get().then((value) =>
    {
      if (this.mounted){
        setState(() {
          name = value['name'];
          //print('name $name');
          if (name == null)
            name = 'Not Found';
          email = value['email'];
          //print('email $email');
          if (email == null)
            email = 'Not Found';
          mobile = value['mobileNumber'];
          //print('mobile $mobile');
          if (mobile == null)
            mobile = 'Not Found';
          /*phUrl = value['phUrl'];
          phFile = value['phFile'];*/
        })
      }
    });
  }

  Future updateUserCourses() async {
    final CollectionReference coursesReference = Firestore.instance.collection('SkillHubCourses');

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    await coursesReference.document(user.uid).get().then((value) => {
      courses = value['coursesId'],
      print(value['coursesId']),
      print(courses)
    });
    if (courses == null){
      courses = [id] ;
      sendMail();
      await DatabaseService().updateUserCourses(courses , user.uid);
      Toast.show('Succesfully Registration, Someone will contact U soon.. ', context , duration: 10 , gravity: Toast.BOTTOM);
      return true;
    } else if (!courses.contains(id)){

      courses.forEach((element) => coursesId.add(element));
      
      try {
        coursesId.add(id);
      }catch(e){
        print (e.toString());
      }
      sendMail();
      await DatabaseService().updateUserCourses(coursesId , user.uid);
      Toast.show('Succesfully Registration, Someone will contact U soon.. ', context , duration: 10 , gravity: Toast.BOTTOM);
      return true;
    }else {
      return false;
    }
  }
}
