import 'package:cinetopia/app/api_key.dart';

// Criado uma variável chamada popularMoviesUrl que armazena a URL da API de filmes populares.
const String popularMoviesUrl = 'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';

// Criado um objeto chamado requestHeaders que contém os cabeçalhos necessários para a requisição HTTP, incluindo o tipo de conteúdo aceito e o token de autorização.
const requestHeaders = {
  'accept': 'application/json',
  'Authorization': 'Bearer $apiKey'
};

const String imageUrlPrefix = 'https://image.tmdb.org/t/p/w500';