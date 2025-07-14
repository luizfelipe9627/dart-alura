import 'package:flutter/material.dart';
import '../ui/screens/home_page.dart';

// Criado uma classe chamada Cinetopia que estende StatelessWidget que é um widget sem estado ou seja, não possui estado mutável.
class Cinetopia extends StatelessWidget {
  // O construtor da classe Cinetopia, que é chamado quando o widget é criado.
  const Cinetopia({super.key});

  @override
  // O método build é responsável por construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // Retorna um MaterialApp, que é um widget que fornece uma estrutura básica para o aplicativo, incluindo tema, título e página inicial.
    return MaterialApp(
      // Define o título do aplicativo, que é exibido na barra de título do sistema operacional.
      title: 'Cinetopia',
      // Define o tema do aplicativo, que é um conjunto de cores e estilos que serão aplicados a todos os widgets do aplicativo.
      theme: ThemeData(
        // Define se o Material 3 deve ser usado, que é uma nova versão do Material Design.
        useMaterial3: true,
        // Define o brilho do tema, que pode ser claro ou escuro.
        brightness: Brightness.dark,
        // Define o conjunto de cores que define as cores primárias, secundárias e de fundo do aplicativo.
        colorSchemeSeed: Colors.deepPurple,
      ),
      // Define a página inicial do aplicativo, que é o widget que será exibido quando o aplicativo for iniciado.
      home: const HomePage(),
    );
  }
}