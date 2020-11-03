import 'package:flutter/material.dart';
import 'package:skill_hub_courses_v2/screen/home/sign_in.dart';
import 'package:skill_hub_courses_v2/services/auth.dart';
import 'package:toast/toast.dart';

class ResetPassword extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ResetPassword> {

  final AuthServices _authServices = new AuthServices();

  final _emailKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
          title: Text(
            'Reset Your Password',
            style: TextStyle(
              color: Color.fromRGBO(225, 161, 60, 0.8),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 400.0,
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
                  child: Text(
                    'Enter your user account verified email address and we will send you a password reset link.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0,
                      color: Colors.black,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(splashColor: Colors.white),
                child: Form(
                  key: _emailKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: emailController,
                      onSaved: (v){
                        emailController.text = v;
                      },
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'email is required';
                        }
                        return null;
                      },
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
                        labelText: 'email address',
                        hintText: ' Enter your email address ',
                        labelStyle:
                        TextStyle(color: Colors.black, fontSize: 24.0),
                        suffixIcon: Icon(
                          Icons.email,
                          size: 25.0,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: (){
                  if (_emailKey.currentState.validate()){
                    //_authServices.SignInWithMailAndPass(usernameController.text , passwordController.text);
                    getEmailAddress();
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));
                  }else {
                    print('Ana Hena');
                  }
                },
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                        color: Color.fromRGBO(225, 161, 60, 0.8))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35, 12, 35, 12),
                  child: Text(
                    ' Send password reset email ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontSize: 20.0,
                        wordSpacing: 1.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getEmailAddress() async{

    String email = emailController.text;

    bool isReset;

    print('Email Address $email');

    isReset = await _authServices.userResetPassword(email);

    if (isReset){
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
      Toast.show("Mail Send Successfully", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }else {
      Toast.show("Please Try Again...", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }
}
