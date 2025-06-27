import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:uuid/uuid.dart';

// O widget StatefulWidget é um widget que pode ter estado, ou seja, pode mudar durante a execução do app.
class AddAccountModal extends StatefulWidget {
  // Criado um construtor para o widget HomeScreen que recebe uma chave opcional (super.key).
  const AddAccountModal({super.key});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "AMBROSIA";

  // Criado um controlador de texto para o campo de entrada de texto do nome e do último nome.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  // Variável para controlar o estado de carregamento, que pode ser usada para exibir um indicador de carregamento enquanto a conta está sendo adicionada.
  bool isLoading = false;

  // A anotação @override indica que este método sobrescreve um método da classe pai (StatelessWidget).
  @override
  // O método build é chamado para construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // Retorna um Container que é um widget que pode ser usado para criar uma caixa retangular na tela.
    return Container(
      // O MediaQuery.of(context).size.height retorna a altura da tela atual, e multiplicamos por 0.75 para definir a altura do Container como 75% da altura da tela.
      height: MediaQuery.of(context).size.height * 0.75,
      // O width é definido como infinito, o que significa que o Container ocupará toda a largura disponível.
      width: double.infinity,
      // Define um padding especificando todos os lados do Container.
      padding: EdgeInsets.only(
        // Define o padding superior como 32 pixels, o que adiciona um espaço entre o topo do Container e o conteúdo dentro dele.
        top: 32,
        // Define o padding esquerdo como 32 pixels, o que adiciona um espaço entre a esquerda do Container e o conteúdo dentro dele.
        left: 32,
        // Define o padding direito como 32 pixels, o que adiciona um espaço entre a direita do Container e o conteúdo dentro dele.
        right: 32,
        // Define o padding inferior como a altura do teclado mais 32 pixels, o que adiciona um espaço entre a parte inferior do Container e o conteúdo dentro dele, permitindo que o conteúdo seja visível quando o teclado estiver aberto.
        bottom: MediaQuery.of(context).viewInsets.bottom + 32,
      ),
      // O widget SingleChildScrollView é usado para permitir que o conteúdo dentro do Container seja rolável, caso exceda a altura definida por conta do teclado ou outros fatores.
      child: SingleChildScrollView(
        // Define a altura do Container como 75% da altura da tela.
        child: Column(
          // Define o alinhamento vertical dos widgets dentro do Container como start, o que significa que os widgets serão alinhados no início (parte superior) do Container.
          crossAxisAlignment: CrossAxisAlignment.start,
          // Define o alinhamento horizontal dos widgets dentro do Container como stretch, o que significa que os widgets ocuparão toda a largura disponível.
          children: [
            // Renderiza um widget Center, que é um widget que pode ser usado para centralizar o conteúdo dentro dele.
            Center(
              // Renderiza um widget Image, passando como argumento o caminho da imagem e o tamanho da imagem.
              child: Image.asset(
                // Define o caminho da imagem a ser exibida, que é "assets/images/icon_add_account.png".
                "assets/images/icon_add_account.png",
                // Define a altura da imagem como 64 pixels, o que significa que a imagem será redimensionada para ter essa altura.
                width: 64,
              ),
            ),

            // Renderiza um widget SizedBox, que é um widget que pode ser usado para adicionar espaço entre os widgets.
            const SizedBox(
              // Define a altura do SizedBox como 16 pixels, o que adiciona um espaço entre os widgets.
              height: 32,
            ),

            // Renderiza um widget Text, passando como argumento o texto a ser exibido.
            Text(
              // Define o texto a ser exibido no widget Text, que é "Adicionar nova conta".
              "Adicionar nova conta",
              // Define o estilo do texto, como peso da fonte e tamanho da fonte.
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
            ),
            Text(
              // Define o texto a ser exibido no widget Text, que é "Preencha os dados abaixo".
              "Preencha os dados abaixo",
              // Define o estilo do texto, como peso da fonte e tamanho da fonte.
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),

            // Renderiza um widget TextFormField, que é um campo de entrada de texto.
            TextFormField(
              // O controller é usado para controlar o texto do campo de entrada de texto.
              controller: _nameController,
              // Define o rótulo do campo de entrada de texto como "Nome da conta".
              decoration: InputDecoration(labelText: "Nome"),
            ),
            // O widget TextFormField é um widget que permite ao usuário inserir texto, como um campo de entrada de texto.
            TextFormField(
              // O controller é usado para controlar o texto do campo de entrada de texto.
              controller: _lastNameController,
              // Define o rótulo do campo de entrada de texto como "Último nome".
              decoration: InputDecoration(labelText: "Último nome"),
            ),

            // Renderiza um widget SizedBox, que é um widget que pode ser usado para adicionar espaço entre os widgets.
            const SizedBox(
              // Define a altura do SizedBox como 16 pixels, o que adiciona um espaço entre os widgets.
              height: 16,
            ),
            Text("Tipo da conta"),

            // Cria uma lista de itens para o DropdownButtonFormField, que é um widget que permite ao usuário selecionar um item de uma lista suspensa.
            DropdownButtonFormField<String>(
              // O isExpanded é um widget que pode ser usado para expandir o widget filho para ocupar todo o espaço disponível.
              isExpanded: true,
              // O value é o valor que vai aparecer por padrão.
              value: _accountType,
              // O items é uma lista de DropdownMenuItem, que são os itens que serão exibidos na lista suspensa.
              items: [
                // Cria uma lista de DropdownMenuItem, que é um item da lista suspensa.
                DropdownMenuItem(
                  // Define o valor do item como "AMBROSIA".
                  value: "AMBROSIA",
                  // Define o texto do item como "Ambrosia".
                  child: Text("Ambrosia"),
                ),
                DropdownMenuItem(
                  // Define o valor do item como "CANJICA".
                  value: "CANJICA",
                  // Define o texto do item como "Canjica".
                  child: Text("Canjica"),
                ),
                DropdownMenuItem(
                  // Define o valor do item como "PUDIM".
                  value: "PUDIM",
                  // Define o texto do item como "Pudim".
                  child: Text("Pudim"),
                ),
                DropdownMenuItem(
                  // Define o valor do item como "BRIGADEIRO".
                  value: "BRIGADEIRO",
                  // Define o texto do item como "Tapioca".
                  child: Text("Brigadeiro"),
                ),
              ],
              // O onChanged é uma função que é chamada quando o usuário escolhe um item da lista suspensa.
              onChanged: (value) {
                // Se o valor selecionado não for nulo, atualiza o estado do widget com o novo valor selecionado.
                if (value != null) {
                  // Define o valor selecionado quando o usuário escolhe um item da lista suspensa.
                  setState(() {
                    _accountType = value;
                  });
                }
              },
            ),

            const SizedBox(
              // Define a altura do SizedBox como 16 pixels, o que adiciona um espaço entre os widgets.
              height: 32,
            ),

            // Renderiza um widget Row, que é um widget que pode ser usado para organizar os widgets em uma linha horizontal.
            Row(
              children: [
                // O widget Expanded é um widget que pode ser usado para expandir o widget filho para ocupar todo o espaço disponível.
                Expanded(
                  // Renderiza um widget ElevatedButton, que é um botão elevado que pode ser pressionado.
                  child: ElevatedButton(
                    // Define a ação a ser executada quando o botão é pressionado, se o estado de carregamento for verdadeiro, o botão será desativado, caso contrário, o botão estará ativo.
                    onPressed:
                        (isLoading)
                            ? null
                            : () {
                              // Ao pressionar o botão "Cancelar", chama o método onButtonCancelClicked.
                              onButtonCancelClicked();
                            },
                    // O child é o conteúdo do botão.
                    child: Text(
                      // Define o texto do botão como "Cancelar".
                      "Cancelar",
                      style: TextStyle(
                        // Define a cor do texto do botão como preto, usando a cor definida na classe AppColor.
                        color: AppColor.black,
                      ),
                    ),
                  ),
                ),
                // Renderiza um widget SizedBox, que é um widget que pode ser usado para adicionar espaço entre os widgets.
                SizedBox(width: 16),
                // O widget Expanded é um widget que pode ser usado para expandir o widget filho para ocupar todo o espaço disponível.
                Expanded(
                  child: ElevatedButton(
                    // O style é usado para definir o estilo do botão, como cor de fundo, forma, etc.
                    style: ButtonStyle(
                      // Define a cor de fundo do botão como laranja, usando a cor definida na classe AppColor.
                      backgroundColor: WidgetStatePropertyAll(AppColor.orange),
                    ),
                    // Define a ação a ser executada quando o botão é pressionado.
                    onPressed: () {
                      // Ao pressionar o botão "Adicionar", chama o método onButtonSendClicked.
                      onButtonSendClicked();
                    },
                    // O child é o conteúdo do botão, que se o estado de carregamento for verdadeiro, exibe um CircularProgressIndicator, caso contrário, exibe o texto "Adicionar".
                    child:
                        (isLoading)
                            ?
                            // O sizedBox é usado para definir o espaço ocupado pelo CircularProgressIndicator.
                            const SizedBox(
                              // Define o tamanho do CircularProgressIndicator como 16 pixels de largura e altura.
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                            : Text(
                              // Define o texto do botão como "Adicionar".
                              "Adicionar",
                              style: TextStyle(
                                // Define a cor do texto do botão como preto, usando a cor definida na classe AppColor.
                                color: AppColor.black,
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Método que é chamado quando o botão "Cancelar" é pressionado.
  onButtonCancelClicked() {
    // Se o estado de carregamento for falso, ou seja, não estiver carregando, fecha o modal.
    if (!isLoading) {
      // Fecha o modal quando o botão é pressionado.
      closeModal();
    }
  }

  // Método que é chamado quando o botão "Adicionar" é pressionado. O async indica que este método pode conter operações assíncronas, como chamadas de rede ou operações de banco de dados.
  onButtonSendClicked() async {
    // Se o estado de carregamento for falso, ou seja, não estiver carregando, adiciona a conta.
    if (!isLoading) {
      // O método setState é usado para atualizar o estado do widget, o que faz com que o widget seja reconstruído com as novas informações.
      setState(() {
        // Define o estado de carregamento como verdadeiro, o que pode ser usado para exibir um indicador de carregamento enquanto a conta está sendo adicionada.
        isLoading = true;
      });
      // Obtém o nome do controlador de texto _nameController.
      String name = _nameController.text;
      // Obtém o último nome do controlador de texto _lastNameController.
      String lastName = _lastNameController.text;

      Account account = Account(
        // Cria um id com o pacote uuid, que gera um identificador único universal (UUID) baseado no tempo.
        id: Uuid().v1(),
        // Passa o nome obtido do controlador de texto _nameController.
        name: name,
        // Passa o último nome obtido do controlador de texto _lastNameController.
        lastName: lastName,
        // Define o saldo inicial como 0, pois é uma nova conta.
        balance: 0,
        // Passa o tipo de conta selecionado pelo usuário.
        accountType: _accountType,
      );

      // Adiciona a nova conta usando o AccountService responsável por fazer a requisição para adicionar a conta.
      await AccountService().addAccount(
        account,
      ); // O await faz com que o código aguarde a conclusão da operação assíncrona antes de continuar.

      // Fecha o modal quando a conta é adicionada com sucesso.
      closeModal();
    }
  }

  // Método que é chamado para fechar o modal.
  closeModal() {
    // Fecha o modal quando o usuário pressiona fora do modal.
    Navigator.pop(context);
  }
}
