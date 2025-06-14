import 'dart:io';

import 'package:http/http.dart';
import 'package:meu_app/models/account.dart';

import '../services/account_service.dart';

class AccountScreen {
  // Criado uma variável privada do tipo AccountService que armazena a instância do serviço de conta.
  final AccountService _accountService = AccountService();

  // Método responsável por inicializar o stream de informações.
  void initializeStream() {
    // Acessa o método streamInfos do AccountService e escuta as atualizações e para caada atulização, imprime o evento no console.
    _accountService.streamInfos.listen((event) {
      print(event); // Imprime o evento recebido no console.
    });
  }

  // Método responsável por iniciar o chatbot. O async indica que o método pode conter operações assíncronas.
  Future<void> runChatBot() async {
    // Imprime uma mensagem de boas-vindas no console.
    print("Bom dia! Eu sou o Lewis, assistente do Banco d'Ouro!");
    print("Que bom te ter aqui com a gente.\n");

    // Criado uma variável booleana chamada isRunning que começa com o valor true.
    bool isRunning = true;

    // Inicia um loop while que continuará enquanto isRunning for true.
    while (isRunning) {
      print("Como eu posso te ajudar? (digite o número desejado)");
      print("1 - Ver todas sua contas.");
      print("2 - Adicionar nova conta.");
      print("3 - Sair\n");

      // Lê a entrada do usuário e armazena na variável input.
      String? input = stdin.readLineSync();

      // Verifica se a entrada do usuário é diferente de null ou seja, se o usuário digitou algo.
      if(input != null) {
        // Pega a entrada do usuário e verifica qual opção foi escolhida.
        switch(input) {
          // Se o usuário escolheu a opção 1, executa o código dentro do case 1.
          case "1": {
            // Chama o método _getAllAccounts para obter todas as contas.
            await _getAllAccounts(); // O await indica que o código deve esperar a conclusão da operação assíncrona antes de continuar.
            break;
          }
          // Se o usuário escolheu a opção 2, executa o código dentro do case 2.
          case "2": {
            // Chama o método _addExampleAccount para adicionar uma nova conta.
            await _addExampleAccount(); // O await indica que o código deve esperar a conclusão da operação assíncrona antes de continuar.
            break;
          }
          // Se o usuário escolheu a opção 3, executa o código dentro do case 3.
          case "3": {
            // Altera o valor de isRunning para false, encerrando o loop.
            isRunning = false;
            // Imprime uma mensagem de despedida no console.
            print("Até logo! Espero te ver novamente.");
            break;
          }
          // Se o usuário escolheu qualquer outra opção, executa o código dentro do default.
          default: {
            print("Opção inválida. Tente novamente.");
            break;
          }
        }
      }
    }
  }

  // Método responsável por adicionar uma nova conta. O async indica que o método pode conter operações assíncronas.
  _getAllAccounts() async {
    // O bloque try e on Exception é utilizado para capturar exceções que podem ocorrer durante a execução do código, sempre que o código dentro do try não gere uma exceção, o código dentro do on Exception não será executado.
    try {
      // Chama o método getAllAccounts do AccountService e armazena o resultado na lista de contas chamada accounts.
      List<Account> listAccounts = await _accountService.getAll(); // O await indica que o código deve esperar a conclusão da operação assíncrona antes de continuar.
      // Imprime a lista de contas no console.
      print(listAccounts);
    }
    // O catch é utilizado para capturar exceções, ou seja, erros que podem ocorrer durante a execução do código.
    on ClientException catch (error) {
      print("Não foi possível conectar ao servidor.");
      print("Tente novamente mais tarde.");
      // Imprime a mensagem de erro e a URI do erro no console.
      print(error.message);
      print(error.uri);
    } on Exception {
      print("Não consegui recuperar os dados da conta.");
      print("Tente novamente mais tarde.");
    } // O bloco finally é executado independentemente de uma exceção ter sido lançada ou não.
    finally {
      print(("${DateTime.now()} | Ocorreu uma tentativa de consulta."));
    }
  }

  // Método responsável por adicionar uma nova conta. O async indica que o método pode conter operações assíncronas.
  _addExampleAccount() async {
    try {
      // Cria uma nova conta com os dados fornecidos.
      Account account = Account(
        id: "ID555",
        name: "Haley",
        lastName: "Smith",
        balance: 8000.0,
      );

      // Chama o método addAccount do AccountService para adicionar a nova conta.
      await _accountService.addAccount(account);
      print("Conta adicionada com sucesso!");
    } catch (e) {
      // Se ocorrer um erro, imprime uma mensagem de erro no console.
      print("Ocorreu um problema ao adicionar a conta.");
    }
  }
}