import 'package:checkout_app/core/cache/cache_helper.dart';
import 'package:checkout_app/core/di/dependency_injection.dart';
import 'package:checkout_app/core/utils/size_confige.dart';
import 'package:checkout_app/features/create_customer/ui/views/create_customer_view.dart';
import 'package:checkout_app/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //! set up Stripe
  Stripe.publishableKey = Keys.stripePublishableKey;

  //! set up Get It
  setupGetIt();

  //! Here The Initialize of cache => sharedPreferences
  await getIt<CacheHelper>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) {
          SizeConfig.initSize(context);
          return const CreateCustomerView();
        },
      ),
    );
  }
}