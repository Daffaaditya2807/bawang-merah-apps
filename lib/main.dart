import 'package:bawangmerah/pages/detail/detail_kelembapan.dart';
import 'package:bawangmerah/pages/detail/detail_ph_air.dart';
import 'package:bawangmerah/pages/detail/detail_tinggi_air.dart';
import 'package:bawangmerah/pages/page_information.dart';
import 'package:bawangmerah/pages/page_navbar.dart';
import 'package:bawangmerah/pages/page_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bawang Merah',
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        BottomNavBar.routeName: (context) => BottomNavBar(),
        PageInformation.routeName: (context) => PageInformation(),
        DetailPhAir.routeName: (context) => DetailPhAir(),
        DetailTinggirAir.routeName: (context) => DetailTinggirAir(),
        DetailKelembapan.routeName: (context) => DetailKelembapan()
      },
    );
  }
}
