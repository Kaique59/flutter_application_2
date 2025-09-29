import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/Services/gallery_servicr.dart';
import 'package:flutter_application_1/Services/shared_preferences_service.dart';
import 'package:flutter_application_1/listis/app_list.dart';
import 'package:flutter_application_1/widgets/custom_title.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isObscure = true;
  Color corBorda = Colors.black;

  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  GalleryService acsssargaleria = GalleryService();
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/DadosUsuario");
              },
              child: Icon(Icons.settings),
            ),
          ),
        ],
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
        title: Text('Meu Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: corBorda,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: selectedImage != null
                              ? Image.file(
                                  selectedImage!,
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBFHr6GNsvB2Uj9YbOOrPM4VWN-FRzIg1SBVFHCMQr21zt4fMbXd4P9xPdZ1rgq-3bhSU&usqp=CAU",
                                ),
                        ),
                      ),
                    ),

                    Positioned(
                      right: 90,
                      bottom: 30,
                      child: GestureDetector(
                        onTap: () async {
                          File? file = await acsssargaleria
                              .captureImageFromCamera();
                          if (file != null) {
                            setState(() {
                              selectedImage = file;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.camera),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            corBorda = Colors.red;
                          });
                        },
                        child: Container(
                          color: Colors.red,
                          child: Text("Vermelho"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            corBorda = Colors.green;
                          });
                        },
                        child: Container(
                          color: Colors.green,
                          child: Text("Verde"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            corBorda = Colors.blue;
                          });
                        },
                        child: Container(
                          color: Colors.blue,
                          child: Text("Azul"),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                CustomTitle(
                  title: "Meu nome",
                  icon: Icons.person_3,
                  subtitle: "Kaique Santos Silva",
                ),

                SizedBox(height: 20),

                CustomTitle(
                  title: "Meu email",
                  icon: Icons.email,
                  subtitle: "kaique.santos@gmail.com",
                ),

                SizedBox(height: 20),

                CustomTitle(
                  title: "Meu cargo",
                  icon: Icons.business,
                  subtitle: "Desempregado",
                ),

                SizedBox(height: 20),

                Form(
                  child: Column(
                    children: [
                      ...AppList.listTitles.map((title) {
                        return CustomTitle(
                          title: title["title"],
                          icon: title["icon"],
                          subtitle: title["valor"],
                        );
                      }),
                      TextFormField(
                        maxLength: 10,
                        controller: controllerLogin,
                        decoration: InputDecoration(
                          labelText: "Login",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: controllerSenha,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },

                            child: Icon(
                              isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          labelText: "Senha",
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                    print(controllerLogin.text);
                    print(controllerSenha.text);

                    await SharedPreferencesService.setStringLocalStorage(
                      controllerLogin.text,
                      "login",
                    );
                    await SharedPreferencesService.setStringLocalStorage(
                      controllerSenha.text,
                      "senha",
                    );
                  },
                  child: Text("Realisar login"),
                ),

                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10),
                    Text(
                      "Bio",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 190, 189, 189),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse efficitur laoreet ex, nec interdum risus. Duis id accumsan sapien. In sed scelerisque dui. Ut sit amet hendrerit neque. Maecenas malesuada mi eu felis feugiat, id feugiat nisl tristique. Donec nibh sem, lacinia at est egestas, aliquam dapibus est. Cras consequat malesuada scelerisque. Sed feugiat odio nec finibus gravida. Integer maximus dolor vel purus maximus ornare. Nulla sit amet ex tortor.Nunc vel libero ac risus rhoncus rutrum. Curabitur aliquam ipsum ac elit commodo convallis. Phasellus commodo, erat sed ultricies malesuada, nibh massa hendrerit ante, vel vestibulum dolor odio quis dui. Nam eu hendrerit augue, nec blandit felis. Curabitur blandit mauris mauris, nec dignissim metus luctus vel. Donec ornare tempus massa, ac egestas nibh lacinia eget. Nulla venenatis elit porta leo tincidunt tempor. Nunc a auctor sem, at sagittis ante. Ut tempor vestibulum lobortis. Pellentesque viverra dui non ante ullamcorper viverra. Sed id sagittis quam. Nullam convallis tempus erat ut iaculis. Proin blandit ac sapien vitae tempor. Donec iaculis, ligula lobortis hendrerit scelerisque, ex libero efficitur sapien, ac ultricies augue dolor ut orci. Praesent vehicula nunc congue semper tempor.Nam sit amet placerat sem, vel porta nunc. Donec nec dui tristique sem pellentesque finibus. Integer dictum, quam vitae ultrices vehicula, nibh libero dignissim tortor, nec iaculis dui ex ut massa. Sed molestie volutpat orci, vitae vestibulum lorem cursus id. Pellentesque tincidunt efficitur hendrerit. Aliquam erat volutpat. Aenean facilisis quam eget augue malesuada, eu gravida velit lobortis. Curabitur at diam id risus varius tincidunt. Nam et tincidunt elit. Phasellus ultrices massa vitae aliquet cursus. Integer luctus iaculis quam, nec mattis enim ultricies id.",
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(Colors.indigo),
                  ),
                  onPressed: () {
                    print("Cliquei");
                    Navigator.pushNamed(context, "/");
                  },
                  child: Text("Voltar para Home"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
