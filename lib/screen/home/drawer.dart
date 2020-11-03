import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:skill_hub_courses_v2/SplashScreen.dart';
import 'package:skill_hub_courses_v2/screen/home/aboutUs.dart';
import 'package:skill_hub_courses_v2/screen/home/contactUs.dart';
import 'package:skill_hub_courses_v2/screen/home/userProfile.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Image(
              image: AssetImage('images/skillhubLogo.jpg'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 35.0,
                    color: Color.fromRGBO(225, 161, 60, 0.8),
                  ),
                  title: Text(
                    ' User Profile ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontFamily: 'Sansita',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                //Navigator.of(context).pushReplacement("/userProfile");
                //Navigator.popAndPushNamed(context, '/userProfile');
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUS()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ListTile(
                  leading: Icon(
                    Icons.assignment_late,
                    size: 35.0,
                    color: Color.fromRGBO(225, 161, 60, 0.8),
                  ),
                  title: Text(
                    ' About us ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontFamily: 'Sansita',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUS()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ListTile(
                  leading: Icon(
                    Icons.contact_phone,
                    size: 35.0,
                    color: Color.fromRGBO(225, 161, 60, 0.8),
                  ),
                  title: Text(
                    ' Contact us ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontFamily: 'Sansita',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await FacebookLogin().logOut();
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 35.0,
                    color: Color.fromRGBO(225, 161, 60, 0.8),
                  ),
                  title: Text(
                    ' logout ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontFamily: 'Sansita',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
