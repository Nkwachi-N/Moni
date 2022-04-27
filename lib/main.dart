import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Core/utils/moni_colors.dart';
import 'UI/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moni',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: MoniColors.darkDarker,
          centerTitle: true,
        ),
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: MoniColors.textColor,
              ), // If this is not set, then ThemeData.light().textTheme is used.
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
