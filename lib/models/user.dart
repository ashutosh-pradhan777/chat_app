import 'package:flutter/material.dart';

class User
{
  String uid;
  String name;
  String email;
  String username;
  String status;
  String state;
  String profilePic;

  User({
    this.uid,
    this.name,
    this.email,
    this.username,
    this.status,
    this.state,
    this.profilePic,
});

  Map toMap(User user)
  {
    var data = Map<String,dynamic>();
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['username'] = user.username;
    data['status'] = user.status;
    data['state'] = user.state;
    data['profilePic'] = user.profilePic;
    return data;
  }

  User.fromMap(Map<String,dynamic> mapData)
  {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.email = mapData['email'];
    this.username = mapData['username'];
    this.status = mapData['status'];
    this.state = mapData['state'];
    this.profilePic = mapData['profilePic'];
  }

}