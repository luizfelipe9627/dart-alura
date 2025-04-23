void main() {
  // Chama a função listas
  listas();

  // Chama a função sets
  sets();

  // Chama a função mapas
  mapas();
}

void enviarEmail(String email) {
  // Imprime o e-mail que foi passado como argumento
  print("Enviando e-mail para $email");
}

void listas() {
  // Cria variáveis do tipo string que armazenam os e-mails
  String luizEmail = "luiz@gmail.com";
  String lauraEmail = "laura@gmail.com";

  // Chama a função enviarEmail passando os e-mails como argumento
  enviarEmail(luizEmail);
  enviarEmail(lauraEmail);

  // Cria uma lista de strings que armazena os e-mails
  List<String> listaEmails = ["luiz@gmail.com", "laura@gmail.com"];

  // Adiciona mais e-mails à lista
  listaEmails.add("enzo@gmail.com");

  // Se a lista não contém o e-mail do Enzo, adiciona-o
  if (listaEmails.contains('enzo@gmail.com') == false) {
    listaEmails.add("enzo@gmail.com"); // Adiciona o e-mail do Enzo à lista
  }

  // // Criado um for que percorre cada e-mail da lista
  for (String email in listaEmails) {
    enviarEmail(
        email); // Chama a função enviarEmail passando o e-mail atual do loop
  }
}

void sets() {
  // Criado um Set de strings que armazena os e-mails
  Set<String> setEmails = {
    "luiz@gmail.com",
    "laura@gmail.com"
  };

  // Adiciona mais e-mails ao Set
  setEmails.add("enzo@gmail.com");

  // Faz um loop que percorre cada e-mail do Set
  for (String email in setEmails) {
    print(email); // Imprime o e-mail atual do loop
  }

  // Se a lista não contém o e-mail do Enzo, adiciona-o
  if (setEmails.contains('enzo@gmail.com') == false) {
    setEmails.add(
        "Email de enzoo dentro do set"); // Adiciona o e-mail do Enzo ao Set
  } else {
    print("Não está dentro do set");
  }
}

void mapas() {
  // Criado um map que vai ter como chave o nome e como valor o e-mail, ou seja duas strings
  Map<String, String> pessoasEmails = {
    'joao': "joao@gmail.com",
    'maria': "maria@gmail.com",
  };

  // Imprime o e-mail vinculado a chave 'joao'
  print(pessoasEmails['joao']);

  // Adiciona um item ao map com a chave enzo e o valor do e-mail
  pessoasEmails['enzo'] = "enzo@gmail.com";

  // Imprime o e-mail vinculado a chave 'enzo'
  print(pessoasEmails['enzo']);

  // Verifica se o map contém a chave 'enzo' e imprime o resultado boleano
  print(pessoasEmails.containsKey('enzo'));

  // Faz um loop que percorre cada valor do map
  for (String email in pessoasEmails.values) {
    enviarEmail(email); // Executa a função enviarEmail passando o e-mail atual do loop
  }

  // Faz um loop que percorre cada chave do map
  for(String nome in pessoasEmails.keys) {
    print(nome); // Imprime o nome atual do loop
  }
}