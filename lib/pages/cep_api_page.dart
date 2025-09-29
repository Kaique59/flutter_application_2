// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Models/endereco_model.dart';
import 'package:flutter_application_1/Services/shared_preferences_service.dart';
import 'package:flutter_application_1/Services/via_cep_service.dart';
import 'package:flutter_application_1/widgets/custom_dialog.dart';

class CepApiPage extends StatefulWidget {
  const CepApiPage({super.key});

  @override
  State<CepApiPage> createState() => _CepApiPageState();
}

class _CepApiPageState extends State<CepApiPage> {
  Endereco? endereco;
  bool isLoading = false;

  ViaCepService viaCepService = ViaCepService();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController controllerCEP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
        title: Text("Consumo API Cep"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 8,
              keyboardType: TextInputType.number,
              controller: controllerCEP,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                      endereco = null;
                    });

                    if (controllerCEP.text.length < 8) {
                      showDialog(
                        barrierDismissible: false,

                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            message: "O CEP deve conter 8 digitos",
                            icon: Icons.warning_rounded,
                            title: "Atenção",
                            textButton: "Tentar novamente",
                            controller: controllerCEP,
                          );
                        },
                      );
                      setState(() {
                        isLoading = false;
                      });
                      return;
                    }

                    try {
                      Endereco enderecoResposta = await viaCepService
                          .buscarEmdereco(controllerCEP.text);

                      if (enderecoResposta.logradouro != null) {
                        setState(() {
                          endereco = enderecoResposta;
                        });
                        return;
                      }

                      showDialog(
                        barrierDismissible: false,

                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            message: "O CEP não foi encontrado",
                            icon: Icons.warning_rounded,
                            title: "Atenção",
                            textButton: "Tentar novamente",
                            controller: controllerCEP,
                          );
                        },
                      );
                    } catch (erro) {
                      throw Exception("Problema ao encontrar cep: $erro");
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: isLoading
                      ? Padding(
                          padding: const EdgeInsets.all(12),
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.indigo,
                          ),
                        )
                      : Icon(Icons.search),
                ),

                labelText: "Digite o cep",
                hintText: "EX: 45000000",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),

            if (endereco?.logradouro != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Logradouro:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Text(endereco!.logradouro!),
                  Text(
                    "Bairro:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.bairro!),
                  Text(
                    "Localidade:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.estado!),
                  Text("Estado", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(endereco!.estado!),
                  Text(
                    "Região:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.regiao!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
