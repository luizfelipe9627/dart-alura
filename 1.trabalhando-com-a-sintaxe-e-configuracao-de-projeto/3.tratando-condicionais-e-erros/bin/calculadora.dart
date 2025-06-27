import 'dart:io';

void main() {
  print("Digite o primeiro valor: ");
  // Cria uma variável do tipo double chamada numeroUm que armazena o valor do primeiro número digitado pelo usuário convertido para double
  double numeroUm = double.parse(stdin.readLineSync()!); // O operador ! é usado para indicar que o valor não vai ser nulo

  print("Digite o segundo valor: ");
  // Cria uma variável do tipo double chamada numeroDois que armazena o segundo número digitado pelo usuário convertido para double
  double numeroDois = double.parse(stdin.readLineSync()!); // O operador ! é usado para indicar que o valor não vai ser nulo

  print("Digite a operação desejada: "); // Imprime uma mensagem pedindo para o usuário digitar a operação desejada
  // Cria uma variável do tipo String chamada operacao que armazena a operação desejada pelo usuário
  String operacao = stdin.readLineSync()!; // Lê a operação desejada pelo usuário, garantindo que não seja nula(com o operador !)

  // Criado um método chamado soma que não recebe parâmetros e não retorna nada
  void soma() {
    // Imprime o resultado da soma dos valores digitados pelo usuário
    print(numeroUm + numeroDois);
  }

  // Criado um método chamado subtracao que não recebe parâmetros e não retorna nada
  void subtracao() {
    // Imprime o resultado da subtração dos valores digitados pelo usuário
    print(numeroUm - numeroDois);
  }

  // Criado um método chamado multiplicacao que não recebe parâmetros e não retorna nada
  void multiplicacao() {
    // Imprime o resultado da multiplicação dos valores digitados pelo usuário
    print(numeroUm * numeroDois);
  }

  // Criado um método chamado divisao que não recebe parâmetros e não retorna nada
  void divisao() {
    // Imprime o resultado da divisão dos valores digitados pelo usuário
    print(numeroUm / numeroDois);
  }

  // Verifica qual operação foi escolhida pelo usuário e chama o método correspondente
  if(operacao == "+") {
    soma(); // Chama o método soma responsável por imprimir o resultado da soma dos valores digitados pelo usuário
  } else if(operacao == "-") {
    subtracao(); // Chama o método subtracao responsável por imprimir o resultado da subtração dos valores digitados pelo usuário
  } else if(operacao == "*") {
    multiplicacao(); // Chama o método multiplicacao responsável por imprimir o resultado da multiplicação dos valores digitados pelo usuário
  } else if(operacao == "/") {
    divisao(); // Chama o método divisao responsável por imprimir o resultado da divisão dos valores digitados pelo usuário
  }

  // Verifica qual operação foi escolhida pelo usuário e chama o método correspondente
  switch(operacao) {
    // Caso o usuário tenha digitado a operação de soma executa o método soma
    case "+":
      soma(); // Chama o método soma responsável por imprimir o resultado da soma dos valores digitados pelo usuário
      break; // O break é usado para sair do switch
    // Caso o usuário tenha digitado a operação de subtração executa o método subtracao
    case "-":
      subtracao(); // Chama o método subtracao responsável por imprimir o resultado da subtração dos valores digitados pelo usuário
      break; // O break é usado para sair do switch
    // Caso o usuário tenha digitado a operação de multiplicação executa o método multiplicacao
    case "*":
      multiplicacao(); // Chama o método multiplicacao responsável por imprimir o resultado da multiplicação dos valores digitados pelo usuário
      break; // O break é usado para sair do switch
    // Caso o usuário tenha digitado a operação de divisão executa o método divisao
    case "/":
      divisao(); // Chama o método divisao responsável por imprimir o resultado da divisão dos valores digitados pelo usuário
      break; // O break é usado para sair do switch
  }
}
