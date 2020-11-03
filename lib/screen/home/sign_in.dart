import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skill_hub_courses_v2/loadingIndicator.dart';
import 'package:skill_hub_courses_v2/screen/authenticate/resetPasswordScreen.dart';
import 'package:toast/toast.dart';
import 'package:skill_hub_courses_v2/screen/home/home.dart';

import 'package:skill_hub_courses_v2/services/auth.dart';

import '../../SplashScreen.dart';
import '../../my_flutter_app_icons.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _authServices = new AuthServices();
  String errorTextField ;
  final _emailKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
          leading: Builder(builder:(BuildContext context){
              return IconButton(
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: Icon(
                  Icons.arrow_back,
                  size: 25.0,
                  color: Color.fromRGBO(225, 161, 60, 0.8),
                  ),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Welcome()));
                },

              );
            }),
        ),
        backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
        /*appBar: AppBar(
          title: Text(
            'Sign in to Skill Hub',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
            ),
          ),
          backgroundColor: Colors.teal,
          elevation: 0.0,
        ),*/
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                //width: double.infinity,
                //height: double.infinity,
                /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('images/sql.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),*/
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Welcome to Skill Hub',
                          style: TextStyle(
                              color: Color.fromRGBO(225, 161, 60, 0.8),
                              fontFamily: 'Source Sans Pro',
                              fontSize: 35.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            splashColor: Color.fromRGBO(225, 161, 60, 0.8)),
                        child: Form(
                          key: _emailKey,
                          child: TextFormField(
                            controller: usernameController,
                            onSaved: (v){
                              usernameController.text = v;
                            },
                            validator: (value){
                              if (value.trim().isEmpty)
                                return 'please enter username';
                              return null;
                            },
                            cursorWidth: 2,
                            cursorColor: Color.fromRGBO(225, 161, 60, 0.8),
                            textInputAction: TextInputAction.send,
                            autofocus: false,
                            showCursor: true,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: ' Username or Email ',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 24.0),
                              suffixIcon: Icon(
                                Icons.email,
                                size: 25.0,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(225, 161, 60, 0.8))),
                            ),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Source Sans Pro',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(splashColor: Colors.white),
                        child: Form(
                          key: _passKey,
                          child: TextFormField(
                            controller: passwordController,
                            onSaved: (v){
                              passwordController.text = v;
                            },
                            validator: (String value) {
                              if (value.trim().isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            obscureText: true,
                            onChanged: (String value) {
                              print(value);
                            },
                            cursorWidth: 2,
                            cursorColor: Color.fromRGBO(225, 161, 60, 0.8),
                            textInputAction: TextInputAction.send,
                            autofocus: false,
                            showCursor: true,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: ' Password ',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 24.0),
                              suffixIcon: Icon(
                                Icons.lock_outline_rounded,
                                size: 25.0,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Source Sans Pro',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                        child: FlatButton(
                          onPressed: () {
                              /*_authServices.UserResetPassword('mahmodalzoghby111@gmail.com');*/
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
                          },
                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.red,
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        onPressed: (){
                          if (_emailKey.currentState.validate() || _passKey.currentState.validate()){
                            //_authServices.SignInWithMailAndPass(usernameController.text , passwordController.text);
                            getUsernameAndPass();
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));
                          }else {
                            print('Ana Hena');
                          }
                        },
                        color: Color.fromRGBO(159, 166, 164, 0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: Color.fromRGBO(225, 161, 60, 0.8))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(35, 12, 35, 12),
                          child: Text(
                            ' Sign in ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Source Sans Pro',
                                color: Colors.white,
                                letterSpacing: 5.0,
                                fontSize: 25.0,
                                wordSpacing: 5.0),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'or Log in with',
                            style: TextStyle(
                              color: Color.fromRGBO(225, 161, 60, 0.8),
                              fontSize: 20.0,
                              fontFamily: 'Source Sans Pro',
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 115,
                          ),
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: FloatingActionButton(
                              onPressed: () {
                                signInWithFacebook();
                                  /*_authServices.SignInWithFacebook();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));*/
                              },
                              heroTag: null,
                              child: Icon(
                                MyFlutterApp.facebook,
                                color: Color.fromRGBO(226, 224, 219, 0.8),
                                size: 30.0,
                              ),
                              backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
                              shape: CircleBorder(
                                  side: BorderSide(
                                      color: Color.fromRGBO(225, 161, 60, 0.8),
                                      width: 3.0)),
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: FloatingActionButton(
                              onPressed: () async {
                                signInWithGoogle();
                                /*_authServices.SignInWithGoogle();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));*/
                              },
                              heroTag: null,
                              child: Icon(
                                MyFlutterApp.google,
                                color: Color.fromRGBO(226, 224, 219, 0.8),
                                size: 30.0,
                              ),
                              backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
                              shape: CircleBorder(
                                  side: BorderSide(
                                      color: Color.fromRGBO(225, 161, 60, 0.8),
                                      width: 3.0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }

  Future getUsernameAndPass() async{

    String username = usernameController.text;
    String password = passwordController.text;

    bool isSigned ;

    //print (isSigned);
    print('username: $username');
    print('password: $password');

    isSigned = await _authServices.signInWithMailAndPass(username, password);

    if (isSigned){
      route();
    }else{
      Toast.show("Failed Sign In please Try Again...", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }



  void route(){
    //Navigator.of(context).pop();
    //Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    //Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  Future signInWithFacebook()async{

    bool isSigned = await _authServices.signInWithFacebook();
    /*bool isLoading = false;
    //Loading loading = Loading();
    isLoading ? SpinKitSquareCircle(
      color: Color.fromRGBO(225,161,60, 0.8),
      duration: Duration(seconds: 5),
      size: 50.0,
    ) : print('Finish');*/
    if (isSigned){
      Toast.show("Sign in Successfully", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
      route();
    }else{
      Toast.show("Failed Sign In please Try Again...", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }

  Future signInWithGoogle()async{

    bool isSigned = await _authServices.signInWithGoogle();

    if (isSigned){
      Toast.show("Sign in Successfully", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
      route();
    }else{
      Toast.show("Failed Sign In please Try Again...", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }
}
