import 'package:cinetopia/app/models/movie.dart';
import 'package:flutter/material.dart';

// Criado uma classe chamada DetailsMoviePage que estende StatelessWidget, que é um widget sem estado.
class DetailsMoviePage extends StatelessWidget {
  // Construtor da classe DetailsMoviePage, que é um widget sem estado.
  const DetailsMoviePage({super.key, required this.movie});

  // Criado uma variável final chamada movie, que é do tipo Movie.
  final Movie movie;

  @override
  // O método build é responsável por construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é um widget que fornece uma estrutura básica para a página, incluindo uma barra de aplicativo, corpo e outros elementos.
    return Scaffold(
      // A propriedade appBar é usada para definir a barra de aplicativo na parte superior da página.
      appBar: AppBar(
        // Define o fundo da AppBar como uma cor sólida.
        backgroundColor: Color(0xFF120326),
        // O leading é um widget que será exibido no lado esquerdo da AppBar, geralmente usado para exibir um ícone de voltar ou um menu.
        leading: IconButton(
          // O icon é o ícone que será exibido no botão, neste caso, um ícone branco de seta para trás.
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          // O onPressed é uma função que será chamada quando o botão for pressionado.
          onPressed: () {
            // Navigator.of(context).pop() é usado para fechar a página atual e voltar para a página anterior na pilha de navegação.
            Navigator.of(context).pop();
          },
        ),
      ),
      // O backgroundColor define a cor de fundo do Scaffold, que é o widget principal da página.
      backgroundColor: Color(0xFF120326),
      // O body é o conteúdo principal da página, que será exibido dentro do Scaffold.
      body: SingleChildScrollView(
        // O padding está aplicando um espaçamento de 16 pixels ao redor do widget Column.
        padding: const EdgeInsets.all(16),
        // O child é o widget que será exibido dentro do Padding, neste caso, é um widget Column.
        child: Column(
          // O children é uma lista de widgets que serão exibidos dentro do Column.
          children: [
            // O widget Column é usado para organizar os widgets filhos verticalmente.
            Column(
              // O children é uma lista de widgets que serão exibidos dentro do Column.
              children: [
                Image.asset(
                  // O Image.asset é usado para carregar uma imagem a partir de um arquivo localizado no diretório assets do aplicativo.
                  'assets/movie.png',
                  // Define a largura da imagem como 80 pixels.
                  width: 80,
                  // Define a altura da imagem como 80 pixels.
                  height: 80,
                ),
                // O widget Text é usado para exibir um texto na tela.
                Text(
                  // O textAlign define o alinhamento do texto dentro do widget Text, nesse caso o texto será centralizado horizontalmente para o centro.
                  textAlign: TextAlign.center,
                  // Exibe o título do filme.
                  movie.title,
                  // Define o estilo do texto, incluindo tamanho da fonte e peso da fonte.
                  style: const TextStyle(
                    // Define a cor do texto como um tom de cinza claro.
                    color: Color(0xFFEBEBEB),
                    // Define o tamanho da fonte do texto.
                    fontSize: 24,
                    // Define o peso da fonte do texto, tornando-o mais espesso.
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            // O widget Padding é um widget que adiciona um espaço em branco ao redor de outro widget.
            Padding(
              // O padding está aplicando um espaçamento de 40 pixels na parte inferior e 32 pixels na parte superior do widget Padding.
              padding: EdgeInsets.only(bottom: 40, top: 32),
              child: Container(
                // Define a largura e altura do container.
                width: 175,
                // Define a altura do container.
                height: 235,
                // O decoration é uma propriedade que permite definir a decoração do container, como cor de fundo, borda, sombra, etc.
                decoration: BoxDecoration(
                  // Define a cor de fundo do container.
                  color: Color(0XFF000000),
                  // Define uma borda circular para o container, com um raio de 8 pixels.
                  borderRadius: BorderRadius.circular(16),
                  // A propriedade image é usada para definir uma imagem de fundo para o container.
                  image: DecorationImage(
                    // Define a imagem de fundo do container, que é a imagem do filme.
                    image: NetworkImage(movie.getPosterImageUrl()),
                    // Define o ajuste da imagem para cobrir todo o espaço do container.
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // O widget Column é usado para organizar os widgets filhos verticalmente.
            Column(
              // O mainAxisSize está configurado como MainAxisSize.min, o que significa que o Row ocupará apenas o espaço necessário para seus filhos e não o espaço máximo disponível por padrão.
              mainAxisSize: MainAxisSize.min,
              // O crossAxisAlignment está configurado como CrossAxisAlignment.start, o que significa que os widgets filhos serão alinhados no início do eixo transversal (vertical).
              crossAxisAlignment: CrossAxisAlignment.start,
              // A lista de widgets filhos que serão exibidos dentro do Column.
              children: <Widget>[
                // O widget Text é usado para exibir um texto na tela.
                Padding(
                  // Aplica um padding de 6 pixels na parte inferior do widget Padding.
                  padding: const EdgeInsets.only(bottom: 16),
                  // O widget Text é usado para exibir um texto na tela.
                  child: Text(
                    // Exibe a data de lançamento do filme.
                    "Descrição",
                    // Define o estilo do texto, incluindo tamanho da fonte e peso da fonte.
                    style: const TextStyle(
                      // Define a cor do texto como um tom de cinza claro.
                      color: Color(0xFFEBEBEB),
                      // Define o tamanho da fonte do texto.
                      fontSize: 18,
                      // Define o peso da fonte do texto, tornando-o mais espesso.
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // O widget Padding é um widget que adiciona um espaço em branco ao redor de outro widget.
                Padding(
                  // O padding está aplicando um espaçamento de 16 pixels na parte inferior do widget Padding.
                  padding: const EdgeInsets.only(bottom: 16),
                  // O widget Text é usado para exibir um texto na tela.
                  child: Text(
                    // A descrição do filme é exibida no widget Text.
                    movie.overview,
                    // Define o estilo do texto, incluindo tamanho da fonte e peso da fonte.
                    style: const TextStyle(
                      // Define o peso da fonte do texto, tornando-o mais espesso.
                      fontSize: 14,
                      // Define a cor do texto como um tom de cinza claro.
                      color: Color(0xFFEBEBEB),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
