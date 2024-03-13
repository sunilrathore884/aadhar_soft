import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(TextEditingController Controller, String text,
      IconData iconData, double border, bool toHide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(top: 2,left:10),
            child: TextField(
                controller: Controller,
                obscureText: toHide,
                decoration: InputDecoration(
                    hintText: text,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Icon(iconData),
                    ),
                    border: InputBorder.none)
            ),
          )
      ),
    );
  }
  static CustomAlertBox(BuildContext context,String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text( text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("OK"))
        ],
      );
    }
    );
  }


}
