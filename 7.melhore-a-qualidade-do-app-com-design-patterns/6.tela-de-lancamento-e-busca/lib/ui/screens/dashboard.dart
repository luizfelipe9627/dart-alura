import 'package:cinetopia/ui/screens/releases.dart';
import 'package:cinetopia/ui/screens/search_movies.dart';
import 'package:flutter/material.dart';

// Criada uma classe chamada Dashboard que estende StatefulWidget, que é um widget com estado ou seja, pode ter dados que mudam ao longo do tempo e precisam ser atualizados na interface do usuário.
class Dashboard extends StatefulWidget {
  // Construtor da classe Dashboard, que é um widget sem estado.
  const Dashboard({super.key});

  @override
  // O método createState cria uma instância do estado associado a este widget.
  State<Dashboard> createState() => _DashboardState();
}

// Criada uma classe chamada _DashboardState que estende State<Dashboard>, que é o estado associado ao widget Dashboard.
class _DashboardState extends State<Dashboard> {
  // Variável para armazenar o índice do item selecionado na barra de navegação inferior.
  int _currentIndex = 0;

  // Lista de telas que serão exibidas na barra de navegação inferior.
  final List<Widget> _screens = <Widget>[
    // A primeira tela é a busca de filmes.
    SearchMovies(),
    // A segunda tela é a lista de lançamentos.
    Releases(),
  ];

  // Método que é chamado quando um item da barra de navegação inferior é selecionado.
  void updateIndex(int index) {
    // Atualiza o estado do widget com o novo índice selecionado.
    setState(() {
      // Define o índice atual como o índice do item selecionado.
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // O widget Scaffold é o layout básico do Material Design que fornece uma estrutura visual para a tela.
    return Scaffold(
      // Define o fundo da tela como uma cor sólida.
      backgroundColor: Color(0xFF120326),
      // O body recebe a tela atual com base no índice selecionado na barra de navegação inferior.
      // O Padding é usado para adicionar espaçamento ao redor do conteúdo da tela.
      body: Padding(
        // Cria um espaçamento de 16 pixels à esquerda, 54 pixels na parte superior, 16 pixels à direita e 0 pixels na parte inferior.
        padding: const EdgeInsets.fromLTRB(16, 54, 16, 0),
        // O child é o widget que será exibido dentro do Padding no caso, a tela atual selecionada na barra de navegação inferior.
        child: _screens.elementAt(_currentIndex),
      ),
      // o bottomNavigationBar é uma barra de navegação na parte inferior da tela que permite ao usuário navegar entre diferentes seções do aplicativo.
      bottomNavigationBar: BottomNavigationBar(
        // O currentIndex é o índice do item atualmente selecionado na barra de navegação inferior.
        currentIndex: _currentIndex,
        // onTap é um callback que é chamado quando um item da barra de navegação inferior é selecionado.
        onTap: (value) => updateIndex(value),
        // O items define os itens que serão exibidos na barra de navegação inferior.
        items: <BottomNavigationBarItem>[
          // Cada BottomNavigationBarItem representa um item na barra de navegação inferior.
          BottomNavigationBarItem(
            // Define o ícone do item de navegação inferior.
            icon: Icon(Icons.movie),
            // Define o texto do item de navegação inferior.
            label: 'Filmes',
          ),
          BottomNavigationBarItem(
            // Define o ícone do item de navegação inferior.
            icon: Icon(Icons.today),
            // Define o texto do item de navegação inferior.
            label: 'Lançamentos',
          ),
        ],
      ),
    );
  }
}
