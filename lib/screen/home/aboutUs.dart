import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:skill_hub_courses_v2/screen/home/home.dart';

class AboutUS extends StatefulWidget {
  @override
  _AboutUSState createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  @override
  Widget build(BuildContext context) {
    //Navigator.of(context).pop();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
        /*appBar: AppBar(
          leading: Builder(builder:(BuildContext context){
            return IconButton(
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: Icon(
                Icons.arrow_back,
                size: 25.0,
                color: Color.fromRGBO(225, 161, 60, 0.8),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },

            );
          }),
        ),*/
        body: SingleChildScrollView(
          child: Column(
            children: [
              /*Image(
                width: double.infinity,
                height: 200.0,
                image: AssetImage('images/skillhubLogo.jpg'),
              ),*/
              SizedBox(
                width: 500.0,
                height: 190.0,
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
              SizedBox(
                height: 40.0,
              ),
              Center(
                child: Text(
                  ' Who We Are ? ',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sansita',
                    color: Colors.teal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Skill Hub is a fast growing Technology company based in Egypt with presence in the Middle East, We are specialized in Technology Services focusing on 4 main areas: Consultancy, Projects, OutSourcing and Training. ',
                  style: TextStyle(
                    color: Color.fromRGBO(225, 161, 60, 0.8),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Text(
                  'We Provide Training courses for:',
                  style: TextStyle(
                    color: Color.fromRGBO(225, 161, 60, 0.8),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
                child: Text(
                  '1- Microsoft Dynamics CRM Basics ',
                  style: TextStyle(
                    color: Color.fromRGBO(225, 161, 60, 0.8),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                  '2- Microsoft Dynamics CRM Advanced ',
                  style: TextStyle(
                    color: Color.fromRGBO(225, 161, 60, 0.8),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                  'Our mission is supporting our customers through providing excellent service with enterprise class.. Skill Hub We are with you wherever you are. ' ,
                  style: TextStyle(
                    color: Color.fromRGBO(225, 161, 60, 0.8),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                },
                color: Color.fromRGBO(159,166,164, 0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                      color: Color.fromRGBO(225, 161, 60, 0.8))
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      fontFamily: 'Sansita',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      letterSpacing: 3.0,
                      color: Color.fromRGBO(226,224,219, 0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    ));
  }
}
