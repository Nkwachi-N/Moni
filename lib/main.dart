import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moni/Core/features/loan/provider/loan_provider.dart';
import 'package:moni/UI/utils/moni_colors.dart';
import 'package:provider/provider.dart';
import 'UI/screens/cluster/cluster_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoanProvider(http.Client()),
      child: MaterialApp(
        title: 'Moni',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: MoniColors.darkDarker,
            centerTitle: true,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 15.0,
              )),
              foregroundColor: MaterialStateProperty.all(
                MoniColors.primaryBrand,
              ),
            ),
          ),
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme.apply(
                  bodyColor: MoniColors.textColor,
                ), // If this is not set, then ThemeData.light().textTheme is used.
          ),
        ),
        home: const ClusterScreen(),
      ),
    );
  }
}
