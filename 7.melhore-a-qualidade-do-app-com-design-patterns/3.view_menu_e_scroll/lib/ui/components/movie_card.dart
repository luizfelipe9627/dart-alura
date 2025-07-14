import 'package:flutter/cupertino.dart';

// Criado uma classe chamada MovieCard que estende StatelessWidget, que é um widget sem estado.
class MovieCard extends StatelessWidget {
  // Construtor da classe MovieCard, que é um widget sem estado.
  const MovieCard({super.key});

  @override
  // O método build é responsável por construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      // Retorna um widget Row, que é um widget que organiza seus filhos em uma linha horizontal (da esquerda para a direita).
      child: Row(
        // O children são os widgets filhos do Row, que serão exibidos na linha horizontal.
        children: [
          // O widget Container é um widget que pode ser usado para criar um contêiner com uma cor de fundo, borda e outras propriedades.
          Container(
            // Define a largura e altura do container.
            width: 90,
            // Define a altura do container.
            height: 120,
            // O decoration é uma propriedade que permite definir a decoração do container, como cor de fundo, borda, sombra, etc.
            decoration: BoxDecoration(
              // Define a cor de fundo do container.
              color: Color(0XFF000000),
              // Define uma borda circular para o container, com um raio de 8 pixels.
              borderRadius: BorderRadius.circular(8),
            ),
            // Define a borda do container como
            margin: const EdgeInsets.only(right: 16),
          ),
          // O widget Column é um widget que organiza seus filhos em uma coluna vertical (de cima para baixo).
          Column(
            // O mainAxisSize está configurado como MainAxisSize.min, o que significa que o Row ocupará apenas o espaço necessário para seus filhos e não o espaço máximo disponível por padrão.
            mainAxisSize: MainAxisSize.min,
            // O crossAxisAlignment está configurado como CrossAxisAlignment.start, o que significa que os widgets filhos serão alinhados no início do eixo transversal (vertical).
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              // O widget Padding é um widget que adiciona um espaço em branco ao redor de outro widget.
              Padding(
                // Aplica um padding de 6 pixels na parte inferior do widget Padding.
                padding: const EdgeInsets.only(bottom: 6),
                // O widget Text é um widget que exibe um texto na tela.
                child: Text(
                  // O texto a ser exibido no widget Text, que é o título do filme.
                  "Título do Filme",
                  // Define o estilo do texto, incluindo tamanho da fonte e peso da fonte.
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              // O widget Text é um widget que exibe um texto na tela.
              Text(
                // O texto a ser exibido no widget Text, que é a data de lançamento do filme.
                "Lançamento: 2025-04-04",
                // Define o estilo do texto, incluindo tamanho da fonte e cor.
                style: TextStyle(
                    // Define o peso da fonte do texto.
                    color: Color(0xFFA5A5A5)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
