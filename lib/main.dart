import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moni/screens/home_screen.dart';

import 'Core/utils/moni_colors.dart';

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
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: MoniColors.darkDarker,
          centerTitle: true,

        )


      ),
      home: const HomeScreen()
    );
  }
}


