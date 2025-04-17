import 'dart:io';

void main() {
  // Cria uma variável do tipo double chamada numeroUm que armazena o valor do primeiro número digitado pelo usuário, tendo o valor padrão 0
  double numeroUm = 0;
  // Cria uma variável do tipo double chamada numeroDois que armazena o segundo número digitado pelo usuário, tendo o valor padrão 0
  double numeroDois = 0;
  // Cria uma variável do tipo String chamada operacao que armazena a operação desejada pelo usuário, tendo o valor padrão ""
  String operacao = "";
  // Cria uma lista de strings chamada operacoes que armazena as operações disponíveis
  List<String> operacoes = <String>["+", "-", "*", "/"];

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

  // Printa na tela a mensagem "Digite a operação desejada: "
  print("Digite o primeiro valor: ");

  // Lê o primeiro número digitado pelo usuário e armazena na variável entrada
  String? entrada = stdin.readLineSync();

  // Verifica se a entrada não é nula
  if (entrada != null) {
    // Verifica se a entrada não é uma string vazia
    if (entrada != "") {
      // Converte a entrada do usuário para um número do tipo double e armazena na variável numeroUm
      numeroUm = double.parse(entrada!); // Operador ! é usado para garantir que a variável não seja nula
    }
  }

  void getOperacao() {
    print("Digite a operação desejada ${operacoes.toString()}"); // Imprime uma mensagem pedindo para o usuário digitar a operação desejada, mostrando as operações disponíveis
    entrada = stdin.readLineSync()!; // Lê a operação desejada pelo usuário, garantindo que não seja nula(com o operador !)
    if(entrada != null) {
      // Se operação conter algo que a tenha na lista de operações execute o bloco de código
      if(operacoes.contains(entrada)) {
        // Armazena a operação desejada pelo usuário na variável operacao
        operacao = entrada!; // Operador ! é usado para garantir que a variável não seja nula
      } else {
        print("Operação inválida!"); // Imprime uma mensagem de erro caso a operação não esteja na lista de operações
        getOperacao(); // Chama o método getOperacao novamente para solicitar uma nova operação ao usuário
      }
    }
  }

  // Chama o método getOperacao responsável por ler a operação desejada pelo usuário
  getOperacao();

  // Printa na tela a mensagem "Digite o segundo valor"
  print("Digite o segundo valor: ");

  // Lê o segundo número digitado pelo usuário e armazena na variável entrada
  entrada = stdin.readLineSync();
  // Verifica se a entrada não é nula
  if (entrada != null) {
    // Verifica se a entrada não é uma string vazia
    if (entrada != "") {
      // Converte a entrada do usuário para um número do tipo double e armazena na variável numeroDois
      numeroDois = double.parse(entrada!); // Operador ! é usado para garantir que a variável não seja nula
    }
  }

  print("O resultado da operação é:"); // Imprime o resultado da operação escolhida pelo usuário

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
