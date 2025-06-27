import 'dart:io';

void main() {
  // Criado uma lista de strings chamada notas, que será usada para armazenar as notas do usuário, tendo como valor inicial uma lista vazia.
  List<String> notas = <String>[];
  // Chama a função getComando para capturar a entrada do usuário e armazena o resultado na variável comando
  getComando();
  // Chama a função adicionaNota para adicionar uma nota à lista de notas, passando a lista de notas como argumento
  adicionaNota(notas);
  adicionaNota(notas);
  // Chama a função listarNotas para listar as notas, passando a lista de notas como argumento
  listarNotas(notas);
}

// Função chamada getComando que retorna uma string e é responsável por exibir um menu de opções para o usuário e capturar a escolha do usuário.
String getComando() {
  // Exibe o menu de opções para o usuário
  print("Digite um comando: 1 - Adicionar nota, 2 - Listar notas, 3 - Sair");
  // Cria uma lista de strings com os comandos disponíveis
  List<String> comandos = <String>["1", "2", "3"];
  // Cria uma variável chamada entrada do tipo String? (pode ser nula) e inicializa com uma string vazia
  String? entrada = "";

  // Captura a entrada do usuário e armazena na variável entrada
  entrada = stdin.readLineSync();

  // Se a entrada for nula ou não estiver contida na lista de comandos, executa o bloco condicional
  if(entrada == null || !comandos.contains(entrada)) {
    // Exibe uma mensagem de erro para o usuário
    print("Comando inválido");
    // Chama a função getComando novamente para capturar uma nova entrada do usuário
    getComando();
  }

  return entrada!; // Retorna a entrada do usuário, usando o operador de negação para garantir que não seja nula
}

// Função chamada adicionaNota que retorna uma lista de strings e é responsável por adicionar notas à lista de notas do usuário.
List<String> adicionaNota(List<String> notas) {
  // Exibe uma mensagem solicitando ao usuário que escreva uma nota
  print("Escreva uma nota: ");
  // Cria uma variável chamada nota do tipo String? (pode ser nula) e inicializa com uma string vazia
  String? nota = "";
  // Captura a entrada do usuário e armazena na variável nota
  nota = stdin.readLineSync();

  // Se a nota for nula ou vazia, executa o bloco condicional
  if(nota == null || nota.isEmpty) {
    // Se a nota for nula, exibe uma mensagem de erro
    print("Não é possível adicionar uma nota vazia");
    // Chama a função adicionaNota novamente para capturar uma nova nota do usuário
    adicionaNota(notas);
  } else {
    // Caso contrário, adiciona a nota à lista de notas
    notas.add(nota);
    // Exibe uma mensagem informando que a nota foi adicionada com sucesso
    print("Nota adicionada com sucesso");
  }

  return notas; // Retorna a lista de notas atualizada
}

// Função chamada listaNotas que não retorna nada e é responsável por listar as notas do usuário.
void listarNotas(List<String> notas) {
  // Se a nota for vazia, executa o bloco condicional
  if(notas.isEmpty) {
    print("Não há notas");
  } else {
    // Cria um loop for que percorre a lista de notas
    for(var i = 0; i < notas.length; i++) {
      print(notas[i]); // Exibe a nota na posição i da lista
    }
  }
}