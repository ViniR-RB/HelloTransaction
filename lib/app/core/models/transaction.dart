enum OPERATIONENUM {
  compra,
  venda,
}

class Transaction {
  final String id;
  final int quantity;
  final double brokerage;
  final double price;
  final double taxB3;
  final String operation;
  final String? createdAt;
  final String? updatedAt;

  Transaction(
      {required this.id,
      required this.quantity,
      required this.brokerage,
      required this.price,
      required this.taxB3,
      required this.operation,
      this.createdAt,
      this.updatedAt});



}
