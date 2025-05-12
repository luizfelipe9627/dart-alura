// Cria uma classe abstrata chamada Pontuacao que não pode ser instanciada diretamente, ou seja, é uma classe que serve como base para outras classes
abstract class Pontuacao {
  // Cria um método chamado calculaPontos e devolveColocacao que não tem nenhuma funcionalidade definida
  void calculaPontos();
  void devolveColocacao();
}

// Cria uma classe Volei que implementa a interface Pontuacao ou seja, obriga a classe a implementar os métodos da interface e extende a classe Esporte herdando os atributos e métodos da classe Esporte
class Volei extends Esporte implements Pontuacao {
  // Construtor da classe Volei que recebe o nome do time como parâmetro
  Volei(super.time); // O super é usado para chamar o construtor da classe pai (Esporte) e passar os parâmetros para ele

  // Override é usado para sobrescrever o método calculaPontos da interface Pontuacao
  @override
  void calculaPontos() {
    // TODO: implement calculaPontos
  }

  // Override é usado para sobrescrever o método devolveColocacao da interface Pontuacao
  @override
  void devolveColocacao() {
    // TODO: implement devolveColocacao
  }
}

// Cria uma classe Futebol do tipo abstrata ou seja, não pode ser instanciada diretamente
abstract class Esporte {
  // Cria um atributo chamado time do tipo String que armazena o nome do time
  String time;

  // Construtor da classe Esporte que recebe o nome do time como parâmetro
  Esporte(this.time);
}