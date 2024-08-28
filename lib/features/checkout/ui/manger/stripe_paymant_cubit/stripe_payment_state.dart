abstract class StripePaymentState {}

class StripePaymentInitial extends StripePaymentState {}

class StripePaymentLoading extends StripePaymentState {}

class StripePaymentSuccess extends StripePaymentState {}

class StripePaymentError extends StripePaymentState {
  final String error;

  StripePaymentError(this.error);
}
