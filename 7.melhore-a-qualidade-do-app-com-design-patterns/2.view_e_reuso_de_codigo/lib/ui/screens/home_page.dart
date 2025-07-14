import 'package:cinetopia/ui/screens/search_movies.dart';
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
      // O Ink é um widget que permite que você desenhe uma superfície com uma cor de fundo e uma borda ou seja, é usado para criar um efeito de tinta quando o usuário toca nele.
      body: Ink(
        decoration: BoxDecoration(
          // Define um gradiente linear que vai do preto (0xFF000000) ao roxo escuro (0xFF1D0E44) para o fundo do container.
          gradient: LinearGradient(
            colors: <Color>[Color(0xFF000000), Color(0xFF1D0E44)],
            // O begin e end definem a direção do gradiente, que vai do topo ao centro do container.
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          // O padding está aplicando um espaçamento ao redor do widget Column, com 19 pixels de espaçamento na parte superior e inferior, e 26 pixels nas laterais.
          padding: const EdgeInsets.symmetric(horizontal: 26),
          // O widget Center é usado para centralizar o conteúdo dentro do Scaffold.
          child: Center(
            // Define o corpo da página como um widget Column, que é um widget que organiza seus filhos em uma coluna vertical.
            child: Column(
              // O mainAxisSize define o tamanho do Column como mínimo, ou seja, o Column ocupará apenas o espaço necessário para seus filhos.
              mainAxisSize: MainAxisSize.min,
              // O children é uma lista de widgets que serão exibidos dentro do Column.
              children: <Widget>[
                Padding(
                  // Aplicando um padding de 8 pixels na parte inferior do widget Padding.
                  padding: const EdgeInsets.only(bottom: 24),
                  // Image.asset é um widget que exibe uma imagem a partir de um arquivo localizado no diretório assets do aplicativo.
                  child: Image.asset("assets/logo.png"),
                ),
                Image.asset("assets/splash.png"),
                // Text é um widget que exibe um texto na tela.
                Padding(
                  // Aplicando um padding de 24 pixels na parte superior e inferior do widget Padding.
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!",
                    style: TextStyle(
                      // Define o tamanho da fonte do texto.
                      fontSize: 20,
                      // Define o peso da fonte do texto.
                      fontWeight: FontWeight.w700,
                    ),
                    // O textAlign define o alinhamento do texto dentro do widget Text.
                    textAlign:
                        TextAlign.center, // Centraliza o texto horizontalmente.
                  ),
                ),
                // O widget PrimaryButton é um botão personalizado que foi criado como componente separado.
                PrimaryButton(
                  // O texto a ser exibido no botão, passado como argumento para o construtor.
                  text: "Quero começar!",
                  // O ícone a ser exibido no botão, passado como argumento para o construtor.
                  icon: Icons.arrow_forward,
                  // A função que será chamada quando o botão for pressionado.
                  onTap: () {
                    // Navega para a tela de pesquisa de filmes quando o botão é pressionado.
                    Navigator.push(
                      // O context é usado para navegar entre as telas do aplicativo.
                      context,
                      // MaterialPageRoute é uma rota que cria uma transição de página padrão do Material Design.
                      MaterialPageRoute(builder: (context) => SearchMovies()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
