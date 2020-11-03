import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:provider/provider.dart';
import 'package:skill_hub_courses_v2/screen/home/drawer.dart';
import 'package:skill_hub_courses_v2/screen/home/userList.dart';
import 'package:skill_hub_courses_v2/services/database.dart';

import '../../SplashScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> choices = <String>[
    'Sign out'
  ];

  //AuthServices _service = AuthServices();
  String name ;

  @override
  Widget build(BuildContext context) {

    getAllUsers();
    //setUserCourses();
    /*final user = Provider.of<QuerySnapshot>(context);
    for (var doc in user.documents){
      print(doc.data);
    }*/

    //print (user.toString());
    return StreamProvider<QuerySnapshot>.value(
      value:DatabaseService().users,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: MenuDrawer(),
          appBar: AppBar(
            /*leading: Builder(builder:(BuildContext context){
              return IconButton(
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: Icon(
                  Icons.person,
                  size: 25.0,
                  color: Color.fromRGBO(225, 161, 60, 0.8),
                  ),
                onPressed: null,

              );
            }),*/
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: (choice) async {
                  if(choice == choices[0]){
                    await signOut();
                  }
                },
                itemBuilder: (BuildContext context){
                  return choices.map((String choice){
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),);
                  }).toList();
                }
                ,)]
            ,
            backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
            title: Text(
              'Welcome, $name',
              style: TextStyle(
                color: Color.fromRGBO(225, 161, 60, 0.8),
                fontFamily: 'Sansita',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
          body: UserList(),
        ),
      ),
    );
  }

  Future signOut() async{
    await FirebaseAuth.instance.signOut();
    await FacebookLogin().logOut();
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));

  }

  Future getAllUsers() async{

    // Collection Reference
    final CollectionReference collectionReference = Firestore.instance.collection('SkillHubUsers');

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    await collectionReference.document(user.uid).get().then((value) => {
      if (this.mounted){
        setState((){
          name = value['name'];
          List<String> spl = name.split(' ');
          name = spl[0];
        })
    }
    });

  }

/*  Future setUserCourses() async{

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    await DatabaseService().updateUserCourses(, user.uid);

  }*/
}
