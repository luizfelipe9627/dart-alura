import '../models/account.dart';

// Criado uma classe chamada TransactionExceptions que implementa a classe Exception, e contém três exceções personalizadas para transações bancárias.
class SenderNotExistsException implements Exception {
  String message; // Criado uma variável chamada message do tipo String, que armazena a mensagem de erro personalizada.
  String idSender; // Criado uma variável chamada idSender do tipo String, que armazena o ID do remetente que causou a exceção.

  // Construtor da classe SenderNotExistsException que recebe os parâmetros message e idSender, e inicializa as variáveis correspondentes.
  SenderNotExistsException({
    this.message = "Remetente não existe.",
    required this.idSender,
  });
}

// Criado uma classe chamada ReceiverNotExistsException que implementa a classe Exception, e contém uma exceção personalizada para quando o destinatário não existe.
class ReceiverNotExistsException implements Exception {
  String message; // Criado uma variável chamada message do tipo String, que armazena a mensagem de erro personalizada.
  Account cause; // Criado uma variável chamada cause do tipo Account, que armazena a conta que causou a exceção.
  String idReceiver; // Criado uma variável chamada idReceiver do tipo String, que armazena o ID do destinatário que causou a exceção.

  // Construtor da classe ReceiverNotExistsException que recebe os parâmetros message, cause e idReceiver, e inicializa as variáveis correspondentes.
  ReceiverNotExistsException({
    this.message = "Destinatário não existe.",
    required this.cause,
    required this.idReceiver,
  });
}

// Criado uma classe chamada InsufficientFundsException que implementa a classe Exception, e contém uma exceção personalizada para quando o saldo da conta é insuficiente para realizar uma transação.
class InsufficientFundsException implements Exception {
  String message; // Criado uma variável chamada message do tipo String, que armazena a mensagem de erro personalizada.
  Account cause; // Criado uma variável chamada cause do tipo Account, que armazena a conta que causou a exceção.
  double amount; // Criado uma variável chamada amount do tipo double, que armazena o valor da transação que causou a exceção.
  double taxes; // Criado uma variável chamada taxes do tipo double, que armazena o valor dos impostos que causou a exceção.

  // Construtor da classe InsufficientFundsException que recebe os parâmetros message, cause, amount e taxes, e inicializa as variáveis correspondentes.
  InsufficientFundsException({
    this.message = "Fundo insuficiente para realizar a transação.",
    required this.cause,
    required this.amount,
    required this.taxes,
  });
}
