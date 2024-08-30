class PaymentOptions {
  String? allowedPaymentMethod;

  PaymentOptions({this.allowedPaymentMethod});

  factory PaymentOptions.fromJson(Map<String, dynamic> json) {
    return PaymentOptions(
      allowedPaymentMethod: json['allowed_payment_method'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'allowed_payment_method': allowedPaymentMethod,
      };
}
