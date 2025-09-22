import "dart:io";

void main() {
  List<String> notas = <String>[];
  menu(notas);
}

String getComando() {
  List<String> comandos = <String>["1", "2", "3"];
  String? entrada = "";

  print("Selecione a opção: 1 - Adicionar nota, 2 - Mostrar notas, 3 - Sair");
  entrada = stdin.readLineSync();

  if(entrada == null || !comandos.contains(entrada)) {
    print("Opção inválida");
    getComando();
  }

  return entrada!;
}

List<String> adicionaNotas(List<String> notas) {
  print("Informe uma nota:");
  String? entrada = stdin.readLineSync();

  if (entrada == null || entrada.isEmpty) { // .isEmpty -> ""
    print("Não é possível adicionar uma nota vazia");
    adicionaNotas(notas);
  }
  notas.add(entrada!);
  return notas;
}

void mostraNotas(List<String> notas) {
  for (var i=0; i < notas.length; i++) {
    print(notas[i]);
  }
}

void menu(List<String> notas) {

  print("");
  header();
  print("");
  print("");

  String comando = getComando();
  print("");

  switch(comando) {
    case "1":
      adicionaNotas(notas);
      menu(notas);
      break;

    case "2":
      mostraNotas(notas);
      menu(notas);
      break;
      
    case "3":
      print("Até breve!");
  }
}

void header() {
  print("  _   _       _             ");
  print(" | \ | |     | |            ");
  print(" |  \| | ___ | |_ __ _ ___  ");
  print(" | . ` |/ _ \| __/ _` / __| ");
  print(" | |\  | (_) | || (_| \__ \ ");
  print(" |_| \_|\___/ \__\__,_|___/ ");
}