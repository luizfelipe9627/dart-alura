import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/login_screen.dart';

void main() {
  // Roda o aplicativo Flutter chamando a função runApp e passando o widget BancoDouroApp como argumento.
  runApp(const BancoDouroApp());
}

// Criado um widget Stateless(widget statless é um widget que não tem estado, ou seja, não muda durante a execução do app) chamad BancoDouroApp
class BancoDouroApp extends StatelessWidget {
  // Criado um construtor para o widget BancoDouroApp que recebe uma chave opcional (super.key)
  const BancoDouroApp({super.key});

  // A anotação @override indica que este método sobrescreve um método da classe pai (StatelessWidget).
  @override
  // O método build é chamado para construir a interface do usuário do widget, retorna um MaterialApp que é a raiz do aplicativo Flutter.
  Widget build(BuildContext context) {
    // Retorna um MaterialApp, que é o widget principal do aplicativo Flutter, que fornece a estrutura básica para o aplicativo, como tema, rotas e navegação.
    return MaterialApp(
      // Define a página inicial do aplicativo, que é o widget LoginScreen.
      home: LoginScreen()
    );
  }
}
