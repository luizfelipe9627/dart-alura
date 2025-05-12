import 'package:http/http.dart';
import 'dart:convert';

void main() {
  // Chama a função requestData que faz uma requisição HTTP
  //requestData();
  // Chama a função requestDataAsync que faz uma requisição HTTP utilizando o await
  requestDataAsync();
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
requestDataAsync() async {
  // Criado uma endereço de requisição que possui um JSON
  String url = "https://gist.githubusercontent.com/luizfelipe9627/b693e49bbfde7e0fb5558e2ae9bf6a45/raw/d71cf71c32c32669928010fac1d24916b838c725/accounts.json";
  // O await faz com que a função aguarde a resposta da requisição antes de continuar a execução, quando a requisição for concluída, o resultado é armazenado em uma variável chamada response
  Response response = await get(Uri.parse(url));
  // Converte o corpo da requisição em um objeto JSON e seleciona o primeiro elemento da lista para imprimir no console
  print(json.decode(response.body)[0]);

  // Como a função é assíncrona, o await faz com que a função aguarde a resposta da requisição antes de continuar a execução e imprimir a mensagem no console
  print("De fato, a última coisa a acontecer na função");
}
