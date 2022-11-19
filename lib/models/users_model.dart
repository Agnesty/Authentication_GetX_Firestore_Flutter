import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  String username, email, uid;

  User({
    required this.username,
    required this.email, 
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "email" : email,
    "uid" : uid
  };

  static User fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot['username'], 
      email: snapshot['email'], 
      uid: snapshot['uid']);
  }
}