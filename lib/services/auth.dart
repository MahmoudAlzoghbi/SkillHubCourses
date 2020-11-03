import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:skill_hub_courses_v2/models/user.dart';
import 'package:skill_hub_courses_v2/services/database.dart';

class AuthServices {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //GlobalKey<FormState> _userLoginFormKey = GlobalKey();
  FirebaseUser _user;

  BuildContext context ;


  bool isSignIn = false;
  bool google = false;

  // sign in anon

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();

      FirebaseUser user = result.user;
      User(uid: user.uid);

      return user;
    } catch (e) {
      // TODO
      print(e.toString());
      return null;
    }
  }

  // Google LogIn

  Future signInWithGoogle() async {
    bool isSigned = false;
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential authCredential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      AuthResult authResult = await _auth.signInWithCredential(authCredential);

      _user = authResult.user;

      assert(! _user.isAnonymous);

      assert(await _user.getIdToken() != null);

      FirebaseUser currentUser = await _auth.currentUser();

      assert (_user.uid == currentUser.uid);

      User(uid: currentUser.uid);

      isSigned = true;
      print(" Username: ${_user.displayName}");
      print (" Email Address: ${_user.email}");

      await DatabaseService().updateUserData(_user.uid , _user.displayName , _user.email,_user.photoUrl , null, _user.phoneNumber , null);
    }catch (e) {
      isSigned = false;
      print(e.toString());
    }

    return isSigned;
  }

  // register with email and password
  
  Future signInWithMailAndPass(String username , String pass) async{

    bool isSigned = false;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: username, password: pass).then((value){
        isSigned = true;
      });
    }catch (e) {
      isSigned = false;
      print(e.toString());
    }

    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    User(uid: firebaseUser.uid);

    //await DatabaseService().updateUserData(firebaseUser.uid,firebaseUser.displayName , firebaseUser.email, null , null, firebaseUser.phoneNumber);
    print (firebaseUser);

    return isSigned;
  }

  // Facebook Login
  Future signInWithFacebook()async{

    bool isSigned = false;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      final facebookLogin = FacebookLogin();
      final result = await facebookLogin.logIn(['email']);

      final token = result.accessToken.token;

      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
      print(graphResponse.body);

      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          await firebaseAuth.signInWithCredential(
              FacebookAuthProvider.getCredential(accessToken: token));
          isSigned = true;
      }

      /*final credential = await firebaseAuth.signInWithCredential(FacebookAuthProvider.getCredential(accessToken: token));

      firebaseAuth.signInWithCredential(credential);
*/
      FirebaseUser firebaseUser = await firebaseAuth.currentUser();
      User(uid: firebaseUser.uid);
      await DatabaseService().updateUserData(firebaseUser.uid , firebaseUser.displayName, firebaseUser.email,firebaseUser.photoUrl , null, firebaseUser.phoneNumber , null);

      print("Username ${firebaseUser.displayName}");
      print("Email Address ${firebaseUser.email}");
    }catch (e) {
      isSigned = false;
      print(e.toString());
    }
    return isSigned;
  }

  // sign out

  // Reset Password

  Future userResetPassword(String email)async{

    bool reset = false;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      reset = true;

    }catch (e) {
      reset = true;
      print(e);
    }
    return reset;

  }
  // Sign up for FireBase with mail and password

  Future signUpWithMailAndPass(String name , String username , String pass , String mobile) async{


    bool isSigned = false;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: username, password: pass).then((value){
        isSigned = true;
      });
    }catch (e) {
      isSigned = false;
      print(e.toString());
    }

    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    User(uid: firebaseUser.uid);
    await DatabaseService().updateUserData(firebaseUser.uid, name, username, null , pass, mobile , null);

    print (firebaseUser);

    return isSigned;
  }

  /*Future getCurrentUser() async{

    FirebaseUser user1 = await FirebaseAuth.instance.currentUser();
    print (user1.phoneNumber);
    final user = Provider.of<QuerySnapshot>(context , listen: false);
    for (var doc in user.documents){
      if (user1.email == doc.data['email']){
        print (doc.data['name']);
      }
        //print(doc.data['name']);
    }
    //return user;
  }*/
}
