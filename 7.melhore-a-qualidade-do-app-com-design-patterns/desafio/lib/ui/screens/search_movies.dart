import 'package:flutter/material.dart';

import '../../app/viewmodels/search_movies_viewmodel.dart';
import '../components/movie_card.dart';
import 'details_movie_page.dart';

// Criada uma classe chamada SearchMovies que estende StatefulWidget, que é um widget com estado ou seja, pode ter dados que mudam ao longo do tempo e precisam ser atualizados na interface do usuário.
class SearchMovies extends StatefulWidget {
  // Construtor da classe SearchMovies, que é um widget sem estado.
  const SearchMovies({super.key});

  @override
  // O método createState cria uma instância do estado associado a este widget.
  State<SearchMovies> createState() => _SearchMoviesState();
}

// Criado uma classe chamada SearchMovies que estende StatelessWidget, que é um widget sem estado.
class _SearchMoviesState extends State<SearchMovies> {
  // Instância do serviço de busca de filmes populares.
  final SearchMoviesViewModel viewModel = SearchMoviesViewModel();

  // Criado um controlador de texto para o campo de pesquisa.
  final TextEditingController textController = TextEditingController();

  @override
  // O método build é responsável por construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // O FutureBuilder é um widget que constrói sua interface com base no estado de um Future.
    return FutureBuilder(
      // O future é usado para especificar o Future que será executado. Neste caso, chama o método getMovie do viewModel passando o texto digitado no controlador de texto.
        future: viewModel.getMovie(textController.text),
        // O builder é uma função que constrói a interface do usuário com base no estado do Future.
        builder: (context, snapshot) {
          // Se o snapshot tiver dados executa o código dentro do if.
          if (snapshot.hasData) {
            // O CustomScrollView é um widget que permite criar uma lista rolável personalizada.
            return CustomScrollView(
              // O SliverList é usado para criar uma lista de itens que podem ser rolados.
              slivers: <Widget>[
                // O SliverToBoxAdapter é usado para adicionar widgets que não são slivers dentro de um CustomScrollView.
                SliverToBoxAdapter(
                  child:
                  // O Image.asset é usado para carregar uma imagem de um arquivo local.
                  Image.asset(
                    'assets/popular.png',
                    // Define a largura da imagem como 80 pixels.
                    width: 80,
                    // Define a altura da imagem como 80 pixels.
                    height: 80,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    // O Text é usado para exibir um texto na tela.
                    child: Text(
                      // Define o texto a ser exibido.
                      'Filmes populares',
                      // Define o alinhamento do texto como centralizado.
                      textAlign: TextAlign.center,
                      // Define o estilo do texto, incluindo tamanho da fonte e peso da fonte.
                      style: TextStyle(
                        // Define o tamanho da fonte do texto.
                          fontSize: 24,
                          // Define o peso da fonte do texto.
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    // Define a margem do container como 40 pixels na parte superior e 32 pixels na parte inferior.
                    padding: const EdgeInsets.only(top: 40, bottom: 32),
                    // O TextField é um campo de texto onde o usuário pode digitar.
                    child: TextField(
                      // Define o controlador de texto para o campo de texto, que é usado para obter o texto digitado pelo usuário.
                      controller: textController,
                      // A ação a ser executada quando o usuário terminar de editar o campo de texto ou seja apertar o botão de enviar no teclado.
                      onEditingComplete: () {
                        // Remove o foco do campo de texto, fechando o teclado.
                        FocusScope.of(context).unfocus();
                        // Atualiza o estado do widget para refletir as mudanças.
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        // Define o rótulo do campo de texto.
                        labelText: 'Pesquisar',
                        // Define o preenchimento do campo de texto.
                        contentPadding: EdgeInsets.all(16),
                        // Define o estilo do campo de texto.
                        border: OutlineInputBorder(
                          // Define o estilo da borda do campo de texto.
                          borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
                // O SliverList.builder é usado para construir uma lista de itens.
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
          } else {
            // Se o snapshot não tiver dados, exibe um CircularProgressIndicator para indicar que os dados estão sendo carregados.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    );
  }
}
