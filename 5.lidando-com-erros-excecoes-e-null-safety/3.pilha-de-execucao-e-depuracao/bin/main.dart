import 'package:meu_app/screens/account_screen.dart';

void main() {
  // Cria uma instância do AccountScreen, e armazena na variável accountScreen.
  AccountScreen accountScreen = AccountScreen();

  // Acessa a variável accountService da instância accountScreen, e chama o método initializeStream responsável por iniciar o stream de contas.
  accountScreen.initializeStream();

  // Acessa a variável accountService da instância accountScreen, e chama o método runChatBot responsável por iniciar o chatbot.
  accountScreen.runChatBot();
}

// void main() {
//   print("Começou a main");
//   // Chama a função function01
//   function01();
//   print("Terminou a main");
// }
//
// // Criado uma função chamada function01 que não recebe parâmetros e não retorna nada
// void function01() {
//   print("Começou a Função 01");
//   // Chama a função function02
//   function02();
//   print("Terminou a Função 02");
// }
//
// // Criado uma função chamada function02 que não recebe parâmetros e não retorna nada
// void function02() {
//   print("Começou a Função 02");
//   // Faz um loop de 0 a 4
//   for(int i = 0; i < 5; i++) {
//     print("Contando: $i");
//   }
//   print("Terminou a Função 02");
// }
