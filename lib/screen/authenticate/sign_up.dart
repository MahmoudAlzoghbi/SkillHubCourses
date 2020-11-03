import 'package:flutter/material.dart';
import 'package:skill_hub_courses_v2/SplashScreen.dart';
import 'package:skill_hub_courses_v2/screen/home/home.dart';
import 'package:skill_hub_courses_v2/services/auth.dart';
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SignUp> {
  final _nameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();
  final _mobileKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shill Hub'),
          backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
          actions: [
            IconButton(
              alignment: Alignment.center,
                icon:Icon(
                  Icons.arrow_back,
                  size: 30.0,
                  color: Color.fromRGBO(225, 161, 60, 0.8),
                ),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
                },
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(41, 59, 40, 0.8),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 60.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      ' Skill Hub Sign Up ',
                      style: TextStyle(
                          color: Color.fromRGBO(225, 161, 60, 0.8),
                          fontFamily: 'Source Sans Pro',
                          fontSize: 35.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                        splashColor: Color.fromRGBO(225, 161, 60, 0.8)),
                    child: Form(
                      key: _nameKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: usernameController,
                          onSaved: (v) {
                            usernameController.text = v;
                          },
                          validator: (value) {
                            if (value.trim().isEmpty)
                              return 'please enter username';
                            return null;
                          },
                          cursorWidth: 2,
                          cursorColor: Color.fromRGBO(225, 161, 60, 0.8),
                          textInputAction: TextInputAction.done,
                          autofocus: false,
                          showCursor: true,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            suffixText: '*',
                            suffixStyle: TextStyle(color: Colors.red),
                            labelText: 'Username',
                            hintText: ' Username or fullName ',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 24.0),
                            /*suffixIcon: Icon(
                              Icons.email,
                              size: 25.0,
                              color: Colors.white,
                            ),*/
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
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                        splashColor: Color.fromRGBO(225, 161, 60, 0.8)),
                    child: Form(
                      key: _emailKey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: TextFormField(
                          controller: emailController,
                          onSaved: (v) {
                            emailController.text = v;
                          },
                          validator: (value) {
                            if (value.trim().isEmpty)
                              return 'please enter email address';
                            return null;
                          },
                          cursorWidth: 2,
                          cursorColor: Color.fromRGBO(225, 161, 60, 0.8),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          showCursor: true,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            suffixText: '*',
                            suffixStyle: TextStyle(color: Colors.red),
                            labelText: 'email address',
                            hintText: ' enter your email address ',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 24.0),
                            /*suffixIcon: Icon(
                              Icons.email,
                              size: 25.0,
                              color: Colors.white,
                            ),*/
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
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                        splashColor: Color.fromRGBO(225, 161, 60, 0.8)),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: _mobileKey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: TextFormField(
                          controller: mobileController,
                          onSaved: (v) {
                            mobileController.text = v;
                          },
                          validator: (String value) {
                            if (value.trim().isEmpty )
                              return 'please enter your mobile number';
                            if (value.trim().length != 11)
                              return 'please Enter a valid mobile number';
                            /*if (isValidPhoneNumber(value))
                              return'Phone Number is Not Valid';*/
                            return null;
                          },
                          cursorWidth: 2,
                          cursorColor: Color.fromRGBO(225, 161, 60, 0.8),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          showCursor: true,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            suffixText: '*',
                            suffixStyle: TextStyle(color: Colors.red),
                            labelText: 'mobile number',
                            hintText: ' enter your mobile number ',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 24.0),
                            /*suffixIcon: Icon(
                              Icons.email,
                              size: 25.0,
                              color: Colors.white,
                            ),*/
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
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                        splashColor: Color.fromRGBO(225, 161, 60, 0.8)),
                    child: Form(
                      key: _passKey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: TextFormField(
                          controller: passwordController,
                          onSaved: (v) {
                            passwordController.text = v;
                          },
                          validator: (String value) {
                            if (value.trim().isEmpty)
                              return ' Can Not be Empty ';
                            if (value.length <= 6)
                              return ' at least 6 character ';
                            return null;
                          },
                          obscureText: true,
                          cursorWidth: 2,
                          cursorColor: Color.fromRGBO(225, 161, 60, 0.8),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          showCursor: true,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            suffixText: '*',
                            suffixStyle: TextStyle(color: Colors.red),
                            labelText: 'Password',
                            hintText: ' enter your Password ',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 24.0),
                            /*suffixIcon: Icon(
                              Icons.email,
                              size: 25.0,
                              color: Colors.white,
                            ),*/
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
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_nameKey.currentState.validate() &&
                          _emailKey.currentState.validate() &&
                          _mobileKey.currentState.validate() &&
                          _passKey.currentState.validate()) {
                        /*Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));*/
                        signUpWithEmailAndPassword();
                      } else {
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
                        ' Sign up ',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signUpWithEmailAndPassword() async {
    String name = usernameController.text;
    String email = emailController.text;
    String pass = passwordController.text;
    String mobile = mobileController.text;

    bool isSigned ;


    print (isSigned);
    print('username: $email');
    print('password: $pass');

    final _authServices = AuthServices();
    isSigned = await _authServices.signUpWithMailAndPass(name , email, pass , mobile);

    if (isSigned){
      route();
    }else{
      Toast.show("Failed Sign In please Try Again...", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }

  void route() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  bool isValidPhoneNumber(String phoneNumber) {
    // You may need to change this pattern to fit your requirement.
    // I just copied the pattern from here: https://regexr.com/3c53v
    final pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);

    if (phoneNumber == null || phoneNumber.isEmpty) {
      return false;
    }

    if (!regExp.hasMatch(phoneNumber)) {
      return false;
    }
    return true;
  }
}
