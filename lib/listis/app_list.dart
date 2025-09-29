import 'package:flutter/material.dart' show Icons;

class AppList {
  
  static List<Map<String, dynamic>> listTitles = [
    {"title": "Nome", "icon": Icons.person_3, "valor": "Kaique Santos"},

    {
      "title": "Meu email", 
      "icon": Icons.email, "valor": 
      "Kaique@gmail.com"
    },

    {
      "title": "Bio", 
      "icon": Icons.fingerprint,
       "valor": "Algum texto etc, etc"
    },
  ];

}