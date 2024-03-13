import 'dart:convert';
import 'dart:developer';
import 'package:aadhar_soft/UiHelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:aadhar_soft/model.dart';
import 'package:http/http.dart';
import 'package:flutter/src/material/dropdown.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? dropdownValue;
  List<String>dropdownOptions =['Option 1','Option 2','Option 3'];
  var _value = "-1";
Future<void>postData(String selectedValue)async{
  final apiUrl='http://students.wissenerp.com/Login/get_schools';
  final response= await http.post(Uri.parse(apiUrl),
    body: jsonEncode({
      'selectedValue':selectedValue
    }),
    headers: {'contant-Type': 'application/json'},
  );
  if (response.statusCode==200) {
print('Data posted sueccfully');
  }else{
    print('failed to Post Data:${response.statusCode}');
  }
}

  TextEditingController UserController = TextEditingController();
  TextEditingController PassController = TextEditingController();
  TextEditingController schoolController=TextEditingController();
  TextEditingController loginasController=TextEditingController();

  Future<void>login(String username,String password,String schoolname,String loginas)async{
    try{
      final response=await http.post(Uri.parse("http://students.wissenerp.com/Login/check_login")
          ,body: jsonEncode({"username":username,"password":password,"login_as":loginas,"school":schoolname}),headers: {
        'Content-Type':'application/json'
      });
      if(response.statusCode==200){
        log("User Created");
      }
      else{
        log("Not Created");
      }
    }
    catch(ex){
      log(ex.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white24,
                Colors.black87,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Card(
            elevation: 15,
            child: Container(
              height: 520,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign in start Your Sesion",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  UiHelper.CustomTextField(
                      UserController, "Username", Icons.person, 8, false),
                  UiHelper.CustomTextField(
                      PassController, "Password", Icons.lock, 8, true),
                 // UiHelper.CustomTextField(
                   //   schoolController, "School", Icons.lock, 8, false),
                  UiHelper.CustomTextField(loginasController,"Login As", Icons.mail, 8, false),

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10),
                         child: Center(
                           child: DropdownButtonFormField(
                             decoration: InputDecoration(
                               border: InputBorder.none
                             ),
                              value: _value,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Login As",style: TextStyle(color: Colors.black54),),
                                  value: "-1",
                                ),
                                DropdownMenuItem(
                                  child: Text("Parents"),
                                  value: "1",
                                ),
                                DropdownMenuItem(
                                  child: Text("Students"),
                                  value: "2",
                                ),
                              ],
                              onChanged: (v) {}),
                         ),
                       ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButtonFormField(
                            value: _value,
                            decoration: InputDecoration(
                              border: InputBorder.none
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text("Select School",style: TextStyle(color: Colors.black54),),
                                value: "-1",
                              ),
                              DropdownMenuItem(
                                child: Text("Wissen"),
                                value: "1",
                              ),
                              DropdownMenuItem(
                                child: Text("Euro Kids"),
                                value: "2",
                              ),
                            ],
                            onChanged: (v) {}),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          login(UserController.text, PassController.text, schoolController.text, loginasController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey[900],
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  /*Container(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(onPressed: (){
                                      },style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[900],
                    ),
                        child: Text("Go To Website",style: TextStyle(color: Colors.white))),
                  */
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
