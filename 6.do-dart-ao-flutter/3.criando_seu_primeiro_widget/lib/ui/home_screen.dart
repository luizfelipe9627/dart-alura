import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:flutter_banco_douro/ui/widgets/account_widget.dart';

class HomeScreen extends StatelessWidget {
  // Criado um construtor para o widget HomeScreen que recebe uma chave opcional (super.key).
  const HomeScreen({super.key});

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
      // O body é o corpo da tela, onde o conteúdo principal é exibido.
      body: Padding(
        // O Padding é um widget que adiciona preenchimento ao redor do seu filho de 16 pixels em todos os lados.
        padding: const EdgeInsets.all(16.0),
        // Passa como filho o widget AccountWidget, que é um widget personalizado para exibir informações da conta.
        child: AccountWidget(
          // Cria uma conta com dados fictícios para exibir no widget AccountWidget.
          account: Account(
            id: "ID001",
            name: "Ricardo",
            lastName: "Lima",
            balance: 200,
            accountType: null,
          ),
        ),
      ),
    );
  }
}
