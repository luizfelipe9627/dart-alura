import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:flutter_banco_douro/ui/widgets/account_widget.dart';
import 'package:flutter_banco_douro/ui/widgets/add_account_modal.dart';

import '../models/account.dart';

// Criado um widget Stateful(widget stateful é um widget que tem estado, ou seja, pode mudar durante a execução do app) chamado HomeScreen.
class HomeScreen extends StatefulWidget {
  // Criado um construtor para o widget HomeScreen que recebe uma chave opcional (super.key).
  const HomeScreen({super.key});

  @override
  // O método createState é chamado para criar o estado do widget HomeScreen.
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variável que armazena o futuro que será usado para buscar todas as contas.
  Future<List<Account>> _futureGetAll = AccountService().getAll();

  // Método para atualizar os dados, que pode ser chamado quando o usuário puxa para baixo na lista.
  Future<void> refreshGetAll() async {
    // O método setState é chamado para notificar o Flutter que o estado do widget mudou, e que a interface do usuário deve ser reconstruída (recarregada).
    setState(() {
      // Atualiza o futuro _futureGetAll chamando o método getAll da classe AccountService para obter todas as contas novamente.
      _futureGetAll = AccountService().getAll();
    });
  }

  // A anotação @override indica que este método sobrescreve um método da classe pai (StatelessWidget).
  @override
  // O método build é chamado para construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // O Scaffold é um widget que fornece uma estrutura básica para a interface do usuário, como barra de aplicativos, corpo e navegação.
    return Scaffold(
      // O AppBar é um widget que exibe uma barra de aplicativos na parte superior da tela.
      appBar: AppBar(
        // O backgroundColor define a cor de fundo da barra de aplicativos.
        backgroundColor: AppColor.lightGrey,
        // Define uma cor opaca para o botão, ou seja terá uma cor sólida.
        // O title é o título exibido na barra de aplicativos.
        title: Text("Sistema de gestão de contas"),
        // Define o texto a ser exibido na barra de aplicativos.
        // O actions são os botões de ação exibidos na barra de aplicativos.
        actions: [
          // O IconButton é um widget que exibe um ícone que pode ser pressionado.
          IconButton(
            onPressed: () {
              // Quando o botão é pressionado, ele navega para a rota "login", substituindo a tela atual.
              Navigator.pushReplacementNamed(context, "login");
            },
            icon: Icon(Icons.logout),
          ),
          // Define o ícone a ser exibido no botão de ação, pegando o ícone de logout do Material Icons.
        ],
      ),
      // O floatingActionButton é um widget que exibe um botão flutuante na tela, geralmente usado para ações principais.
      floatingActionButton: FloatingActionButton(
        // Quando o botão é pressionado, ele executa a função onPressed.
        onPressed: () {
          // Quando o botão é pressionado, ele exibe um modal para adicionar uma nova conta.
          showModalBottomSheet(
            // O isScrollControlled é definido como true para permitir que a altura do modal seja controlado.
            isScrollControlled: true,
            // O contexto é o contexto atual da tela, que é passado para o showModalBottomSheet.
            context: context,
            // O builder é o que constrói o conteúdo do modal.
            builder: (context) {
              // Retorna o widget AddAccountModal que é um widget personalizado para adicionar uma nova conta.
              return AddAccountModal();
            },
          );
        },
        // Define a cor de fundo do botão flutuante como laranja, usando a cor definida na classe AppColor.
        backgroundColor: AppColor.orange,
        // O child é o conteúdo do botão flutuante.
        child: Icon(
            // O ícone é um ícone de adicionar, que é um ícone padrão do Material Icons.
            Icons.add,
            // Define a cor do ícone do botão flutuante.
            color: AppColor.black,
        ),
      ),
      // O body é o corpo da tela, onde o conteúdo principal é exibido.
      body: Padding(
        // O Padding é um widget que adiciona preenchimento ao redor do seu filho de 16 pixels em todos os lados.
        padding: const EdgeInsets.all(16.0),
        // O RefreshIndicator é um widget que exibe um indicador de recarregamento quando o usuário puxa para baixo na lista.
        child: RefreshIndicator(
          // O onRefresh é uma função que é chamada quando o usuário puxa para baixo na lista para recarregar os dados.
          onRefresh: refreshGetAll,
          // Passa como filho o widget FutureBuilder responsável por construir a interface de usuário com base no resultado de uma operação assíncrona.
          child: FutureBuilder(
            // O future é um widget que faz uma chamada assíncrona para obter os dados necessários para construir a interface do usuário.
            future: _futureGetAll,
            // Chama o método getAll da classe AccountService para obter todas as contas.
            // O builder é uma função que recebe o contexto e o snapshot, que contém os dados obtidos pelo future.
            builder: (context, snapshot) {
              // O switch é usado para verificar o estado da conexão do snapshot.
              switch (snapshot.connectionState) {
              // Caso a conexão esteja em estado de nenhuma conexão (none), ou seja, ainda não foi feita a requisição.
                case ConnectionState.none:
                // Exibe um CircularProgressIndicator, que é um indicador de progresso circular, indicando que a requisição está em andamento.
                  return Center(child: CircularProgressIndicator());
              // Caso a conexão esteja aguardando (waiting), ou seja, a requisição está em andamento.
                case ConnectionState.waiting:
                // Exibe um CircularProgressIndicator, que é um indicador de progresso circular, indicando que a requisição está em andamento.
                  return Center(child: CircularProgressIndicator());
              // Caso a conexão esteja ativa (active), ou seja, a requisição foi concluída e os dados estão disponíveis.
                case ConnectionState.active:
                // Exibe um CircularProgressIndicator, que é um indicador de progresso circular, indicando que a requisição está em andamento.
                  return Center(child: CircularProgressIndicator());
              // Caso a conexão esteja concluída (done), ou seja, a requisição foi concluída e os dados estão disponíveis.
                case ConnectionState.done:
                  {
                    // Verifica se o snapshot contém dados e se os dados não estão vazios se estiver executa o bloco de código if.
                    if (snapshot.data == null || snapshot.data!.isEmpty) {
                      return Center(child: Text("Nenhuma conta recebida"));
                    } else {
                      // Criado uma lista de contas chamada listAccounts que recebe os dados do snapshot caso o snapshot não seja nulo.
                      List<Account> listAccounts = snapshot.data!;

                      // Retorna um ListView.builder que é um widget que constrói uma lista de itens de forma preguiçosa, ou seja, apenas os itens visíveis na tela são construídos.
                      return ListView.builder(
                        // O itemCount é o número total de itens na lista, que é o tamanho da lista de contas.
                        itemCount: listAccounts.length,
                        // O itemBuilder é uma função que constrói cada item da lista com base no índice do item.
                        itemBuilder: (context, index) {
                          // A variável account recebe o item da lista de contas no índice atual do loop do ListView.builder.
                          Account account = listAccounts[index];
                          // Retorna um widget AccountWidget que é um widget personalizado para exibir as informações de uma conta.
                          return AccountWidget(account: account);
                        },
                      );
                    }
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
