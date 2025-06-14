import 'dart:io';
import 'dart:math';

import 'package:http/http.dart';
import 'package:meu_app/models/account.dart';
import 'package:meu_app/services/transaction_service.dart';

import '../exceptions/Transaction_exceptions.dart';
import '../models/transaction.dart';
import '../services/account_service.dart';

class TransitionScreen {
  // Criado uma variável privada do tipo TransactionService que armazena a instância do serviço de transação.
  final TransactionService _transactionService = TransactionService();

  // Método responsável por inicializar o stream de informações.
  void initializeStream() {
    // Acessa o método streamInfos do AccountService e escuta as atualizações e para caada atulização, imprime o evento no console.
    _transactionService.streamInfos.listen((event) {
      print(event); // Imprime o evento recebido no console.
    });
  }

  // Método responsável por iniciar o chatbot. O async indica que o método pode conter operações assíncronas.
  void runChatBot() async {
    // Imprime uma mensagem de boas-vindas no console.
    print("Bom dia! Eu sou o Lewis, assistente do Banco d'Ouro!");
    print("Que bom te ter aqui com a gente.\n");

    // Criado uma variável booleana chamada isRunning que começa com o valor true.
    bool isRunning = true;

    // Inicia um loop while que continuará enquanto isRunning for true.
    while (isRunning) {
      print("Como eu posso te ajudar? (digite o número desejado)");
      print("1 - Fazer uma transação.");
      print("2 - Sair\n");

      // Lê a entrada do usuário e armazena na variável input.
      String? input = stdin.readLineSync();

      // Verifica se a entrada do usuário é diferente de null ou seja, se o usuário digitou algo.
      if(input != null) {
        // Pega a entrada do usuário e verifica qual opção foi escolhida.
        switch(input) {
          // Se o usuário escolheu a opção 1, executa o código dentro do case 1.
          case "1": {
            print("Digite o ID do remetente:");
            String? idSender = stdin.readLineSync()?.toUpperCase();

            if(idSender == null || idSender.isEmpty) {
              print("ID do remetente não pode ser vazio.");
              continue; // Volta para o início do loop se o ID do remetente for inválido.
            }

            print("Digite o ID do destinatário:");
            String? idReceiver = stdin.readLineSync()?.toUpperCase();

            if(idReceiver == null || idReceiver.isEmpty) {
              print("ID do destinatário não pode ser vazio.");
              continue; // Volta para o início do loop se o ID do destinatário for inválido.
            }

            print("Digite o valor da transação:");

            String? amountInput = stdin.readLineSync();
            double? amount = double.tryParse(amountInput ?? '');

            if(amount == null || amount <= 0) {
              print("Valor da transação não pode ser vazio.");
              continue; // Volta para o início do loop se o valor da transação for inválido.
            }

            await _transactionService.makeTransaction(
              idSender: idSender,
              idReceiver: idReceiver,
              amount: amount,
            ).catchError((e) => {
              // Captura a exceção InsufficientFundsException, SenderNotExistsException ou ReceiverNotExistsException e mostra a mensagem do erro no console.
              print(e.message),
            },
                // O test é usado para verificar se o erro capturado é do tipo InsufficientFundsException, SenderNotExistsException ou ReceiverNotExistsException.
                test: (error) => error is InsufficientFundsException ||
                    error is SenderNotExistsException ||
                    error is ReceiverNotExistsException,
            );

            break;
          }
          // Se o usuário escolheu a opção 3, executa o código dentro do case 3.
          case "2": {
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

  // Método auxiliar para tentar analisar uma entrada de valor monetário.
  attemptParseAmount(String? input) {
    if (input == null || input.isEmpty) {
      return null; // Retorna null se a entrada for vazia.
    }
    try {
      return double.parse(input); // Tenta converter a entrada para double.
    } catch (e) {
      print("Valor inválido. Por favor, insira um número válido.");
      return null; // Retorna null se a conversão falhar.
    }
  }
}