import 'package:meu_app/exceptions/Transaction_exceptions.dart';
import 'package:meu_app/screens/account_screen.dart';
import 'package:meu_app/screens/transition_screen.dart';
import 'package:meu_app/services/transaction_service.dart';



void main() {
  // Instância a classe TransactionService e chama o método makeTransaction, responsável por realizar uma transação entre duas contas.
  // O await é usado para esperar a conclusão da transação antes de continuar a execução do código.
  // TransactionService().makeTransaction(
  //     idSender: "ID001",
  //     idReceiver: "ID002",
  //     amount: 20,
  // ).catchError((e) => {
  //   // Captura a exceção InsufficientFundsException, SenderNotExistsException ou ReceiverNotExistsException e mostra a mensagem do erro no console.
  //   print(e.message),
  // },
  //     // O test é usado para verificar se o erro capturado é do tipo InsufficientFundsException, SenderNotExistsException ou ReceiverNotExistsException.
  //     test: (error) => error is InsufficientFundsException ||
  //         error is SenderNotExistsException ||
  //         error is ReceiverNotExistsException,
  // );

  // Cria uma instância do TransitionScreen, e armazena na variável TransitionScreen.
  TransitionScreen transitionScreen = TransitionScreen();

  // Chama o método initializeStream responsável por iniciar o stream de informações.
  transitionScreen.initializeStream();

  // Acessa a variável accountService da instância accountScreen, e chama o método runChatBot responsável por iniciar o chatbot.
  transitionScreen.runChatBot();
}

// void main() async {
//   // O try-catch é usado para capturar exceções que podem ocorrer durante a execução do código dentro do bloco try.
//   try {
//     // Instância a classe TransactionService e chama o método makeTransaction, responsável por realizar uma transação entre duas contas.
//     // O await é usado para esperar a conclusão da transação antes de continuar a execução do código.
//     await TransactionService().makeTransaction(
//       idSender: "ID001",
//       idReceiver: "ID002",
//       amount: 80000,
//     );
//   } on InsufficientFundsException catch (e) {
//     // Captura a exceção InsufficientFundsException e mostra a mensagem do erro no console.
//     print(e.message);
//     // Mostra no console o nome da conta que causou a exceção, o saldo da conta e o valor da transação com impostos.
//     print("${e.cause.name} possui saldo ${e.cause.balance} e não pode realizar a transação de R\$ ${e.amount} com impostos de R\$ ${e.taxes}.");
//   }

  // Cria uma instância do AccountScreen, e armazena na variável accountScreen.
  // AccountScreen accountScreen = AccountScreen();

  // Acessa a variável accountService da instância accountScreen, e chama o método initializeStream responsável por iniciar o stream de contas.
  // accountScreen.initializeStream();

  // Acessa a variável accountService da instância accountScreen, e chama o método runChatBot responsável por iniciar o chatbot.
  // accountScreen.runChatBot();
// }

// void main() {
//   print("Começou a main");
//   // Chama a função function01
//   function01();
//   print("Terminou a main");
// }
//
// // Criado uma função chamada function01 que não recebe parâmetros e não retorna nada
// void function01() {
//   print("Começou a Função 01");
//   // Chama a função function02
//   function02();
//   print("Terminou a Função 02");
// }
//
// // Criado uma função chamada function02 que não recebe parâmetros e não retorna nada
// void function02() {
//   print("Começou a Função 02");
//   // Faz um loop de 0 a 4
//   for(int i = 0; i < 5; i++) {
//     print("Contando: $i");
//   }
//   print("Terminou a Função 02");
// }
