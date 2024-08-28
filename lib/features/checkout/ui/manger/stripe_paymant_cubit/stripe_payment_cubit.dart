import 'dart:developer';

import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo.dart';
import 'package:checkout_app/features/checkout/ui/manger/stripe_paymant_cubit/stripe_payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());
  static StripePaymentCubit get(context) => BlocProvider.of(context);
  final CheckoutRepo checkoutRepo;

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(StripePaymentLoading());
    final result = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    result.fold(
      (failure) => emit(StripePaymentError(failure.errmessage)),
      (success) => emit(StripePaymentSuccess()),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log('change ${change.currentState} to ${change.nextState}');
    super.onChange(change);
  }
}
