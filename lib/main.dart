import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Flutter_Thai_Hotline_App());
}

class Flutter_Thai_Hotline_App extends StatefulWidget {
  const Flutter_Thai_Hotline_App({super.key});

  @override
  State<Flutter_Thai_Hotline_App> createState() =>
      _Flutter_Thai_Hotline_AppState();
}

class _Flutter_Thai_Hotline_AppState extends State<Flutter_Thai_Hotline_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
