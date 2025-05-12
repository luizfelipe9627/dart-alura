// Criado uma classe Conta para representar uma conta bancária de Matheus, o abstrato é uma classe que não pode ser instanciada, ou seja, não pode ser criada uma nova instância dela, mas pode ser herdada por outras classes
abstract class Conta {
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

// Cria uma classe chamada Imposto que é um mixin, ou seja, uma classe que pode ser usada para adicionar funcionalidades a outras classes
mixin Imposto {
  double taxa = 0.03; // Cria um atributo chamado taxa do tipo double que armazena a taxa de imposto da conta

  // Função responsável por calcular o valor do imposto a ser cobrado
  double valorTaxado(double valor) {
    return valor * taxa; // Retorna o valor do imposto calculado
  }
}

// Cria uma classe ContaEmpresa que herda da classe Conta, ou seja, recebe todos os atributos e métodos da classe Conta, o with Imposto indica que a classe ContaEmpresa também pode usar as funcionalidades da classe Imposto
class ContaEmpresa extends Conta with Imposto {
  // Cria o construtor da classe ContaEmpresa que recebe o nome do titular e o saldo como parâmetros, o this serve para dizer que o atributo titular é o mesmo que o parâmetro titular da classe
  ContaEmpresa(super.titular, super._saldo); // O super é usado para chamar o construtor da classe pai (Conta) e passar os parâmetros para ele

  // Override é usado para sobrescrever o método enviar da classe pai (Conta)
  @override
  // Função responsável por enviar um valor para outra conta
  void enviar(double valor) {
    // Somente subtrai o valor do saldo se o saldo for maior ou igual ao valor a ser enviado, incluindo a taxa de imposto calculada no método valorTaxao do mixin Imposto
    if (_saldo >= valor + valorTaxado(valor)) {
      _saldo -= valor + valorTaxado(valor); // Subtrai o valor enviado do saldo da conta mais a taxa de imposto
      // Imprime o saldo atual da conta após enviar o valor
      imprimeSaldo();
    }
  }

  // Override é usado para sobrescrever o método receber da classe pai (Conta)
  @override
  // Função responsável por receber um valor e adicionar ao saldo da conta, incluindo a taxa de imposto calculada no método valorTaxao do mixin Imposto
  void receber(double valor) {
    _saldo += valor - valorTaxado(valor); // Adiciona o valor recebido ao saldo da conta menos a taxa de imposto
    // Imprime o saldo atual da conta após receber o valor
    imprimeSaldo();
  }
}

// Cria uma classe ContaInvestimento que herda da classe Conta, ou seja, recebe todos os atributos e métodos da classe Conta, o with Imposto indica que a classe ContaInvestimento também pode usar as funcionalidades da classe Imposto
class ContaInvestimento extends Conta with Imposto {
  // Cria o construtor da classe ContaInvestimento que recebe o nome do titular e o saldo como parâmetros, o this serve para dizer que o atributo titular é o mesmo que o parâmetro titular da classe
  ContaInvestimento(super.titular, super._saldo); // O super é usado para chamar o construtor da classe pai (Conta) e passar os parâmetros para ele

  // Override é usado para sobrescrever o método enviar da classe pai (Conta)
  @override
  // Função responsável por enviar um valor para outra conta
  void enviar(double valor) {
    // Somente subtrai o valor do saldo se o saldo for maior ou igual ao valor a ser enviado, incluindo a taxa de imposto calculada no método valorTaxao do mixin Imposto
    if (_saldo >= valor + valorTaxado(valor)) {
      _saldo -= valor + valorTaxado(valor); // Subtrai o valor enviado do saldo da conta mais a taxa de imposto
      // Imprime o saldo atual da conta após enviar o valor
      imprimeSaldo();
    }
  }

  // Override é usado para sobrescrever o método receber da classe pai (Conta)
  @override
  // Função responsável por receber um valor e adicionar ao saldo da conta, incluindo a taxa de imposto calculada no método valorTaxao do mixin Imposto
  void receber(double valor) {
    _saldo += valor - valorTaxado(valor); // Adiciona o valor recebido ao saldo da conta menos a taxa de imposto
    // Imprime o saldo atual da conta após receber o valor
    imprimeSaldo();
  }
}