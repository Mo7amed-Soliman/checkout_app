import 'package:checkout_app/features/create_customer/data/models/custmer_model/customer_model.dart';
import 'package:checkout_app/features/create_customer/data/models/customer_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/init_payment_sheet_model.dart';
import 'package:checkout_app/core/networking/api_service.dart';
import 'package:checkout_app/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
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

  Future<void> initPaymentSheet({
    required InitPaymentSheetModel initPaymentSheetModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        //? Main params
        paymentIntentClientSecret:
            initPaymentSheetModel.paymentIntentClientSecret,

        merchantDisplayName: 'Mohamed Soliman',

        //? Customer params
        customerId: initPaymentSheetModel.customerId,
        customerEphemeralKeySecret:
            initPaymentSheetModel.customerEphemeralKeySecret,
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

    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var initPaymentSheetModel = InitPaymentSheetModel(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      customerEphemeralKeySecret: ephemeralKeyModel.secret,
    );
    await initPaymentSheet(
      initPaymentSheetModel: initPaymentSheetModel,
    );

    await displayPaymentSheet();
  }

  Future<CustomerModel> createCustomer(
      {required CustomerInputModel customerInputModel}) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/customers',
      body: customerInputModel.toJson(),
      token: Keys.stripeSecretKey,
      contentType: Headers.formUrlEncodedContentType,
    );

    return CustomerModel.fromJson(response.data);
  }

  //! create ephemeral key
  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {
        'customer': customerId,
      },
      token: Keys.stripeSecretKey,
      headers: {
        'Authorization': 'Bearer ${Keys.stripeSecretKey}',
        'Stripe-Version': '2024-06-20',
      },
      contentType: Headers.formUrlEncodedContentType,
    );

    return EphemeralKeyModel.fromJson(response.data);
  }
}
