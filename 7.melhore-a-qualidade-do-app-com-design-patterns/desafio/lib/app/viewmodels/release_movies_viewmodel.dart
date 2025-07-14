import 'package:cinetopia/app/services/search_movies_service.dart';

import '../models/movie.dart';
import '../services/release_movies_service.dart';

class ReleaseMoviesViewModel {
  // Criado uma lista de filmes privada chamada moviesList, que é inicializada como uma lista vazia.
  List<Movie> _moviesList = <Movie>[];

  // Criado um método chamado getReleasesMovie que retorna uma lista dos próximos lançamentos. O async indica que este método é assíncrono e pode conter operações que levam tempo, como chamadas de rede.
  Future<List<Movie>> getReleasesMovie() async {
    // Criado uma variável chamada service que é uma instância do serviço de busca de filmes populares.
    final ReleaseMoviesService service = HttpReleaseMoviesService();

    // Atribui o resultado da chamada ao método getReleasesMovie do serviço à lista de filmes.
    _moviesList = await service.getReleasesMovie(); // O await faz com que o código aguarde a conclusão da chamada assíncrona antes de continuar.

    // Retorna a lista de filmes dos próximos lançamentos.
    return _moviesList;
  }

  // Criado um método chamado getMovie que recebe uma string query como parâmetro e retorna o filme que corresponde à pesquisa. O async indica que este método é assíncrono e pode conter operações que levam tempo, como chamadas de rede.
  Future<List<Movie>> getMovie(String query) async {
    // Se a consulta estiver vazia, execute o código dentro do if.
    if(query.isEmpty) {
      _moviesList = await getReleasesMovie(); // Chama o método getReleasesMovie para obter filmes dos próximos lançamentos.
    } else {
      // Criado uma variável chamada service que é uma instância do serviço de busca de filmes por nome, passando a consulta do usuário.
      final SearchMoviesService service = SearchForMovie(query: query, movies: []);
      // Atribui o resultado da chamada ao método getMovies do serviço à lista de filmes.
      _moviesList = await service.getMovies(); // O await faz com que o código aguarde a conclusão da chamada assíncrona antes de continuar.
    }

    // Retorna a lista de filmes encontrados pela pesquisa.
    return _moviesList;
  }

  // Criado um getter chamado moviesList que retorna a lista de filmes.
  List<Movie> get moviesList => _moviesList;
}