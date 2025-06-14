import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../api_key.dart';
import '../models/account.dart';

class AccountService {
  // Criado um StreamController chamado streamController que armazena uma string responsável por gerenciar o fluxo de dados
  final StreamController<String> _streamController = StreamController<String>();
  // Criado um Stream chamado streamInfos que armazena o fluxo de dados do streamController
  Stream<String> get streamInfos => _streamController.stream;

  // Criado uma endereço de requisição que possui um JSON para armazenar as contas.
  String url = "https://api.github.com/gists/b693e49bbfde7e0fb5558e2ae9bf6a45";

  // Função assincrona chamada getAll responsável por fazer uma requisição HTTP, o async faz que a função só retorne quando a requisição for concluída e retorna uma lista de objetos dinâmicos
  Future<List<Account>> getAll() async {
    // O await faz com que a função aguarde a resposta da requisição antes de continuar a execução, quando a requisição for concluída, o resultado é armazenado em uma variável chamada response
    Response response = await get(Uri.parse(url));

    // Chama a função add do streamController que adiciona uma informação no fluxo de dados fazendo com que a função anônima seja chamada
    _streamController.add("${DateTime.now()} | Requisição de leitura.");

    // Converte o corpo da requisição em um objeto JSON e armazena em uma variável chamada mapResponse
    Map<String, dynamic> mapResponse = json.decode(response.body);

    // Converte o corpo da requisição em um objeto JSON e armazena em uma variável chamada listDynamic
    List<dynamic> listDynamic = json.decode(mapResponse["files"]["accounts.json"]["content"]);

    // Cria uma lista de objetos vazia do tipo Account chamada listAccount
    List<Account> listAccount = [];

    // Percorre a lista de objetos dinâmicos e adiciona na lista de contas
    for(dynamic dyn in listDynamic) {
      // Converte o objeto dinâmico em um objeto JSON e armazena em uma variável chamada mapAccount
      Map<String, dynamic> mapAccount = dyn as Map<String, dynamic>;

      // Converte o objeto JSON em um objeto Account e adiciona na lista de contas
      Account account = Account.fromMap(mapAccount);

      // Adiciona o objeto Account na lista de contas
      listAccount.add(account);
    }

    // Retorna a lista de contas
    return listAccount;
  }

  // Função assincrona chamada addAccount responsável por adicionar uma nova conta, recebe um objeto Account como parâmetro
  addAccount(Account account) async {
    // Obtém todas as contas usando o método getAll e armazena em uma lista de contas
    List<Account> listAccounts = await getAll();
    // Adiciona a nova conta na lista de contas
    listAccounts.add(account);
    // Chama a função save passando a lista de contas e o nome da conta como parâmetro
    save(listAccounts, accountName: account.name);
  }

  // Função assincrona chamada save responsável por salvar uma lista de contas no GitHub, recebe uma lista de objetos Account e um nome de conta como parâmetro
  save(List<Account> listAccounts, {String accountName = ""}) async {
    // Criado uma lista de objetos vazia do tipo Map chamada listContent
    List<Map<String, dynamic>> listContent = [];

    for(Account account in listAccounts) {
      // Converte o objeto Account em um objeto JSON e adiciona na lista de contas
      listContent.add(account.toMap());
    }

    // Converte o objeto JSON em uma string e armazena em uma variável chamada content
    String content = json.encode(listContent);

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

    // Se o código de status da resposta for 200, ou seja, se a requisição foi bem sucedida, chama a função add do streamController que adiciona uma informação no fluxo de dados fazendo com que a função anônima seja chamada
    if(response.statusCode.toString()[0] == "2") {
      // Chama a função add do streamController que adiciona uma informação no fluxo de dados fazendo com que a função anônima seja chamada
      _streamController.add("${DateTime.now()} | Requisição de adição bem sucedida ($accountName).");
    } else {
      // Chama a função add do streamController que adiciona uma informação no fluxo de dados fazendo com que a função anônima seja chamada
      _streamController.add("${DateTime.now()} | Requisição falhou ($accountName).");
    }
  }
}