import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

import '../../app/viewmodels/release_movies_viewmodel.dart';
import 'details_movie_page.dart';

// Criado uma classe chamada Releases que estende StatelessWidget, que é um widget sem estado.
class Releases extends StatefulWidget {
  // Construtor da classe Releases, que é um widget sem estado.
  const Releases({super.key});

  @override
  // O método createState cria uma instância do estado associado ao widget Releases.
  State<Releases> createState() => _ReleasesState();
}

// Criada uma classe chamada _ReleasesState que estende o estado do widget Releases.
class _ReleasesState extends State<Releases> {
  // Instância do serviço de lançamentos de filmes.
  final viewModel = ReleaseMoviesViewModel();

  @override
  // O método build é responsável por construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    return Scaffold(
      // Define o fundo da tela como um gradiente linear que vai do roxo escuro para o roxo claro.
      backgroundColor: Color(0xFF120326),
      // O widget FutureBuilder é usado para construir a interface do usuário com base no estado de um Future.
      body: FutureBuilder(
        // O future é usado para especificar o Future que será executado. Neste caso, chama o método getReleasesMovie do serviço de lançamentos de filmes.
        future: viewModel.getReleasesMovie(),
        // O builder é uma função que recebe o contexto e o snapshot do Future e retorna o widget a ser exibido.
        builder: (context, snapshot) {
          // Verifica se o snapshot tem dados.
          if (snapshot.hasData) {
            // Retorna um widget CustomScrollView, que é um widget que permite criar uma lista rolável com slivers (widgets que podem ser rolados).
            return CustomScrollView(
              // Silvers são widgets que podem ser rolados dentro de um CustomScrollView.
              slivers: <Widget>[
                // O SliverToBoxAdapter é usado para adicionar widgets normais dentro de um CustomScrollView.
                SliverToBoxAdapter(
                  child: Center(
                    // O Image.asset é usado para carregar uma imagem de um arquivo local.
                    child: Image.asset(
                      'assets/upcoming.png',
                      // Define a largura da imagem como 100 pixels.
                      width: 100,
                      // Define a altura da imagem como 100 pixels.
                      height: 100,
                    ),
                  ),
                ),
                // Outro SliverToBoxAdapter para adicionar um título antes da lista.
                SliverToBoxAdapter(
                  // O Padding é usado para adicionar espaçamento ao redor do widget filho.
                  child: Padding(
                    // Define o espaçamento superior como 8 pixels e o inferior como 32 pixels.
                    padding: const EdgeInsets.only(top: 8, bottom: 32),
                    // O Center é usado para centralizar o texto dentro do widget.
                    child: Center(
                      child: Text(
                        // Define o texto do widget como 'Próximos Lançamentos'.
                        'Próximos Lançamentos',
                        // Define o alinhamento do texto como centralizado.
                        textAlign: TextAlign.center,
                        // Define o estilo do texto, incluindo a cor, tamanho e peso da fonte.
                        style: const TextStyle(
                          // Define a cor do texto como cinza claro.
                          color: Color(0xFFEBEBEB),
                          // Define o tamanho da fonte como 24 pixels.
                          fontSize: 24,
                          // Define o peso da fonte como negrito.
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                // O SliverList é usado para criar uma lista de itens que podem ser rolados.
                SliverList.builder(
                  // O itemBuilder é uma função que constrói cada item da lista.
                  itemBuilder: (context, index) {
                    // Armazena o filme atual da lista de filmes do viewModel na variável movie.
                    final movie = viewModel.moviesList[index];

                    // O GestureDetector é um widget que detecta gestos do usuário, como toques.
                    return GestureDetector(
                      // O onTap é uma função que será executada quando o usuário tocar no item da lista.
                      onTap: () {
                        // Navega para a tela de descrição do filme passando o filme atual como argumento.
                        Navigator.push(
                          // O context é usado para navegar entre as telas do aplicativo.
                          context,
                          // MaterialPageRoute é uma rota que cria uma transição de página padrão do Material Design.
                          MaterialPageRoute(
                            // O builder é uma função que constrói a tela de detalhes do filme passando o filme atual como argumento.
                            builder: (context) => DetailsMoviePage(movie: movie),
                          ),
                        );
                      },
                      // Retorna um widget MovieCard, que é um widget personalizado para exibir informações sobre o filme.
                      child: MovieCard(movie: movie),
                    );
                  },
                  itemCount: viewModel.moviesList.length, // Define o número de itens na lista como o tamanho da lista de filmes do viewModel.
                ),
              ],
            );
          }
          // Se o snapshot não tiver dados, exibe um CircularProgressIndicator para indicar que os dados estão sendo carregados.
          return const Center(
            // O CircularProgressIndicator é um widget que exibe um indicador de progresso circular.
            child: CircularProgressIndicator(
              // Define a cor do indicador de progresso como cinza claro.
              color: Color(0xFFEBEBEB),
            ),
          );
        },
      ),
    );
  }
}
