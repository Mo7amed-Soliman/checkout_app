class InitPaymentSheetModel {
  final String paymentIntentClientSecret;
  final String? customerId;
  final String? customerEphemeralKeySecret;
  InitPaymentSheetModel({
    required this.paymentIntentClientSecret,
    this.customerId,
    this.customerEphemeralKeySecret,
  });
}
