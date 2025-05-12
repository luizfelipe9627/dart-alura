import 'package:meu_app/conta.dart';

void main() {
  // Criado uma variável chamada contaMatheus do tipo Conta que armazena uma nova instância da classe Conta, passando o nome do titular e o saldo como parâmetros
  Conta contaMatheus = Conta("Matheus", 1000);
  // Criado uma variável chamada contaRoberta do tipo Conta que armazena uma nova instância da classe Conta, passando o nome do titular e o saldo como parâmetros
  Conta contaRoberta = Conta("Roberta", 2000);

  // Criado uma variável chamada contaChristian do tipo ContaCorrente que armazena uma nova instância da classe ContaCorrente, passando o nome do titular e o saldo como parâmetros
  ContaCorrente contaChristian = ContaCorrente("Christian", 4000);
  // Criado uma variável chamada contaAna do tipo ContaPoupanca que armazena uma nova instância da classe ContaPoupanca, passando o nome do titular e o saldo como parâmetros
  ContaPoupanca contaAna = ContaPoupanca("Ana", 4000);

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

  // Imprime o saldo da conta do Christian
  contaChristian.imprimeSaldo();
  // Acessa o saldo da conta de Christian e adiciona 1000 a ele
  contaChristian.receber(1000);

  // Imprime o saldo da conta do Ana
  contaAna.imprimeSaldo();
  // Acessa o saldo da conta de Ana e subtrai 300 dele
  contaAna.enviar(300);
  // Acessa o saldo da conta de Ana e calcula o rendimento dela
  contaAna.calculaRendimento();
  // Imprime o saldo da conta de Ana após calcular o rendimento
  contaAna.imprimeSaldo();
}