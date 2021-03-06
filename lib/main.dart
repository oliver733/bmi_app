import 'dart:io';
import 'package:bmi/colors.dart';
import 'package:bmi/data/strings.dart';
import 'package:bmi/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyStrings.appName,
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
        appBarTheme: AppBarTheme(
          textTheme: GoogleFonts.quicksandTextTheme(TextTheme(
              title: TextStyle(
                  fontSize: 30,
                  color: MyColors.grey,
                  fontWeight: FontWeight.w800))),
          iconTheme: IconThemeData(color: Colors.black),
          brightness: (Platform.isIOS ? Brightness.light : null),
          color: Colors.white,
          elevation: 0,
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: MyColors.green,
            splashColor: Colors.transparent,
            padding: EdgeInsets.all(14),
            shape: StadiumBorder()),
      ),
      home: MyHomePage(),
    );
  }
}
