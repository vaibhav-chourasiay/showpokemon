import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonapp/screens/showdetails.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokemon App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      themeMode: ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
      },
      onGenerateRoute: (RouteSettings setting) {
        switch (setting.name) {
          case ShowDetails.detailpage:
            var page = MaterialPageRoute(
              builder: (context) => ShowDetails(
                details: setting.arguments,
              ),
            );
            return page;
        }
      },
    );
  }
}
