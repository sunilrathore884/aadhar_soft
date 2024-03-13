import 'package:flutter/material.dart';
class model {
  int? status;
  String? message;
  Data? data;

  model({this.status, this.message, this.data});

  model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? stuId;
  String? photo;
  String? school;
  String? username;
  String? userType;

  Data(
      {this.firstName,
        this.lastName,
        this.stuId,
        this.photo,
        this.school,
        this.username,
        this.userType});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    stuId = json['stu_id'];
    photo = json['photo'];
    school = json['school'];
    username = json['username'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['stu_id'] = this.stuId;
    data['photo'] = this.photo;
    data['school'] = this.school;
    data['username'] = this.username;
    data['user_type'] = this.userType;
    return data;
  }
}
