import 'package:checkout_app/core/utils/size_confige.dart';
import 'package:checkout_app/features/checkout/ui/view/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
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
          return const MyCartView();
        },
      ),
    );
  }
}
