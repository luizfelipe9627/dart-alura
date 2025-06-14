import 'package:meu_app/screens/account_screen.dart';

void main() {
  // Cria uma instância do AccountScreen, e armazena na variável accountScreen.
  AccountScreen accountScreen = AccountScreen();

  // Acessa a variável accountService da instância accountScreen, e chama o método initializeStream responsável por iniciar o stream de contas.
  accountScreen.initializeStream();

  // Acessa a variável accountService da instância accountScreen, e chama o método runChatBot responsável por iniciar o chatbot.
  accountScreen.runChatBot();
}
