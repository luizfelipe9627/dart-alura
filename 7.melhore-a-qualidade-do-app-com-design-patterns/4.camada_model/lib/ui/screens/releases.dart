import 'package:flutter/cupertino.dart';

// Criado uma classe chamada Releases que estende StatelessWidget, que é um widget sem estado.
class Releases extends StatelessWidget {
  // Construtor da classe Releases, que é um widget sem estado.
  const Releases({super.key});

  @override
  // O método build é responsável por construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    return Center(
      child: Text("Lançamentos"),
    );
  }
}
