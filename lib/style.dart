import 'package:flutter/material.dart';

InputDecoration AppInputDecoration(label){
  return InputDecoration(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.all(10),
    prefixIcon: Icon(Icons.monitor_weight_outlined),
    labelText: label,

  );
}
TextStyle HeadlineText (){
  return TextStyle(fontSize: 40 , fontWeight: FontWeight.w700 ,color: Colors.red);
}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
  );
}