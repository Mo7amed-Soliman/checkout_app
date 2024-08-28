import 'package:checkout_app/core/networking/die_faliure.dart';
import 'package:checkout_app/core/utils/stripe_service.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  StripeService stripeService;
  CheckoutRepoImpl(this.stripeService);
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
