import 'dart:async';
import 'dart:developer';

import 'package:aadhar_soft/Splash%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ScSplash extends StatefulWidget {
  const ScSplash({super.key});

  @override
  State<ScSplash> createState() => _ScSplashState();
}

class _ScSplashState extends State<ScSplash> {
  String logo="";
  @override
  void initState(){
    super.initState();
        Timer(Duration(seconds: 4), () async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          setState(() {
            final logo=prefs.getString("logo");
            log(logo.toString());
          });
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Splash()));

        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(logo.toString()),),
    );
  }
}
