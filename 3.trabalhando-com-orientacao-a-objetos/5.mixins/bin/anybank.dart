import 'package:meu_app/conta.dart';

void main() {
  // Criado uma variável chamada contaChristian do tipo ContaCorrente que armazena uma nova instância da classe ContaCorrente, passando o nome do titular e o saldo como parâmetros
  ContaCorrente contaChristian = ContaCorrente("Christian", 4000);
  // Criado uma variável chamada contaAna do tipo ContaPoupanca que armazena uma nova instância da classe ContaPoupanca, passando o nome do titular e o saldo como parâmetros
  ContaPoupanca contaAna = ContaPoupanca("Ana", 4000);

  // Criado uma variável chamada contaLucas do tipo ContaEmpresa que armazena uma nova instância da classe ContaEmpresa, passando o nome do titular e o saldo como parâmetros
  ContaEmpresa contaLucas = ContaEmpresa("Lucas", 2000);
  // Criado uma variável chamada contaJoao do tipo ContaInvestimento que armazena uma nova instância da classe ContaInvestimento, passando o nome do titular e o saldo como parâmetros
  ContaInvestimento contaJoao = ContaInvestimento("João", 2000);

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

  // Envia 1000 da conta de Christian para a conta de Ana
  contaLucas.enviar(1000);
  contaAna.receber(1000);
}