import 'package:meu_app/conta.dart';

void main() {
  // Criado uma variável chamada contaMatheus do tipo Conta que armazena uma nova instância da classe Conta, passando o nome do titular e o saldo como parâmetros
  Conta contaMatheus = Conta("Matheus", 1000);
  // Criado uma variável chamada contaRoberta do tipo Conta que armazena uma nova instância da classe Conta, passando o nome do titular e o saldo como parâmetros
  Conta contaRoberta = Conta("Roberta", 2000);

  // Criado uma variável chamada contas do tipo List<Conta> que armazena uma lista de contas, contendo as contas de Matheus e Roberta
  List<Conta> contas = [
    contaMatheus,
    contaRoberta,
  ];

  // Cria um loop for que itera sobre cada conta na lista de contas
  for(Conta conta in contas) {
    // Imprime o saldo da conta atual
    conta.imprimeSaldo();
  }

  // Acessa o saldo da conta de Roberta e adiciona 5000 a ele
  contaRoberta.receber(5000);
  // Acessa o saldo da conta de Matheus e adiciona 1000 a ele
  contaMatheus.receber(1000);
  // Acessa o saldo da conta de Matheus e subtrai 500 dele
  contaMatheus.enviar(500);
}