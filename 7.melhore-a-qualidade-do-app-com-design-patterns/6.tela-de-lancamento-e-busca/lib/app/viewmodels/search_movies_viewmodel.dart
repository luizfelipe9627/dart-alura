import 'package:cinetopia/app/services/search_movies_service.dart';

import '../models/movie.dart';

class SearchMoviesViewModel {
  // Criado uma lista de filmes privada chamada moviesList, que é inicializada como uma lista vazia.
  List<Movie> _moviesList = <Movie>[];

  // Criado um método chamado getPopularMovies que retorna uma lista de filmes populares. O async indica que este método é assíncrono e pode conter operações que levam tempo, como chamadas de rede.
  Future<List<Movie>> getPopularMovies() async {
    // Criado uma variável chamada service que é uma instância do serviço de busca de filmes populares.
    final SearchMoviesService service = SearchPopularMoviesService();

    // Atribui o resultado da chamada ao método getMovies do serviço à lista de filmes.
    _moviesList = await service.getMovies(); // O await faz com que o código aguarde a conclusão da chamada assíncrona antes de continuar.

    // Retorna a lista de filmes populares.
    return _moviesList;
  }

  Future<List<Movie>> getMovie(String query) async {
    // Se a consulta estiver vazia, execute o código dentro do if.
    if(query.isEmpty) {
      _moviesList = await getPopularMovies(); // Chama o método getPopularMovies para obter filmes populares.
    } else {
      // Criado uma variável chamada service que é uma instância do serviço de busca de filmes por nome, passando a consulta do usuário.
      final SearchMoviesService service = SearchForMovie(query: query);
      // Atribui o resultado da chamada ao método getMovies do serviço à lista de filmes.
      _moviesList = await service.getMovies(); // O await faz com que o código aguarde a conclusão da chamada assíncrona antes de continuar.
      // Retorna a lista de filmes encontrados pela pesquisa.
    }

    return _moviesList;
  }

  // Criado um getter chamado moviesList que retorna a lista de filmes.
  List<Movie> get moviesList => _moviesList;
}