
class EstudosList {
  
  List<String> nameList = ["Diego", "Kaique", "Bia", "Andrey"];
  List<int> numberList = [1, 2, 3, 4, 5];

  List<dynamic> mixList = [
    1,
    "Diego",
    true,
    () {
      print("Imprime na tela");
    },
  ];



  void imprimirLista() {
    print(nameList[0]);

    int count = 10;
    for (var i = 0; i < nameList.length; i++) {
      print(nameList[i]);
    }

    for (String name in nameList) {
      print(name);
    }

    for (int number in numberList) {
      print(number * 3);
    }
  } 

  Map<String, dynamic> dadosDiego = { 
    "nome": "Diego", 
    "idade": 40, 
    "nacionalidade": "Brasileira"
  };

  void imprimeMap() {
    print(dadosDiego["nome"]);
    print(dadosDiego["Kaique"]);
  }

}