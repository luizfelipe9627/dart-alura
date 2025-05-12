import 'package:http/http.dart';

void main() {
  // Chama a função requestData
  requestData();
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
  });
}