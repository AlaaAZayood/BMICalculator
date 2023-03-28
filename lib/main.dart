import 'package:flutter/material.dart';
import 'package:untitled/screen/Bmi_Screen.dart';
import 'package:untitled/screen/bmi_result.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}
