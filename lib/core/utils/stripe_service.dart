import 'package:checkout_app/core/models/customer_input_model.dart';
import 'package:checkout_app/core/networking/api_service.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_app/keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  ApiService apiService;
  StripeService(this.apiService);

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: Keys.stripeSecretKey,
      contentType: Headers.formUrlEncodedContentType,
    );

    return PaymentIntentModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        //? Main params
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Mohamed Soliman',
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );

    await displayPaymentSheet();
  }

  Future<Response> createCustomer(
      {required CustomerInputModel customerInputModel}) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/customers',
      body: customerInputModel.toJson(),
      token: Keys.stripeSecretKey,
      contentType: Headers.formUrlEncodedContentType,
    );

    return response;
  }
}
