import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/features/checkout/ui/view/my_cart_view.dart';
import 'package:flutter/material.dart';

class CustomSkipView extends StatelessWidget {
  const CustomSkipView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyCartView(),
          ),
        ),
        child: Text(
          'Skip',
          style: AppStyles.latoMedium25.copyWith(
            color: Colors.grey.shade600,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
