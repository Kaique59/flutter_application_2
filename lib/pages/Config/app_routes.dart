import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/cep_api_page.dart';
import 'package:flutter_application_1/pages/dados_user_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/location_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (context) => HomePage(),
    "/perfil": (context) => ProfilePage(),
    "/DadosUsuario": (context) => DadosUserPage(),
    "/viaCepApi": (context) => CepApiPage(),
    "/locationPage": (context) => LocationPage(),
  };
}
