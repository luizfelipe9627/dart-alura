import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

// Criado um widget Stateless chamado LoginScreen, responsável por renderizar a tela de login do aplicativo.
class LoginScreen extends StatelessWidget {
  // Criado um construtor para o widget LoginScreen que recebe uma chave opcional (super.key).
  const LoginScreen({super.key});

  // A anotação @override indica que este método sobrescreve um método da classe pai (StatelessWidget).
  @override
  // O método build é chamado para construir a interface do usuário do widget.
  Widget build(BuildContext context) {
    // O Scaffold é um widget que fornece uma estrutura básica para a interface do usuário, como barra de aplicativos, corpo e navegação.
    return Scaffold(
      // O stack é um widget que permite empilhar widgets uns sobre os outros, permitindo que os widgets sejam posicionados em camadas.
      body: Stack(
        children: [
          // Renderiza um widget Image, passando como argumento o caminho da imagem e o tamanho da imagem.
          Image.asset(
            "assets/images/banner.png", // Caminho da imagem a ser exibida.
          ),
          // O Align é um widget que alinha seu filho dentro de si mesmo, nesse caso, alinha a imagem no canto inferior direito da tela.
          Align(
            // Define o alinhamento do filho dentro do Align, nesse caso, alinha a imagem no canto inferior esquerdo da tela.
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              "assets/images/stars.png", // Caminho da imagem a ser exibida.
            ),
          ),
          Padding(
            // O Padding é um widget que adiciona espaçamento ao redor de seu filho, nesse caso, adiciona 32px de preenchimento em todas as direções.
            padding: const EdgeInsets.all(32),
            child: Column(
              // Define o alinhamento principal dos widgets dentro da coluna, nesse caso para o centro.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Renderiza um widget SizedBox, que é um widget que cria um espaço vazio com uma altura de 32 pixels.
                const SizedBox(
                  height: 64, // Define a altura do SizedBox como 128 pixels.
                ),
                // Renderiza um widget Image, passando como argumento o caminho da imagem e o tamanho da imagem.
                Image.asset(
                  "assets/images/logo.png",
                  // Caminho da imagem a ser exibida.
                  width: 120, // Define a largura da imagem como 120 pixels.
                ),
                // Cria uma nova coluna.
                Column(
                  // Define o alinhamento horizontal dos widgets dentro da coluna, nesse caso, estica os widgets para ocupar toda a largura disponível.
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // O children é uma lista de widgets que serão renderizados dentro da coluna.
                  children: [
                    // Renderiza um widget SizedBox, que é um widget que cria um espaço vazio com uma altura de 16 pixels.
                    const SizedBox(
                      height: 32, // Define a altura do SizedBox como 16 pixels.
                    ),
                    // Renderiza um widget Text com o texto "Sistema de Gestão de Contas".
                    const Text(
                      "Sistema de gestão de contas",
                      // Define o texto a ser exibido.
                      textAlign: TextAlign.center,
                      // Alinha o texto ao centro do widget Text.
                      style: TextStyle(
                        // O style aplica um estilo ao texto e o TextStyle() é um construtor de estilo de texto vazio, que usa o estilo padrão do aplicativo.
                        fontSize:
                            32, // Define o tamanho da fonte do texto como 32 pixels.
                      ),
                    ),
                    // Renderiza um widget SizedBox, que é um widget que cria um espaço vazio com uma altura de 16 pixels.
                    const SizedBox(
                      height: 32, // Define a altura do SizedBox como 16 pixels.
                    ),
                    // Renderiza um widget TextFormField, que é um campo/input de entrada de texto para o usuário digitar.
                    TextFormField(
                      // O decoration é um widget que adiciona decoração ao campo de entrada, como rótulo, ícone, borda, etc.
                      decoration: InputDecoration(
                        label: Text(
                          "E-mail", // Define o rótulo do campo de entrada como "Usuário".
                        ),
                      ),
                    ),
                    // Renderiza um widget SizedBox, que é um widget que cria um espaço vazio com uma altura de 16 pixels.
                    const SizedBox(
                      height: 16, // Define a altura do SizedBox como 16 pixels.
                    ),
                    TextFormField(
                      // Define se o texto digitado deve ser oculto, útil para senhas.
                      obscureText: true,
                      // O decoration é um widget que adiciona decoração ao campo de entrada, como rótulo, ícone, borda, etc.
                      decoration: InputDecoration(
                        label: Text(
                          "Senha", // Define o rótulo do campo de entrada como "Usuário".
                        ),
                      ),
                    ),
                    // Renderiza um widget SizedBox, que é um widget que cria um espaço vazio com uma altura de 32 pixels.
                    const SizedBox(
                      height: 32, // Define a altura do SizedBox como 16 pixels.
                    ),
                    // Renderiza um widget ElevatedButton, que é um botão elevado que pode ser pressionado pelo usuário.
                    ElevatedButton(
                      // Define a ação a ser executada quando o botão for pressionado.
                      onPressed: () {
                        // Navega para a rota "home" quando o botão for pressionado.
                        Navigator.pushReplacementNamed(context, "home"); // O pushReplacementNamed substitui a rota atual pela rota especificada, nesse caso pegando o contexto/tela atual e substituindo pela rota "home".
                      },
                      // Define o estilo do botão.
                      style: ButtonStyle(
                        // Define a cor de fundo do botão como uma cor já definida no Material Design, nesse caso, azul.
                        backgroundColor: WidgetStatePropertyAll(
                          // O WidgetStatePropertyAll é usado para definir a cor de fundo do botão em todos os estados.
                          AppColor.orange // Define uma cor opaca para o botão, ou seja terá uma cor sólida.
                        ),
                      ),
                      // Define o filho do botão ou seja o que será exibido dentro do botão.
                      child: const Text(
                        "Entrar",
                        // Define o texto a ser exibido dentro do botão como "Entrar".
                        // O style aplica um estilo ao texto dentro do botão.
                        style: TextStyle(
                          color: Colors.black,
                          // Define a cor do texto com uma cor já definida no Material Design, nesse caso, preto.
                          fontSize:
                              20, // Define o tamanho da fonte do texto dentro do botão como 20 pixels.
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
