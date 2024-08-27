import 'package:checkout_app/core/utils/app_string.dart';
import 'package:checkout_app/core/widgets/custom_app_bar.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: AppString.myCart),
      body: const MyCartViewBody(),
    );
  }
}
