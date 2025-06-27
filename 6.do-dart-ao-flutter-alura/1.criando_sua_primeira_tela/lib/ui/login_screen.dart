import 'package:flutter/material.dart';

// Criado um widget Stateless chamado LoginScreen, responsável por renderizar a tela de login do aplicativo.
class LoginScreen extends StatelessWidget {
  // Criado um construtor para o widget LoginScreen que recebe uma chave opcional (super.key).
  const LoginScreen({super.key});

  // A anotação @override indica que este método sobrescreve um método da classe pai (StatelessWidget).
  @override
  // O método build é chamado para construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // O Scaffold é um widget que fornece uma estrutura básica para a interface do usuário, como barra de aplicativos, corpo e navegação.
    return Scaffold(
      // Renderiza uma coluna de widgets dentro do corpo do Scaffold.
      body: Column(
        children: <Widget>[
          // Renderiza um widget Text com o texto "Sistema de Gestão de Contas".
          const Text("Sistema de Gestão de Contas"),
          // Renderiza um widget TextFormField, que é um campo de entrada de texto para o usuário digitar.
          TextFormField(),
          TextFormField(),
          // Renderiza um widget ElevatedButton, que é um botão elevado que pode ser pressionado pelo usuário.
          ElevatedButton(
            // Define a ação a ser executada quando o botão for pressionado.
            onPressed: () {},
            // Define o filho do botão ou seja o que será exibido dentro do botão.
            child: const Text("Entrar"),
          ),
        ],
      ),
    );
  }
}
