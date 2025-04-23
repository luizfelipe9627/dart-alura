void main() {
  //gerenciandoTarefas();
  //listandoFuncionarios();
  contandoProdutosEmUmArmazem();
  //fazendoRecomendacoesEmUmECommerce();
  //verificandoDisponibilidade();
  //controleDePromocoesEmUmaLoja();
  //analisandoVendas();
  //verificandoOPrecoDosProdutos();
  //atualizandoPrecoDeProdutos();
  //encontrandoOsClientesFieis();
}

void gerenciandoTarefas() {
  // A Dev Kanban está desenvolvendo um aplicativo de produtividade onde as pessoas usuárias podem verificar suas tarefas.
  // Este é apenas um exemplo, os valores que a lista possui podem variar.
  List<String> tarefas = ["Estudar", "Comprar mantimentos"];

  // Crie uma função que receba a lista de tarefas e exiba todas as tarefas.
  void exibirTarefas(List<String> tarefas) {
    // Percorra a lista de tarefas e exiba cada tarefa
    for (String tarefa in tarefas) {
      print(tarefa); // Imprime a tarefa atual do loop
    }
  }

  // Chama a função passando a lista de tarefas como argumento
  exibirTarefas(tarefas);
}

void listandoFuncionarios() {
  // Em um sistema administrativo, cada funcionário é representado por um ID (identificador único) em forma de inteiro.  // Este é apenas um exemplo, os valores que a lista possui podem variar.
  // Este é apenas um exemplo, os valores que a lista possui podem variar.
  List<int> idsFuncionarios = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // Crie uma função que receba a lista de IDs dos funcionários e exiba apenas os IDs que são pares.
  void exibirNumerosPares(List<int> idsFuncionarios) {
    // Percorra a lista de ids de funcionar e exiba cada id par
    for(int idFuncionario in idsFuncionarios) {
      // Se o resto do id funcionanro for igual a 0, então é numero par
      if(idFuncionario % 2 == 0) {
        print(idFuncionario); // Imprime o número no console
      }
    }
  }

  // Chama a função exibirNumerosPares passando a lista de ids de funcionarios como parâmetro
  exibirNumerosPares(idsFuncionarios);
}

void contandoProdutosEmUmArmazem() {
  // Uma empresa está gerenciando o inventário de seus produtos e precisa de uma solução para monitorar a quantidade de unidades de certos itens em seu estoque. Para isso, você deve criar uma função que, dado uma lista de produtos, conte quantas vezes o item "maçã" aparece na lista de produtos.
  // Este é apenas um exemplo, os valores que a lista possui podem variar.
  List<String> produtos = ["maçã", "banana", "maçã", "laranja", "maçã"];

  // Cria uma variável que armazena a quantidade de vezes que o item "maçã" aparece na lista
  int quantidade = 0;
  // Crie uma função que receba a lista de produtos e exiba a quantidade de vezes que o item "maçã" aparece na lista.
  void exibirQuantidadeRepetido(List<String> produtos) {
    for(var i = 0; i < produtos.length; i++) {
      // Se o produto for igual a "maçã", incremente o contador
      if(produtos[i] == "maçã") {
        // Incrementa a quantidade de maçãs
        quantidade++;
      }
    }

    print("Quantidade de maçãs: $quantidade"); // Imprime a quantidade de maçãs no console
  }

  // Chama a função passando a lista de produtos como argumento
  exibirQuantidadeRepetido(produtos);
}

void fazendoRecomendacoesEmUmECommerce() {
  // João trabalha em uma plataforma de e-commerce e está implementando uma funcionalidade de recomendação de produtos. Ele possui uma lista de produtos que a pessoa usuária visitou e quer verificar se algum item visitado já foi adicionado ao carrinho.
  // Este é apenas um exemplo, os valores que as listas possuem podem variar.
  List<String> produtosCarrinho = ["arroz", "feijão", "macarrão", "leite", "açúcar"];
  List<String> produtosVisitados = ["arroz", "feijão", "macarrão", "leite", "açúcar"];

  // Crie uma função que receba as listas de produtos visitados e no carrinho, exibindo os itens visitados que ainda não estão no carrinho.
}

void verificandoDisponibilidade() {
  // Em um sistema de reservas, é necessário verificar se um determinado item está disponível em um conjunto de itens disponíveis.
  // Este é apenas um exemplo, os valores que o set possui podem variar.
  Set<int> codigosDisponiveis = {1, 2, 3, 4, 5};

  // Crie uma função que receba um set de itens disponíveis e um código e verifique se ele está presente no set.
}

void controleDePromocoesEmUmaLoja() {
  // Uma loja tem dois sets de promoções. Um contém os identificadores (ID) dos produtos da promoção da semana, enquanto o outro contém os identificadores dos produtos da promoção de fim de mês.
  Set<int> produtosSemana = {1, 2, 3, 4};
  Set<int> produtosMes = {3, 4, 5, 6};

  // Crie uma função que receba os dois sets e exiba todos os IDs que estão em qualquer uma das promoções.
}

void analisandoVendas() {
  // Em uma análise de vendas, dois conjuntos de produtos estão sendo comparados: um conjunto de produtos vendidos e outro de produtos que estavam em estoque.
  Set<String> produtosVendidos = {"maçã", "banana", "laranja"};
  Set<String> produtosEstoque = {"banana", "kiwi", "laranja"};

  // Crie uma função que receba esses conjuntos e exiba os produtos em estoque que ainda não foram vendidos.
}

void verificandoOPrecoDosProdutos() {
  // Em um sistema de vendas, a loja precisa calcular o valor total dos produtos. Crie uma função que receba um mapa de produtos e calcule o valor total dos produtos.
  Map<String, double> precosProdutos = {
    "Camiseta": 30.0,
    "Calça": 50.0,
    "Boné": 15.0,
    "Tênis": 120.0
  };
}

void atualizandoPrecoDeProdutos() {
  // Em um sistema de inventário, é necessário realizar ajustes de preço de determinados produtos. Crie uma função que receba um mapa de produtos, um nome de produto e um novo preço, atualizando o valor e exibindo o inventário atualizado.
  Map<String, double> inventarioProdutos = {
    "Camiseta": 30.0,
    "Calça": 50.0,
    "Boné": 15.0
  };
}

void encontrandoOsClientesFieis() {
  // Uma empresa está desenvolvendo um sistema de CRM. O sistema armazena os clientes e suas respectivas pontuações de fidelidade. Agora, cada cliente é representado por um mapa contendo o nome e a pontuação. Você deve criar uma função que percorra a lista de clientes e exiba os nomes dos clientes com pontuação superior a 7.
  // Lista de mapas, onde cada mapa contém o nome e a pontuação de um cliente.
  List<Map<String, dynamic>> clientes = [
    {"nome": "João", "pontuacao": 6.5},
    {"nome": "Maria", "pontuacao": 8.7},
    {"nome": "Pedro", "pontuacao": 9.2},
    {"nome": "Ana", "pontuacao": 5.4}
  ];

  // Crie uma função que percorra a lista de clientes e exiba os nomes dos clientes com pontuação superior a 7.
}