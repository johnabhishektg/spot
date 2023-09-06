import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spot/src/pages/onboarding_screen.dart';
import 'package:spot/src/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spot',
        theme: ThemeData(
            textTheme: GoogleFonts.openSansTextTheme(
              Theme.of(context).textTheme,
            ),
            brightness: Brightness.light,
            primaryColor: Colors.yellowAccent.shade400),
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const OnboardingScreen());
  }
}
