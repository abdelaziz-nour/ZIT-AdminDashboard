import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zit_admin_screens/app_screens/admin_board.dart';
import 'package:zit_admin_screens/app_screens/payments.dart';
import 'package:zit_admin_screens/app_screens/products.dart';
import 'package:zit_admin_screens/app_screens/storeinfo.dart';
import 'package:zit_admin_screens/app_screens/stores.dart';
import 'app_screens/login.dart';
// ignore: depend_on_referenced_packages
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'zit project',
        debugShowCheckedModeBanner: false,
        home: log_in(),
        //start localizations
        // ignore: prefer_const_literals_to_create_immutables
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", ""),
        ],
        locale: const Locale("ar", ""),
        //end localizations
        theme: ThemeData(
          textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
          primaryColor: const Color.fromARGB(255, 4, 70, 75),
        ),
      );
    });
  }
}
