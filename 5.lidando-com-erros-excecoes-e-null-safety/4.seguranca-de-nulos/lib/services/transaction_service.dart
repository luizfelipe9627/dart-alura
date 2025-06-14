import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:meu_app/models/account.dart';
import 'package:meu_app/services/account_service.dart';

import '../api_key.dart';
import '../helpers/helper_taxes.dart';
import '../models/transaction.dart';

// Criado uma classe chamada TransactionService que contém um método chamado makeTransaction, responsável por realizar uma transação entre duas contas.
class TransactionService {
  // Criado uma instância da classe AccountService para acessar os métodos relacionados às contas.
  final AccountService _accountService = AccountService();

  // Criado um StreamController chamado streamController que armazena uma string responsável por gerenciar o fluxo de dados
  final StreamController<String> _streamController = StreamController<String>();
  // Criado um Stream chamado streamInfos que armazena o fluxo de dados do streamController
  Stream<String> get streamInfos => _streamController.stream;

  // Criado uma endereço de requisição que possui um JSON para armazenar as transações.
  String url = "https://api.github.com/gists/760bed76b741dc38daed35e59245a2c3";

  // Criado um método chamado makeTransaction que recebe os parâmetros idSender, idReceiver e amount, que são obrigatórios, responsável por realizar uma transação entre duas contas.
  makeTransaction({required String idSender, required String idReceiver, required double amount}) async {
    // Obtém todas as contas usando o método getAllAccounts da classe AccountService e armazena em uma lista chamada listAccount.
    List<Account> listAccount = await _accountService.getAll();

    // Verifica se a lista de contas está vazia, se estiver, retorna null.
    if (listAccount.where((acc) => acc.id == idSender).isEmpty) {
      return null;
    }

    // Criado uma variável chamada senderAccount do tipo Account, que armazena a conta do remetente filtrado.
    Account senderAccount = listAccount
        .where((acc) => acc.id == idSender) // Filtra a lista de contas para encontrar a conta do remetente usando o ID fornecido.
        .first; // Obtém a conta do remetente usando o ID fornecido.

    // Verifica se a lista de contas está vazia, se estiver, retorna null.
    if (listAccount.where((acc) => acc.id == idReceiver).isEmpty) {
      return null;
    }

    // Criado uma variável chamada receiverAccount do tipo Account, que armazena a conta do destinatário filtrado.
    Account receiverAccount = listAccount
        .where((acc) => acc.id == idReceiver) // Filtra a lista de contas para encontrar a conta do destinatário usando o ID fornecido.
        .first; // Obtém a conta do destinatário usando o ID fornecido.

    // Calcula os impostos de acordo com o tipo de conta do remetente usando a função calculateTaxesByAccount, que recebe os parâmetros sender e amount, e armazena o valor calculado em uma variável chamada taxes.
    double taxes = calculateTaxesByAccount(
        sender: senderAccount,
        amount: amount
    );

    if (senderAccount.balance < amount + taxes) {
      return null;
    }

    senderAccount.balance -= (amount + taxes);
    receiverAccount.balance += amount;

    // Atualiza as contas na lista de contas, substituindo a conta do remetente e a conta do destinatário com os novos saldos.
    listAccount[listAccount.indexWhere(
          (acc) => acc.id == senderAccount.id, // Encontra o índice da conta do remetente na lista de contas usando o ID do remetente.
    )] = senderAccount; // Substitui a conta do remetente na lista de contas com a nova conta do remetente.

    // Atualiza a conta do destinatário na lista de contas, substituindo a conta do destinatário com o novo saldo.
    listAccount[listAccount.indexWhere(
          (acc) => acc.id == receiverAccount.id, // Encontra o índice da conta do destinatário na lista de contas usando o ID do destinatário.
    )] = receiverAccount;

    Transaction transaction = Transaction(
      id: (Random().nextInt(89999) + 10000).toString(),
      senderAccountId: senderAccount.id,
      receiverAccountId: receiverAccount.id,
      date: DateTime.now(),
      amount: amount,
      taxes: taxes,
    );

    // Salva as contas atualizadas usando o método save da classe AccountService, passando a lista de contas atualizada.
    await _accountService.save(listAccount);
    // Adiciona a transação à lista de transações usando o método addTransaction.
    await addTransaction(transaction);
  }

  Future<List<Transaction>> getAll() async {
    Response response = await get(Uri.parse(url));

    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> listDynamic =
    json.decode(mapResponse["files"]["transactions.json"]["content"]);

    List<Transaction> listTransactions = [];

    for (dynamic dyn in listDynamic) {
      Map<String, dynamic> mapTrans = dyn as Map<String, dynamic>;
      Transaction transaction = Transaction.fromMap(mapTrans);
      listTransactions.add(transaction);
    }

    return listTransactions;
  }

  // Método responsável por adicionar uma nova transação à lista de transações.
  addTransaction(Transaction transaction) async {
    // Obtém todas as transações usando o método getAll e armazena em uma lista de transações.
    List<Transaction> listTransactions = await getAll();
    // Adiciona a nova transação na lista de transações.
    listTransactions.add(transaction);
    // Chama a função save passando a lista de transações.
    save(listTransactions);
  }

  // Método responsável por salvar uma lista de transações no GitHub.
  save(List<Transaction> listTransactions) async {
    // Cria uma lista de objetos vazia do tipo Map chamada listMaps.
    List<Map<String, dynamic>> listMaps = [];

    // Percorre a lista de transações e adiciona cada transação convertida em um mapa na lista de mapas.
    for (Transaction trans in listTransactions) {
      listMaps.add(trans.toMap());
    }

    // Converte a lista de mapas em uma string JSON usando a função json.encode e armazena em uma variável chamada content.
    String content = json.encode(listMaps);

    // Faz uma requisição POST para o GitHub usando a URL definida e passando o conteúdo da lista de transações como corpo da requisição.
    Response response = await post(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $githubApiKey",
      },
      body: json.encode({
        "description": "transactions.json", // A descrição do gist
        "public": true, // O gist é público
        // O files armazena os arquivos do gist, onde o nome do arquivo é transactions.json e o conteúdo é o corpo da requisição que contém o JSON
        "files": {
          "transactions.json": {
            "content": content // O conteúdo é o corpo da requisição que contém o JSON
          }
        }
      }),
    );
  }
}
