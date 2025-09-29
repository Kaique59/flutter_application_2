import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Config/app_routes.dart';
import 'package:flutter_application_1/pages/cep_api_page.dart';
import 'package:flutter_application_1/pages/dados_user_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/mapa_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/mapaPage",
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
    );
  }
}
