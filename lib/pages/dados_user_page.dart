import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/shared_preferences_service.dart';

class DadosUserPage extends StatefulWidget {
  const DadosUserPage({super.key});

  @override
  State<DadosUserPage> createState() => _DadosUserPageState();
}

class _DadosUserPageState extends State<DadosUserPage> {
  bool isObscure = true;
  Color corBorda = Colors.black;
  String? login;
  String? senha;

  @override
  void initState() {
    super.initState();

    loadSharedPreferences();
  }

  loadSharedPreferences() async {
    String? loginStorage = await SharedPreferencesService.getStringLocalStorage(
      "login",
    );
    String? senhaStorage = await SharedPreferencesService.getStringLocalStorage(
      "senha",
    );
    setState(() {
      login = loginStorage;
      senha = senhaStorage;
    });
  }

  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
        title: Text("Dados Usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Text(login ?? "Não tenho dados de login"),
            Text(senha ?? "Não tenho dados de senha"),
          ],
        ),
      ),
    );
  }
}
