import 'dart:io';

void main() {
  // Imprime uma mensagem no console
  print('Hello, World!');

  // Criado uma variável chamada entrada que armazena o que o usuário digitar
  var entrada = stdin.readLineSync();
  // Imprime o valor da variável entrada
  print(entrada);

  // Imprime uma mensagem no console
  print("Olá, me chamo Dart. Qual seu nome?");
  // Lê a entrada do usuário
  String? nome = stdin.readLineSync();
  // Imprime uma mensagem personalizada com o nome do usuário, na qual o nome é interpolado($nome)
  print("Olá, $nome! Prazer em te conhecer!");
}
