import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/home_screen.dart';
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
      // Configura as rotas do aplicativo, que são usadas para navegar entre diferentes telas do aplicativo.
      routes: {
        "login": (context) => const LoginScreen(), // Pega o contexto que é a tela atual e retorna o widget LoginScreen, ou seja, a tela de login.
        "home": (context) => const HomeScreen(), // Pega o contexto que é a tela atual e retorna o widget HomeScreen, ou seja, a tela inicial do aplicativo.
      },
      // Define a rota inicial do aplicativo, que é a tela que será exibida quando o aplicativo for iniciado.
      initialRoute: "login", // Define a rota inicial do aplicativo como "login", ou seja, a tela de login será exibida primeiro.
    );
  }
}
