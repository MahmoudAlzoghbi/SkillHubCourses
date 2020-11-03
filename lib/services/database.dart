import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  // Collection Reference
  final CollectionReference collectionReference = Firestore.instance.collection('SkillHubUsers');
  final CollectionReference coursesReference = Firestore.instance.collection('SkillHubCourses');

  Future updateUserData(String id , String name , String email , String phUrl , String password , String mobileNumber , String phFile) async{

    return await collectionReference.document(id).setData({
      'name':name,
      'email':email,
      'phUrl':phUrl,
      'phFile':phFile,
      'password':password,
      'mobileNumber':mobileNumber
    });
  }
  // get Skill Hub Users

  Stream<QuerySnapshot> get users {
    return collectionReference.snapshots();
  }

  /*Future<String> getSpecificUser( String uid) async{
    String name = '';
      await collectionReference.document(uid).get().then((value) => {
          name = value['name']
      });
      return name;
  }*/
  Future updateUserPhUrl(String id , String phFile ) async{

    return await collectionReference.document(id).updateData({
      'phUrl':phFile,
    });
  }

  Future updateUserCourses(var courseId,String id) async{

    //courseId = [1,3];
    return await coursesReference.document(id).updateData({
      'coursesId' : courseId,
    });

  }

}