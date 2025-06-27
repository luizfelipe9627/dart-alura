import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

class AccountWidget extends StatelessWidget {
  final Account
  account; // Criado uma variável chamada account que armazena o objeto Account

  // Criado um construtor para o widget HomeScreen que recebe uma chave opcional (super.key) e um objeto Account como parâmetro.
  const AccountWidget({super.key, required this.account});

  // A anotação @override indica que este método sobrescreve um método da classe pai (StatelessWidget).
  @override
  // O método build é chamado para construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // Retorna um Container que é um widget que pode ser usado para criar uma caixa retangular na tela.
    return Container(
      // Define a altura do Container como 128 pixels.
      height: 128,
      // Adiciona um preenchimento de 16 pixels em todos os lados do Container.
      padding: EdgeInsets.all(16),
      // Adiciona uma margem de 16 pixels na parte inferior do Container, ou seja, adiciona um espaço entre o Container e o widget abaixo dele.
      margin: EdgeInsets.only(bottom: 16),
      // Define uma decoracão para o Container, que é um widget que pode ser usado para criar uma caixa retangular com uma cor de fundo, bordas e sombras.
      decoration: BoxDecoration(
        color: AppColor.lightOrange,
        // Define a cor de fundo do Container como laranja claro.
        borderRadius: BorderRadius.circular(
          12,
        ), // Define um raio de borda de 12 pixels para o Container, arredondando os cantos.
      ),
      // O child é o widget filho do Container, que é um widget que será exibido dentro do Container.
      child: Row(
        // Alinha os widgets filhos do Row horizontalmente.
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinha os widgets filhos do Row com espaço entre eles.
        children: [
          Column(
            // Cria uma coluna para empilhar os widgets filhos verticalmente.
            mainAxisAlignment: MainAxisAlignment.center, // Alinha os widgets filhos do Column verticalmente no centro.
            // Define o crossAxisAlignment como CrossAxisAlignment.start, que alinha os widgets filhos do Column no início do eixo transversal (horizontal).
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cria um widget Text que exibe o nome e sobrenome do responsável pela conta.
              Text("${account.name} ${account.lastName}", style: TextStyle(
                fontSize: 18, // Define o tamanho da fonte como 18 pixels.
                fontWeight: FontWeight.bold, // Define o peso da fonte como negrito.
              ),),
              // Cria um widget Text que exibe o ID da conta (uma substring do ID original, limitando a 5 caracteres).
              Text("ID: ${account.id.substring(0, min(account.id.length, 5))}"),
              // Cria um widget Text que exibe o saldo da conta, formatado com duas casas decimais.
              Text("Saldo: ${account.balance.toStringAsFixed(2)}"),
              // Cria um widget Text que exibe o tipo de conta, se disponível se não exibe "Sem tipo definido".
              Text("Tipo: ${account.accountType ?? "Sem tipo definido"}"),
            ],
          ),
          IconButton(
            onPressed: () {},
            // Adiciona um icone de engrenagem ao botão, que é um widget que exibe um ícone que pode ser pressionado.
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
