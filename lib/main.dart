import 'package:flutter/material.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/signup_page.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:LoginPage(),
      routes:{
        LoginPage.id:(context)=>LoginPage(),
        SignUp.id:(context)=>SignUp(),
      },
      debugShowCheckedModeBanner:false,
    );
  }
}

