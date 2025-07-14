import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';

class Movie {
  // Criado uma variável do tipo inteiro chamada id que armazena o identificador do filme.
  final int id;
  // Criado uma variável do tipo String chamada title que armazena o título do filme.
  final String title;
  // Criado uma variável do tipo String chamada imageUrl que armazena a URL da imagem do filme.
  final String imageUrl;
  // Criado uma variável do tipo String chamada releaseDate que armazena a data de lançamento do filme.
  final String releaseDate;
  // Criado uma variável do tipo String chamada overview que armazena a sinopse do filme.
  final String overview;

  // Construtor da classe Movie que recebe os parâmetros id, title, imageUrl, releaseDate e overview.
  const Movie({
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.releaseDate,
      required this.overview,
  });

  // Método que retorna a URL da imagem do filme com o prefixo da URL da imagem.
  String getPosterImageUrl() {
    // Retorna a URL da imagem do filme com o prefixo da URL da imagem.
    return imageUrlPrefix + imageUrl;
  }

  // Método toMap que converte o objeto Movie em um mapa.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'releaseDate': releaseDate,
      'overview': overview,
    };
  }

  // Método factory que cria uma instância de Movie a partir de um mapa.
  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      // Atribui os valores do mapa às propriedades do objeto Movie.
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['poster_path'] as String,
      releaseDate: map['release_date'] as String,
      overview: map['overview'] as String,
    );
  }

  // Método toJson que converte o objeto Movie em uma string JSON.
  String toJson() => json.encode(toMap());

  // Método factory que cria uma instância de Movie a partir de uma string JSON.
  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}