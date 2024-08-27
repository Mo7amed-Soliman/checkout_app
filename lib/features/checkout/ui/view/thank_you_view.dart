import 'package:checkout_app/features/checkout/ui/view/widgets/custom_app_bar_think_you_view.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/thank_you_view_body.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarThinkYouView(),
      body: ThankYouViewBody(),
    );
  }
}
