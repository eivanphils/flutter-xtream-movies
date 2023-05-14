import 'package:flutter/material.dart';

class AppTheme {
  static const darkBlue = Color.fromRGBO(7, 26, 37, 1);
  static const lightBlue = Color.fromRGBO(16, 93, 197, 1);
  static const darkGrey = Color.fromRGBO(163, 173, 183, 1);
  static const lightGrey = Color.fromRGBO(209, 216, 224, 1);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    // Primary Color
    primaryColor: lightBlue,
    disabledColor: darkGrey,
    
    //AppBar Theme
    appBarTheme: const AppBarTheme(
      elevation: 10,
      backgroundColor: darkGrey,
      iconTheme: IconThemeData(
        color: darkBlue
      )
    ),

    // TextButtons
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: lightBlue
      )
    )
  );
}
