import 'dart:io';

void main() {
  // Cria uma variável do tipo double chamada numeroUm que armazena o valor do primeiro número digitado pelo usuário convertido para double
  double numeroUm = double.parse(stdin.readLineSync()!); // O operador ! é usado para indicar que o valor não vai ser nulo
  // Cria uma variável do tipo double chamada numeroDois que armazena o segundo número digitado pelo usuário convertido para double
  double numeroDois = double.parse(stdin.readLineSync()!); // O operador ! é usado para indicar que o valor não vai ser nulo

  // Imprime o resultado da soma dos valores digitados pelo usuário
  //print(numeroUm + numeroDois);

  // Criado um método chamado soma que não recebe parâmetros e não retorna nada
  void soma() {
    // Imprime o resultado da soma dos valores digitados pelo usuário
    print(numeroUm + numeroDois);
  }

  soma(); // Chama o método soma responsável por imprimir o resultado da soma dos valores digitados pelo usuário

  // Criado um método chamado subtracao que não recebe parâmetros e não retorna nada
  void subtracao() {
    // Imprime o resultado da subtração dos valores digitados pelo usuário
    print(numeroUm - numeroDois);
  }

  subtracao(); // Chama o método subtracao responsável por imprimir o resultado da subtração dos valores digitados pelo usuário

  // Criado um método chamado multiplicacao que não recebe parâmetros e não retorna nada
  void multiplicacao() {
    // Imprime o resultado da multiplicação dos valores digitados pelo usuário
    print(numeroUm * numeroDois);
  }

  multiplicacao(); // Chama o método multiplicacao responsável por imprimir o resultado da multiplicação dos valores digitados pelo usuário

  // Criado um método chamado divisao que não recebe parâmetros e não retorna nada
  void divisao() {
    // Imprime o resultado da divisão dos valores digitados pelo usuário
    print(numeroUm / numeroDois);
  }

  divisao(); // Chama o método divisao responsável por imprimir o resultado da divisão dos valores digitados pelo usuário
}
