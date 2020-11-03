import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skill_hub_courses_v2/my_flutter_app_icons.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactUS extends StatefulWidget {
  @override
  _ContactUSState createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {

  final key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Color.fromRGBO(159,166,164, 0.8),
                  child: FlatButton(
                    onPressed: (){_makePhoneCall();},
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          '+201201324717',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Color.fromRGBO(159,166,164, 0.8),
                  child: FlatButton(
                    onPressed: (){_launchInBrowser('http://www.skillhub-me.com/');},
                    child: ListTile(
                      leading: Icon(
                        Icons.link,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          'http://www.skillhub-me.com/',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Color.fromRGBO(159,166,164, 0.8),
                  child: FlatButton(
                    onPressed: (){_launchInBrowser('https://www.facebook.com/Skillhubme/');},
                    child: ListTile(
                      leading: Icon(
                        MyFlutterApp.facebook,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'https://www.facebook.com/Skillhubme/',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Color.fromRGBO(159,166,164, 0.8),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: FlatButton(
                        onPressed: (){
                          Clipboard.setData(new ClipboardData(text: 'Sales@skillhub-me.com'));
                          Toast.show("Email Address Copied ", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                        },
                        child: Text(
                          'Sales@skillhub-me.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            ),
          ),
        ),
    );
  }

  Future<void> _makePhoneCall() async {
    if (await canLaunch('tel:+201201324717')) {
      await launch('tel:+201201324717');
    } else {
      throw 'Could not make the Call ';
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch the Page';
    }
  }

/*  void launchWhatsApp( String phone) async {
    String url = "whatsapp://send?phone=$phone&text=${Uri.parse('')}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/


}
