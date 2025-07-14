import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    // O widget InkWell é um widget que detecta toques e permite que você execute uma ação quando o usuário toca nele.
    return InkWell(
      onTap: () {},
      // O widget Ink é um widget que permite que você desenhe uma superfície com uma cor de fundo e uma borda.
      child: Ink(
        // Define um padding de 19 pixels na parte superior e inferior, e 26 pixels nas laterais do container.
        padding: EdgeInsets.symmetric(vertical: 19, horizontal: 26,),
        decoration: BoxDecoration(
          // Define a cor de fundo do container.
          color: Color(0xFFB370FF),
          // Define a borda do container.
          borderRadius: BorderRadius.circular(50.0),
        ),
        // O widget Row é um widget que organiza seus filhos em uma linha horizontal.
        child: Row(
          children: <Widget>[
            // O widget Text é um widget que exibe um texto na tela.
            Text("Quero começar!"),
            // O widget Icon é um widget que exibe um ícone na tela.
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
