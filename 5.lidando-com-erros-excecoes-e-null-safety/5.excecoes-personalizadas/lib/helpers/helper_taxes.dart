import 'package:meu_app/models/account.dart';

// Criado uma função chamada calculateTaxesByAccount que recebe um objeto Account e um valor double chamado amount, responsável por calcular os impostos de acordo com o tipo de conta, são obrigatórios os parâmetros sender e amount.
  double calculateTaxesByAccount({required Account sender, required double amount}) {

  // Se o valor for menor que 5000, o valor é zerado
  if (amount < 5000) amount = 0;

  // Verifica o tipo de conta e aplica a taxa de imposto correspondente
  switch (sender.accountType) {
    // Caso seja uma conta do tipo "Ambrosia", a taxa é de 5% se o valor for maior que 5000
    case "Ambrosia":
      amount = amount * 0.005; // Pega o valor e multiplica por 5%
      break;
    // Caso seja uma conta do tipo "Canjica", a taxa é de 33% se o valor for maior que 5000
    case "Canjica":
      amount = amount * 0.0033; // Pega o valor e multiplica por 33%
      break;
    // Caso seja uma conta do tipo "Pudim", a taxa é de 25% se o valor for maior que 5000
    case "Pudim":
      amount = amount * 0.0025; // Pega o valor e multiplica por 25%
      break;
    // Caso seja uma conta do tipo "Bolo de Rolo", a taxa é de 10% se o valor for maior que 5000
    case "Brigadeiro":
      amount = amount * 0.0001; // Pega o valor e multiplica por 10%
      break;
    // Caso não seja nenhum dos tipos acima, lança uma exceção
    default:
      amount = 0.1; // Se não for nenhum dos tipos, o valor é passado como 10%
  }

  return amount; // Retorna o valor calculado dos impostos
}