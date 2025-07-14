import 'dart:convert';

import 'package:cinetopia/app/api_key.dart';
import 'package:cinetopia/app/models/movie.dart';
import 'package:http/http.dart' as http;

class SearchMoviesService {
  // Criado uma variável chamada popularMoviesUrl que armazena a URL da API de filmes populares.
  final String popularMoviesUrl = 'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';

  // Criado uma variável chamada movies que é uma lista de objetos do tipo Movie, inicializada como uma lista vazia.
  List<Movie> movies = <Movie>[];

  // Método chamado searchMovies que retorna uma lista de filmes populares.
  Future<List<Movie>> searchMovies() async {
    // O bloco try irá tentar executar o código dentro dele, e se ocorrer um erro, o bloco catch irá capturar a exceção.
    try {
      // O await é usado para esperar a conclusão da requisição HTTP.
      final response = await http.get(
        // Faz uma requisição GET para a URL de filmes populares.
        Uri.parse(popularMoviesUrl),
        // Passa os headers necessários, incluindo o accept e o Authorization com a chave da API.
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
      );

      // Verifica se a resposta da requisição é bem-sucedida (código 200).
      if (response.statusCode == 200) {
        // Cria um loop que itera sobre cada filme no campo results da resposta JSON e adiciona cada filme à lista de filmes.
        for (dynamic movie in json.decode(response.body)['results']) {
          // Adiciona cada filme à lista de filmes, convertendo o mapa JSON em um objeto Movie usando o método fromMap.
          movies.add(Movie.fromMap(movie));
        }

        for(Movie movie in movies) {
          // Imprime o título de cada filme no console para depuração.
          print(movie.title);
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
