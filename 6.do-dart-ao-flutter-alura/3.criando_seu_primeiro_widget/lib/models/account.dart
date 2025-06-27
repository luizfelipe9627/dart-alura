import 'dart:convert';

class Account {
  String id; // Criado uma variável chamada id que armazena o id da conta
  String name; // Criado uma variável chamada name que armazena o nome da conta
  String lastName; // Criado uma variável chamada lastName que armazena o sobrenome da conta
  double balance; // Criado uma variável chamada balance que armazena o saldo da conta
  // O "?" indica que a variável pode ser nula, ou seja, não é obrigatório ter um valor definido
  String? accountType; // Criado uma variável chamada accountType que armazena o tipo da conta

  // Construtor da classe Account que recebe os parâmetros id, name, lastName e balance
  Account({
    required this.id,
    required this.name,
    required this.lastName,
    required this.balance,
    required this.accountType,
  });

  // Converte o objeto Account em um mapa (útil para salvar no banco, por exemplo)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'balance': balance,
      'accountType': accountType,
    };
  }

  // Constrói um objeto Account a partir de um mapa (ex: vindo do Firebase ou banco de dados)
  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      name: map['name'],
      lastName: map['lastName'],
      balance: map['balance'],
      // Se accountType for null, atribui null, caso contrário, atribui o valor do tipo da conta
      accountType: (map['accountType'] != null) ? map['accountType'] : null,
    );
  }

  // Constrói um objeto Account a partir de um JSON (ex: vindo do Firebase ou banco de dados)
  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  // Converte o objeto Account em um JSON (útil para salvar no banco, por exemplo)
  String toJson() => json.encode(toMap());

  // Constrói um objeto Account a partir de outro objeto Account (útil para copiar o objeto)
  Account copyWith({
    String? id,
    String? name,
    String? lastName,
    double? balance,
    String? accountType,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      balance: balance ?? this.balance,
      accountType: accountType ?? this.accountType,
    );
  }

  // Sobrescreve o método toString para exibir as informações da conta de forma legível
  @override
  String toString() {
    return '\nConta $id\n$name $lastName\nSaldo: $balance\n';
  }

  // Sobrescreve o operador == para comparar dois objetos Account
  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.lastName == lastName &&
        other.balance == balance;
  }

  // Sobrescreve o método hashCode para gerar um código hash único para cada objeto Account
  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ lastName.hashCode ^ balance.hashCode;
  }
}