import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

// Criado uma classe chamada SearchMovies que estende StatelessWidget, que é um widget sem estado.
class SearchMovies extends StatelessWidget {
  // Construtor da classe SearchMovies, que é um widget sem estado.
  const SearchMovies({super.key});

  @override
  // O método build é responsável por construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // Retorna um widget SingleChildScrollView que permite rolar o conteúdo verticalmente.
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
            // Retorna um widget ListTile para cada item da lista.
            return MovieCard();
          },
          itemCount: 10, // Número de itens na lista.
        ),
      ],
    );
  }
}
