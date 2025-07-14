import 'package:cinetopia/app/api_key.dart';

// Criado uma variável chamada popularMoviesUrl que armazena a URL da API de filmes populares.
const String popularMoviesUrl = 'https://api.themoviedb.org/3/movie/popular?language=pt-BR&page=1';

// Criado uma variável chamada moviePrefixUrl que armazena a URL base para buscar filmes por nome na API do The Movie Database (TMDB).
const String moviePrefixUrl = 'https://api.themoviedb.org/3/search/movie?query=';

// Criado uma variável chamada movieFilterSufix que armazena o sufixo da URL para filtrar os resultados da busca de filmes, incluindo a exclusão de conteúdo adulto e a definição do idioma e página.
const String movieFilterSufix = '&include_adult=false&language=pt-BR&page=1';

// Criado uma variável chamada releaseMoviesUrl que armazena a URL da API dos filmes em lançamento, incluindo o idioma e a página.
const String releaseMoviesUrl = 'https://api.themoviedb.org/3/movie/upcoming?language=pt-BR&page=1';

// Criado um objeto chamado requestHeaders que contém os cabeçalhos necessários para a requisição HTTP, incluindo o tipo de conteúdo aceito e o token de autorização.
const requestHeaders = {
  'accept': 'application/json',
  'Authorization': 'Bearer $apiKey'
};

// Criado uma constante chamada imageUrlPrefix que armazena o prefixo da URL para acessar as imagens dos filmes no TMDB.
const String imageUrlPrefix = 'https://image.tmdb.org/t/p/w500';