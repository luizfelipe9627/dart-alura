// Criado uma classe Conta para representar uma conta bancária de Matheus
class Conta {
  // Cria um atributo chamado titular do tipo String que armazena o nome do titular da conta
  String titular;
  // Cria um atributo chamado saldo do tipo double que armazena o saldo da conta
  double _saldo; // O underscore(_) antes do nome do atributo indica que ele é privado e não pode ser acessado fora da classe

  // Construtor da classe Conta que recebe o nome do titular e o saldo como parâmetros, o this serve para dizer que o atributo titular é o mesmo que o parâmetro titular da classe
  Conta(this.titular, this._saldo);

  // Função responsável por receber um valor e adicionar ao saldo da conta
  void receber(double valor) {
    // Adiciona o valor recebido ao saldo da conta
    _saldo += valor;
    // Imprime o saldo atual da conta após receber o valor
    imprimeSaldo();
  }

  // Função responsável por enviar um valor para outra conta
  void enviar(double valor) {
    // Somente subtrai o valor do saldo se o saldo for maior ou igual ao valor a ser enviado
    if (_saldo >= valor) {
      _saldo -= valor; // Subtrai o valor enviado do saldo da conta
      // Imprime o saldo atual da conta após enviar o valor
      imprimeSaldo();
    }
  }

  // Função responsável por imprimir o saldo da conta
  void imprimeSaldo() {
    print("O saldo atual de $titular é: R\$$_saldo"); // Imprime o saldo atual da conta
  }
}

// Cria uma classe ContaCorrente que herda da classe Conta, ou seja, recebe todos os atributos e métodos da classe Conta
class ContaCorrente extends Conta {
  double emprestimo = 300; // Cria um atributo chamado emprestimo do tipo double que armazena o valor do empréstimo da conta

  // Criado o construtor da classe ContaCorrente que recebe o nome do titular e o saldo como parâmetros, o this serve para dizer que o atributo titular é o mesmo que o parâmetro titular da classe
  ContaCorrente(super.titular, super._saldo); // O super é usado para chamar o construtor da classe pai (Conta) e passar os parâmetros para ele

  // Override é usado para sobrescrever o método enviar da classe pai (Conta)
  @override
  // Função responsável por enviar um valor para outra conta
  void enviar(double valor) {
    // Somente subtrai o valor do saldo se o saldo for maior ou igual ao valor a ser enviado
    if (_saldo + emprestimo >= valor) {
      _saldo -= valor; // Subtrai o valor enviado do saldo da conta
      // Imprime o saldo atual da conta após enviar o valor
      imprimeSaldo();
    }
  }
}

// Cria uma classe ContaPoupanca que herda da classe Conta, ou seja, recebe todos os atributos e métodos da classe Conta
class ContaPoupanca extends Conta {
  // Cria um atributo chamado rendimento do tipo double que armazena o rendimento da conta
  double rendimento = 0.05;

  // Criado o construtor da classe ContaPoupanca que recebe o nome do titular e o saldo como parâmetros, o this serve para dizer que o atributo titular é o mesmo que o parâmetro titular da classe
  ContaPoupanca(super.titular, super._saldo); // O super é usado para chamar o construtor da classe pai (Conta) e passar os parâmetros para ele

  // Função responsável por calcular o rendimento da conta
  void calculaRendimento() {
    _saldo += _saldo * rendimento; // Adiciona o rendimento ao saldo da conta
  }
}