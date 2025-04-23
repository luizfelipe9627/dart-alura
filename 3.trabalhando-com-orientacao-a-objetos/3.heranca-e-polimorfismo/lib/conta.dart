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