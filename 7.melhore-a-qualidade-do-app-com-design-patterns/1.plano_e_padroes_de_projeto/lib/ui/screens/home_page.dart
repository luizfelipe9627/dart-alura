import 'package:flutter/material.dart';
import '../components/buttons.dart';

// Criado uma classe chamada HomePage que estende StatelessWidget, que é um widget sem estado.
class HomePage extends StatelessWidget {
  // Construtor da classe HomePage, que é um widget sem estado.
  const HomePage({super.key});

  @override
  // O método build é responsável por construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é um widget que fornece uma estrutura básica para a página, incluindo uma barra de aplicativo, corpo e outros elementos.
    return Scaffold(
      // Define o corpo da página como um widget Column, que é um widget que organiza seus filhos em uma coluna vertical.
      body: Column(
        // O children é uma lista de widgets que serão exibidos dentro do Column.
        children: <Widget>[
          // Image.asset é um widget que exibe uma imagem a partir de um arquivo localizado no diretório assets do aplicativo.
          Image.asset("assets/logo.png"),
          Image.asset("assets/splash.png"),
          // Text é um widget que exibe um texto na tela.
          Text(
            "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!",
          ),
          // O widget PrimaryButton é um botão personalizado que foi criado como componente separado.
          PrimaryButton()
        ],
      ),
    );
  }
}