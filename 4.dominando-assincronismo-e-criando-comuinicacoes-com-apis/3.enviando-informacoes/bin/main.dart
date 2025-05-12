import 'package:http/http.dart';
import 'dart:convert';

import 'package:meu_app/api_key.dart';

void main() {
  // Chama a função requestData que faz uma requisição HTTP
  //requestData();
  // Chama a função requestDataAsync que faz uma requisição HTTP utilizando o await
  //requestDataAsync();
  // Chama a função sendDataAsync que faz uma requisição HTTP utilizando o await
  sendDataAsync({
    "id": "NEW001",
    "name": "Flutter",
    "lastName": "Dart",
    "balance": 5000
  });
}

// Função assincrona chamada requestData responsável por fazer uma requisição HTTP, o async faz que a função só retorne quando a requisição for concluída
requestData() {
  // Criado uma endereço de requisição que possui um JSON
  String url = "https://gist.githubusercontent.com/luizfelipe9627/b693e49bbfde7e0fb5558e2ae9bf6a45/raw/d71cf71c32c32669928010fac1d24916b838c725/accounts.json";
  // Criado um objeto Response do tipo Future, que é uma promessa de que a resposta será recebida em algum momento no futuro
  Future<Response> futureResponse = get(Uri.parse(url)); // A função get é assíncrona, por isso o await que faz com que a função aguarde a resposta
  // Imprime a resposta no console
  print(futureResponse);

  // Quando a requisição for concluída, o then é chamado armazenando a resposta em uma variável chamada response
  futureResponse.then((Response response) {
    // Imprime o corpo da requisição
    print(response.body);
    // Converte o corpo da requisição em um objeto JSON e armazena em uma variável chamada listAccounts
    List<dynamic> listAccounts = json.decode(response.body);
    // Armazena o primeiro elemento da lista listAccounts em uma variável chamada firstAccount que satisfaz a condição de que o nome seja igual a 'Carla'
    Map<String , dynamic> mapCarla = listAccounts.firstWhere((element) => element['name'] == 'Carla');
    // Imprime o que foi armazenado na variável mapCarla acessando a propriedade balance que é o saldo
    print(mapCarla["balance"]);
  });

  // O then faz com que a função aguarde a resposta da requisição antes de continuar a execução e imprimir a mensagem no console
  print("Última coisa a acontecer na função");
}

// Função assincrona chamada requestDataAsync responsável por fazer uma requisição HTTP, o async faz que a função só retorne quando a requisição for concluída e retorna uma lista de objetos dinâmicos
Future<List<dynamic>> requestDataAsync() async {
  // Criado uma endereço de requisição que possui um JSON
  String url = "https://gist.githubusercontent.com/luizfelipe9627/b693e49bbfde7e0fb5558e2ae9bf6a45/raw/d71cf71c32c32669928010fac1d24916b838c725/accounts.json";
  // O await faz com que a função aguarde a resposta da requisição antes de continuar a execução, quando a requisição for concluída, o resultado é armazenado em uma variável chamada response
  Response response = await get(Uri.parse(url));
  // Converte o corpo da requisição em um objeto JSON e seleciona o primeiro elemento da lista para imprimir no console
  print(json.decode(response.body)[0]);

  // Como a função é assíncrona, o await faz com que a função aguarde a resposta da requisição antes de continuar a execução e imprimir a mensagem no console
  print("De fato, a última coisa a acontecer na função");

  // Retorna o corpo da requisição convertido em um objeto JSON
  return json.decode(response.body);
}

// Função assincrona chamada sendDataAsync responsável por fazer uma requisição HTTP, o async faz que a função só retorne quando a requisição for concluída, recebe um mapa de contas e retorna uma lista de objetos dinâmicos
sendDataAsync(Map<String, dynamic> mapAccount) async {
  // Chama a função requestDataAsync que faz uma requisição HTTP utilizando o await e armazena o resultado em uma variável chamada listAccounts
  List<dynamic> listAccounts = await requestDataAsync();

  // Adiciona o mapa de contas na lista de contas
  listAccounts.add(mapAccount);

  // Converte a lista de contas em um objeto JSON e armazena em uma variável chamada content
  String content = json.encode(listAccounts);

  // Imprime o conteúdo no console
  print(content);

  // Criado uma endereço de requisição que possui um JSON de um gist do GitHub
  String url = "https://api.github.com/gists/b693e49bbfde7e0fb5558e2ae9bf6a45";

  // Faz uma requisição HTTP do tipo POST para o endereço url, passando o conteúdo como corpo da requisição e armazenando a resposta em uma variável chamada response
  Response response = await post(
      Uri.parse(url), // Faz a conversão da URL em um objeto Uri para ser utilizado na requisição
      // O corpo da requisição é o conteúdo convertido em um objeto JSON encode que recebe o conteúdo
      body: json.encode({
          "description": "account.json", // A descrição do gist
          "public": true, // O gist é público
          // O files armazena os arquivos do gist, onde o nome do arquivo é accounts.json e o conteúdo é o corpo da requisição que contém o JSON
          "files": {
            "accounts.json": {
              "content": content // O conteúdo é o corpo da requisição que contém o JSON
            }
          }
      }),
      // O cabeçalho da requisição é um mapa que contém informações adicionais sobre a requisição
      headers: {
        "Authorization": "Bearer $githubApiKey" // O cabeçalho Authorization é utilizado para autenticar a requisição utilizando o token de acesso pessoal do GitHub
      }
  ); // O await faz com que a função aguarde a resposta da requisição antes de continuar a execução

  // Imprime a resposta do corpo da requisição no console
  print(response.statusCode);
}
