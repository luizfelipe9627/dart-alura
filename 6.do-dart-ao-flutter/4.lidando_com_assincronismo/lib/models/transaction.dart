import 'dart:convert';

class Transaction {
  final String id; // Criado um atributo chamado id do tipo String que armazena o identificador da transação.
  final String senderAccountId; // Criado um atributo chamado senderAccountId do tipo String que armazena o identificador da conta remetente.
  final String receiverAccountId; // Criado um atributo chamado receiverAccountId do tipo String que armazena o identificador da conta destinatária.
  final DateTime date; // Criado um atributo chamado date do tipo DateTime que armazena a data da transação.
  final double amount; // Criado um atributo chamado amount do tipo double que armazena o valor da transação.
  final double taxes; // Criado um atributo chamado taxes do tipo String que armazena as taxas associadas à transação.

  // Construtor da classe Transaction que recebe os parâmetros id, senderAccountId, receiverAccountId, date, amount e taxes.
  Transaction({
    required this.id,
    required this.senderAccountId,
    required this.receiverAccountId,
    required this.date,
    required this.amount,
    required this.taxes,
  });

  // Constrói um objeto Transaction a partir de um JSON (ex: vindo do Firebase ou banco de dados).
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'senderAccountId': senderAccountId,
      'receiverAccountId': receiverAccountId,
      'date': date.millisecondsSinceEpoch,
      'amount': amount,
      'taxes': taxes,
    };
  }

  // Construtor que cria uma cópia do objeto Transaction com novos valores para os atributos.
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      senderAccountId: map['senderAccountId'],
      receiverAccountId: map['receiverAccountId'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      amount: map['amount'],
      taxes: map['taxes'],
    );
  }

  // Constrói um objeto Transaction a partir de um JSON (ex: vindo do Firebase ou banco de dados)
  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  // Converte o objeto Transaction em um JSON (útil para salvar no banco, por exemplo).
  String toJson() => json.encode(toMap());

  // Constrói um objeto Transaction a partir de outro objeto Transaction (útil para copiar o objeto).
  Transaction copyWith({
    String? id,
    String? senderAccountId,
    String? receiverAccountId,
    DateTime? date,
    double? amount,
    double? taxes,
  }) {
    return Transaction(
      id: id ?? this.id,
      senderAccountId: senderAccountId ?? this.senderAccountId,
      receiverAccountId: receiverAccountId ?? this.receiverAccountId,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      taxes: taxes ?? this.taxes,
    );
  }

  // Sobrescreve o operador == para comparar dois objetos Transaction
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.id == id &&
        other.senderAccountId == senderAccountId &&
        other.receiverAccountId == receiverAccountId &&
        other.date == date &&
        other.amount == amount &&
        other.taxes == taxes;
  }

  // Sobrescreve o método hashCode para gerar um código hash único para cada objeto Account
  @override
  int get hashCode {
    return id.hashCode ^
        senderAccountId.hashCode ^
        receiverAccountId.hashCode ^
        date.hashCode ^
        amount.hashCode ^
        taxes.hashCode;
  }
}