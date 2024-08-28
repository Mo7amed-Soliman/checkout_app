class PaymentIntentInputModel {
  final String amount;
  final String currency;
  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': (int.parse(amount) * 100),
      'currency': currency,
    };
  }
}
