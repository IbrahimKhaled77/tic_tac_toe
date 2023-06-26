import 'package:flutter/material.dart';
void  snackBarItem(context,String value,Color color){
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
       content: Text(
         value,
         style: const TextStyle(color: Colors.white),
       ),
       backgroundColor: color,
       duration: const Duration(seconds: 3),
     ),
   );
 }
