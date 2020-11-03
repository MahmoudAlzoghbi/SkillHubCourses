import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skill_hub_courses_v2/screen/home/registerCourses.dart';
import 'package:skill_hub_courses_v2/services/database.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File _image;
  String name = '';

  bool onlyOnce = true;

  String phUrl ;
  String phFile ;

  String email = '';
  String mobile = '';

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

  // Option Chooser for Choose Camera or Gallery
  // ignore: missing_return
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    if (onlyOnce){
      getAllUsers();
      getRegisterCourses();
      onlyOnce = false;
    }
    //print(phUrl);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Source Sans Pro'
          ),
        ),
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: 500.0,
            height: 160.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 100, 8, 0),
              child: WavyAnimatedTextKit(
                text: [
                  'Skill Hub'
                ],
                /*waveColor: Color.fromRGBO(225, 161, 60, 0.8),
                        boxBackgroundColor: Color.fromRGBO(41, 59, 40, 0.8),*/
                textStyle: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(225, 161, 60, 0.8),
                    wordSpacing: 5.0,
                    letterSpacing: 5.0
                ),
              ),
            ),
          ),
          /*SizedBox(
            height: 32,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                if ( phUrl == null && phFile == null) {
                  _showPicker(context);
                }
              },
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffFDCF09),
                child: phUrl != null
                    ? CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(phUrl),
                ): Container(
                  child: phFile != null
                  ? CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(phUrl),
                  )
                ),
                *//*ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: Image(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    image: AssetImage(
                        phFile
                    ),
                  )
                )*//*
                    : Container(
                       width: 100,
                       height: 100,
                       child: phFile != null
                            ? Container(
                         child: CircleAvatar(
                           radius: 55,
                           backgroundColor: Colors.teal,
                           backgroundImage: AssetImage(phFile),
                         ))
                         image: DecorationImage(
                           image:NetworkImage(phUrl),),
                           color: Colors.grey[200],
                           borderRadius: BorderRadius.circular(50))
                      : Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                  ),
                ),
              ),
            ),*/
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 20.0,
                  ),
                title: Text(
                  name,
                  style: TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Sansita',
                      fontSize: 18.0
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
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
                  email,
                  style: TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Sansita',
                      fontSize: 18.0
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.black,
                  size: 20.0,
                ),
                title: Text(
                  mobile,
                  style: TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Sansita',
                      fontSize: 18.0
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Registered Courses',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontFamily: 'Piazzolla',
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: coursesName.reversed.map((data) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: ListTile(
                    title: Center(
                      child: Text(
                        data,
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Sansita',
                          fontSize: 18.0
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
    //updateUserData();
    updateUserData();
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
      phUrl = _image.path;
      print(phUrl);
    });
    updateUserData();
  }

  Future getAllUsers() async {
    // Collection Reference
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
          phUrl = value['phUrl'];
          phFile = value['phFile'];
        })
      }
    });
    /*print(name);
    print(email);
    print(mobile);
    print(phUrl);*/
  }
  Future updateUserData()async{

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    //String imageUrl = _image.toString();
    //print(_image);
    print(_image.path);
    await DatabaseService().updateUserPhUrl(user.uid , _image.path);
    print (_image.path);
    //print(imageUrl);
  }

  Future urlToFile(String imageUrl) async {
// generate random number.
    var rng = new Random();
// get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
    String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
    File file = new File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');
// call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(imageUrl);
// write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
    return file;
  }

  Future getRegisterCourses()async{

    final CollectionReference coursesReference = Firestore.instance.collection('SkillHubCourses');

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    coursesReference.document(user.uid).get().then((value) => {

      //setState((){
        coursesId = value['coursesId'],
        length = coursesId.length,

        coursesName.clear(),

        coursesId.forEach((element) {
          coursesName.add(courseName[element]);
        })
    });
    print(coursesName);
  }
}
