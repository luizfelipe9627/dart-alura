import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';
import 'package:cinetopia/app/models/movie.dart';
import 'package:http/http.dart' as http;

// Criada uma interface chamada ReleaseMoviesService que define um contrato para serviços de busca de filmes.
abstract class ReleaseMoviesService {
  // Cria um método chamado getMovies que retorna uma lista de objetos do tipo Movie.
  Future<List<Movie>> getReleasesMovie();
}

// Criada uma classe chamada HttpReleaseMoviesService que implementa a interface ReleaseMoviesService.
class HttpReleaseMoviesService implements ReleaseMoviesService {
  // Cria uma lista de filmes vazia que será usada para armazenar os filmes populares.
  final List<Movie> movies = <Movie>[];

  @override
  // Método chamado getReleasesMovies que retorna uma lista de filmes populares.
  Future<List<Movie>> getReleasesMovie() async {
    // O bloco try irá tentar executar o código dentro dele, e se ocorrer um erro, o bloco catch irá capturar a exceção.
    try {
      // O await é usado para esperar a conclusão da requisição HTTP.
      final response = await http.get(
        // Faz uma requisição GET para a URL de busca de filmes, passando a query do usuário.
        Uri.parse(releaseMoviesUrl),
        // Passa os cabeçalhos da requisição, que incluem o tipo de conteúdo aceito e o token de autorização.
        headers: requestHeaders
      );

      // Verifica se a resposta da requisição é bem-sucedida (código 200).
      if (response.statusCode == 200) {
        // Cria um loop que itera sobre cada filme no campo results da resposta JSON e adiciona cada filme à lista de filmes.
        for (dynamic movie in json.decode(response.body)['results']) {
          // Adiciona cada filme à lista de filmes, convertendo o mapa JSON em um objeto Movie usando o método fromMap.
          movies.add(Movie.fromMap(movie));
        }
      } else {
        // Se a resposta não for bem-sucedida, lança uma exceção com a mensagem de erro.
        throw Exception(response.body);
      }

      // Retorna a lista de filmes populares.
      return movies;
    } catch (e) {
      // Se ocorrer um erro durante a requisição, imprime o erro no console para depuração.
      print(e);
      // Se a requisição falhar, retorna a lista de filmes vazia.
      return movies;
    }
  }
}

class ReleaseForMovie implements ReleaseMoviesService {
  // Criado uma variável chamada movies que é uma lista de objetos do tipo Movie, inicializada como uma lista vazia.
  List<Movie> movies = <Movie>[];

  // Criado uma variável chamada query que armazena o que foi pesquisado pelo usuário.
  final String query;

  // Construtor da classe ReleaseForMovie que recebe uma string de consulta.
  ReleaseForMovie({
    required this.movies,
    required this.query,
  });

  @override
  // Método chamado getReleasesMovies que retorna uma lista de filmes populares.
  Future<List<Movie>> getReleasesMovie() async {
    // O bloco try irá tentar executar o código dentro dele, e se ocorrer um erro, o bloco catch irá capturar a exceção.
    try {
      // O await é usado para esperar a conclusão da requisição HTTP.
      final response = await http.get(
        // Faz uma requisição GET para a URL de busca de filmes, concatenando a URL base com a consulta e o sufixo de filtro.
          Uri.parse(moviePrefixUrl + query + movieFilterSufix),
          headers: requestHeaders
      );

      // Verifica se a resposta da requisição é bem-sucedida (código 200).
      if (response.statusCode == 200) {
        // Cria um loop que itera sobre cada filme no campo results da resposta JSON e adiciona cada filme à lista de filmes.
        for (dynamic movie in json.decode(response.body)['results']) {
          // Adiciona cada filme à lista de filmes, convertendo o mapa JSON em um objeto Movie usando o método fromMap.
          movies.add(Movie.fromMap(movie));
        }
      } else {
        // Se a resposta não for bem-sucedida, lança uma exceção com a mensagem de erro.
        throw Exception(response.body);
      }

      return movies;

    } catch (e) {
      // Se ocorrer um erro durante a requisição, imprime o erro no console para depuração.
      print(e);
      // Se a requisição falhar, retorna a lista de filmes vazia.
      return movies;
      // Em caso de erro, lança uma exceção com a mensagem de erro.
      throw Exception('Erro ao buscar filmes populares: $e');
    }
  }
}
