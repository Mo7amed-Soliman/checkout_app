import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PaymentInfoItem extends StatelessWidget {
  const PaymentInfoItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.interRegular18,
        ),
        Text(
          value,
          style: AppStyles.interSemiBold18,
        ),
      ],
    );
  }
}
