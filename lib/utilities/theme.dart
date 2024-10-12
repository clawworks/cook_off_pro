import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const borderRadius = 10.0;

final pLightTheme = Provider(
  (ref) => ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    // colorScheme: const ColorScheme(
    //   brightness: Brightness.light,
    //   primary: Color(0xff57CC02),
    //   onPrimary: Color(0xffFFFFFF),
    //   secondary: Color(0xff1CB0F6),
    //   onSecondary: Color(0xffFFFFFF),
    //   tertiary: Color(0xffFFC702),
    //   onTertiary: Color(0xffFFFFFF),
    //   primaryContainer: Color(0xff6A5FE8),
    //   onPrimaryContainer: Color(0xffFFFFFF),
    //   error: Color(0xffFF4B4C),
    //   onError: Color(0xffFFFFFF),
    //   background: Color(0xffFFFFFF),
    //   onBackground: Color(0xff3C3C3C),
    //   surface: Color(0xffFFFFFF),
    //   onSurface: Color(0xff818181),
    // ),
    // hintColor: const Color(0xffC6C6C6),
    // inputDecorationTheme: InputDecorationTheme(
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: const BorderSide(
    //       width: 2.0,
    //       color: Color.fromRGBO(198, 198, 198, 1.0),
    //     ),
    //     borderRadius: BorderRadius.circular(20.0),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: const BorderSide(
    //       width: 2.0,
    //       color: Color.fromRGBO(198, 198, 198, 1.0),
    //     ),
    //     borderRadius: BorderRadius.circular(20.0),
    //   ),
    // ),
    // appBarTheme: const AppBarTheme(
    //   color: Color(0xffFFFFFF),
    //   elevation: 0.0,
    //   foregroundColor: Color(0xFF1CB0F6),
    // ),
    // menuTheme: MenuThemeData(
    //   style: MenuStyle(
    //     shape: MaterialStateProperty.all(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //       ),
    //     ),
    //   ),
    // ),
    // menuButtonTheme: MenuButtonThemeData(
    //   style: ButtonStyle(
    //     padding: MaterialStateProperty.all(EdgeInsets.all(26.0)),
    //   ),
    // ),
  ),
);

final pDarkTheme = Provider(
  (ref) => ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff191919),
    cardColor: const Color(0xff292929),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFEE620),
      onPrimary: Color(0xff000000),
      // secondary: Color(0xff1CB0F6),
      secondary: Color(0xffFFC702),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffFFC702),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffFFC702),
      onTertiary: Color(0xffFFFFFF),
      primaryContainer: Color(0xff6A5FE8),
      onPrimaryContainer: Color(0xffFFFFFF),
      error: Color(0xffFF4B4C),
      onError: Color(0xffFFFFFF),
      background: Color(0xff191919),
      onBackground: Color(0xff3C3C3C),
      surface: Color(0xff292929),
      surfaceTint: Colors.transparent,
      onSurface: Color(0xff818181),
    ),
    // hintColor: const Color(0xffC6C6C6),
    // inputDecorationTheme: InputDecorationTheme(
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: const BorderSide(
    //       width: 2.0,
    //       color: Color.fromRGBO(198, 198, 198, 1.0),
    //     ),
    //     borderRadius: BorderRadius.circular(20.0),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: const BorderSide(
    //       width: 2.0,
    //       color: Color.fromRGBO(198, 198, 198, 1.0),
    //     ),
    //     borderRadius: BorderRadius.circular(20.0),
    //   ),
    // ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      // fillColor: JmapColor.darkestGrey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide.none, //BorderSide(color: Colors.green),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
    ),
    appBarTheme: const AppBarTheme(
      // color: Colors.white,
      // color: Colors.black,
      color: Color(0xff191919),
      elevation: 0.0,
      // foregroundColor: Color(0xFF1CB0F6),
    ),
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(shape: RoundedRectangleBorder(b)),
    // ),
    // dropdownMenuTheme: DropdownMenuThemeData(
    //   inputDecorationTheme: InputDecorationTheme(
    //       contentPadding: EdgeInsets.all(33.0), border: InputBorder),
    // ),
    // menuTheme: MenuThemeData(
    //   style: MenuStyle(
    //     shape: MaterialStateProperty.all(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //       ),
    //     ),
    //   ),
    // ),
    // menuButtonTheme: MenuButtonThemeData(
    //   style: ButtonStyle(
    //     padding: MaterialStateProperty.all(EdgeInsets.all(26.0)),
    //   ),
    // ),
  ),
);
