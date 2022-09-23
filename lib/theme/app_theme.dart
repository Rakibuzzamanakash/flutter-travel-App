import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/app_colors.dart';

class AppTheme {
  ThemeData lightTheme() => ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        colorScheme: const ColorScheme.light(),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontStyle:  GoogleFonts.poppins().fontStyle,
          ),

        ),
      );

  ThemeData darkTheme() => ThemeData(
        // brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),

        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.amber,
        // textTheme: GoogleFonts.actorTextTheme(
        //   Theme.of(context).textTheme.apply(),
        // ),
        // textTheme: TextTheme(headline1: TextStyle(color: Colors.teal)),
        scaffoldBackgroundColor: Colors.black38,
      );
}
