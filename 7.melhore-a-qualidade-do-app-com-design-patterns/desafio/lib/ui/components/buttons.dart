import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  // Criado uma variável final chamada text que é do tipo String, que é um tipo de dado usado para representar texto.
  final String text;
  // Criado uma variável final chamada icon que é do tipo IconData, que é um tipo de dado usado para representar ícones no Flutter.
  final IconData? icon; // O ícone é opcional, pois pode ser nulo.
  // Criado uma variável final chamada onTap que é do tipo Function, que é um tipo de dado usado para representar uma função ou método que pode ser chamado quando o botão é pressionado.
  final Function onTap;

  const PrimaryButton({super.key, required this.text, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // O widget InkWell é um widget que detecta toques e permite que você execute uma ação quando o usuário toca nele.
    return InkWell(
      onTap: () {
        // Chama a função onTap quando o botão é pressionado.
        onTap();
      },
      // O widget Ink é um widget que permite que você desenhe uma superfície com uma cor de fundo e uma borda.
      child: Ink(
        // Define um padding de 19 pixels na parte superior e inferior, e 26 pixels nas laterais do container.
        padding: EdgeInsets.symmetric(vertical: 19, horizontal: 26),
        decoration: BoxDecoration(
          // Define a cor de fundo do container.
          color: Color(0xFFB370FF),
          // Define a borda do container.
          borderRadius: BorderRadius.circular(50.0),
        ),
        // O widget Row é um widget que organiza seus filhos em uma linha horizontal.
        child: Row(
          // Centra os widgets filhos dentro do Row em relação ao eixo principal (horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          // Define o tamanho do Row como mínimo, ou seja, o Row ocupará apenas o espaço necessário para seus filhos.
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // O widget Text é um widget que exibe um texto na tela.
            Text(
              // O texto a ser exibido no botão, passado como argumento para o construtor.
              text,
              style: TextStyle(
                // Define o tamanho da fonte do texto.
                fontSize: 20,
                // Define a cor do texto.
                color: Color(0xFF1D0E44),
                // Define o peso da fonte do texto.
                fontWeight: FontWeight.w700,
              ),
            ),
            // Se o ícone não for nulo, exibe o ícone, caso contrário, exibe um container vazio.
            icon != null ? Icon(
              // O ícone a ser exibido no botão, passado como argumento para o construtor.
              icon,
              // Define a cor do ícone.
              color: Color(0xFF1D0E44),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
