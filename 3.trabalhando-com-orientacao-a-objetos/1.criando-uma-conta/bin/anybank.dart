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
    // Imprime os dados titular e saldo de cada conta
    print(conta.titular);
    print(conta.saldo);
  }

  // Atribui um novo valor ao saldo da conta da Roberta
  contaRoberta.saldo = 5000;

  // Imprime o saldo da conta de Roberta após a atribuição do novo valor
  print(contaRoberta.saldo);
}

// Criado uma classe Conta para representar uma conta bancária de Matheus
class Conta {
  // Cria um atributo chamado titular do tipo String que armazena o nome do titular da conta
  String titular;
  // Cria um atributo chamado saldo do tipo double que armazena o saldo da conta
  double saldo;

  // Construtor da classe Conta que recebe o nome do titular e o saldo como parâmetros, o this serve para dizer que o atributo titular é o mesmo que o parâmetro titular da classe
  Conta(this.titular, this.saldo);
}