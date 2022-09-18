import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pln/utility/style.dart';

import 'utility/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Work Order',
      initialRoute: '/',
      routes: customRoutes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: whiteColor,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: primaryColor),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context)
              .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
      ),
      // home: const SplashScreen(),
    );
  }
}
