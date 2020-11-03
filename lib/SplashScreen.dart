
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:skill_hub_courses_v2/screen/authenticate/sign_up.dart';
import 'package:skill_hub_courses_v2/screen/home/home.dart';
import 'package:skill_hub_courses_v2/wrapper/wrapper.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade800,
          body: SafeArea(
            child: Container(
              /*decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/splash.PNG"),
                  fit:BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),*/
              child: FlatButton(
                height: double.infinity,
                minWidth: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                  child: Text(
                    'Click on the Screen to Continue...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome() ));
                },
              ),
            ),

            /*FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image(image: AssetImage('images/Enter Page.jpg'),),
              ),

            ),*/
          ),
      ),
    );
  }

  /*route(){
    Navigator.of(context).push(MaterialPageRoute (builder: (context)=> WelcomePage()));
  }

  startTime() async{
    Timer (Duration(seconds: 10) , (){
      setState((){
        Navigator.pushNamed(context,new MaterialPageRoute(builder: (_)=> new WelcomePage()));
      });
    });
  }*/
}

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {

    returnHomePage();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
        /*appBar: AppBar(
          leading: Icon(
            Icons.book,
            size: 30.0,
            color: Colors.white,
          ),
          backgroundColor: Colors.teal.shade900,
          title: Text('Skill Hub Courses' , style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico'
          ),
          ),
        ),*/
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              /*decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/splash1.PNG'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),*/
              child: Column(
                children:[
                  SizedBox(
                    width: 500.0,
                    height: 200.0,
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100.0,
                        ),
                        SizedBox(
                          width: 200,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Color.fromRGBO(225, 161, 60, 0.8) , width: 2),
                            ),
                            color: Color.fromRGBO(159,166,164, 0.8),
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Sign in ' ,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: 'Piazzolla',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),

                            ),
                            onPressed: (){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper() ));
                            },),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                          width: 200,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Color.fromRGBO(225, 161, 60, 0.8) , width: 2),
                            ),
                            color: Color.fromRGBO(159,166,164, 0.8),
                            padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
                            child: Text(
                              'Sign up ' ,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: 'Piazzolla',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: (){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));

                            },),
                        ),
                      ],
                      ),
                  ),
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future returnHomePage() async{
    FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();

    if (firebaseUser != null){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

    }
  }
}
