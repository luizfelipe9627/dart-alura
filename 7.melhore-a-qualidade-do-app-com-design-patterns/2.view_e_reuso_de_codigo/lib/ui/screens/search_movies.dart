import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Criado uma classe chamada SearchMovies que estende StatelessWidget, que é um widget sem estado.
class SearchMovies extends StatelessWidget {
  // Construtor da classe HomePage, que é um widget sem estado.
  const SearchMovies({super.key});

  @override
  // O método build é responsável por construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // Scaffold é um widget que fornece uma estrutura básica para o layout do aplicativo, incluindo uma barra de navegação, um corpo e um fundo.
    return Scaffold(
      body: Center(child: Text('Tela de pesquisa de filmes',)
      ),
    );
  }
}