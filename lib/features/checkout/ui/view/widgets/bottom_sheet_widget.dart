import 'dart:developer';

import 'package:checkout_app/core/cache/cache_helper.dart';
import 'package:checkout_app/core/di/dependency_injection.dart';
import 'package:checkout_app/core/utils/app_assets.dart';
import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/core/widgets/custom_bottom.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_transactions_model/amount.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_transactions_model/details.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_transactions_model/item.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_transactions_model/item_list.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_transactions_model/paypal_transactions_model.dart';
import 'package:checkout_app/features/checkout/ui/manger/stripe_paymant_cubit/stripe_payment_cubit.dart';
import 'package:checkout_app/features/checkout/ui/manger/stripe_paymant_cubit/stripe_payment_state.dart';
import 'package:checkout_app/features/checkout/ui/view/thank_you_view.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/payment_method_list_view.dart';
import 'package:checkout_app/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  int _selectedIndex = 0;
  late String customerId;
  @override
  void initState() {
    getCustomerId();
    super.initState();
  }

  // get customer id uesed for payment stripe
  void getCustomerId() async {
    customerId = await getIt<CacheHelper>().getData(key: 'customerId');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          PaymentMethodListView(
            paymentList: const [
              AppAssets.card,
              AppAssets.paypal,
            ],
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          const SizedBox(height: 30),
          BlocConsumer<StripePaymentCubit, StripePaymentState>(
            listener: (context, state) {
              if (state is StripePaymentSuccess) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ThankYouView();
                    },
                  ),
                );
              }
              if (state is StripePaymentError) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(state),
                );
              }
            },
            builder: (context, state) {
              return CustomBottom(
                text: 'Countinue',
                isLoading: state is StripePaymentLoading,
                onTap: () async {
                  await _callPaymentMethod();
                },
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  SnackBar customSnackBar(StripePaymentError state) {
    return SnackBar(
      backgroundColor: const Color(0xff100B20),
      padding: const EdgeInsets.symmetric(vertical: 25),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.radius),
      ),
      content: Center(
        child: Text(
          state.error,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<void> _callPaymentMethod() async {
    switch (_selectedIndex) {
      case 0:
        await StripePaymentCubit.get(context).makePayment(
          paymentIntentInputModel: PaymentIntentInputModel(
            amount: '100',
            currency: 'USD',
            customerId: customerId,
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId: Keys.paypalClientId,
            secretKey: Keys.paypalSecret,
            transactions: [
              getTeansactions().toJson(),
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              log("onSuccess: $params");
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThankYouView(),
                ),
              );
            },
            onError: (error) {
              log("onError: $error");
              Navigator.pop(context);
            },
            onCancel: () {
              log('cancelled:');
              Navigator.pop(context);
            },
          ),
        ));
        break;
    }
  }

  //! tast data for paypal
  PaypalTransactionsModel getTeansactions() {
    return PaypalTransactionsModel(
      amount: AmountModel(
        total: '100',
        currency: 'USD',
        details: Details(
          subtotal: '100',
          shipping: '0',
          shippingDiscount: 0,
        ),
      ),
      description: 'The payment transaction description.',
      itemList: OrderItemList(
        orders: [
          ItemModel(
            name: 'Apple',
            quantity: 4,
            price: '10',
            currency: 'USD',
          ),
          ItemModel(
            name: 'Pineapple',
            quantity: 5,
            price: '12',
            currency: 'USD',
          ),
        ],
      ),
    );
  }
}
