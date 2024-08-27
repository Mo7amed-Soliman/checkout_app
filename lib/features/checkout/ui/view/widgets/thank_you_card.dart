import 'package:checkout_app/core/utils/app_string.dart';
import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/core/utils/size_confige.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/custom_barcode_and_paid.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/custom_credit_cart.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/payment_info_item.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/total_price.dart';
import 'package:flutter/material.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 + 16,
          right: 20,
          left: 20,
        ),
        child: Column(
          children: [
            Text(
              AppString.thankYou,
              textAlign: TextAlign.center,
              style: AppStyles.interMedium25,
            ),
            Text(
              AppString.yourTransactionWasSuccessful,
              textAlign: TextAlign.center,
              style: AppStyles.interRegular20,
            ),
            const SizedBox(height: 42),
            const PaymentInfoItem(
              title: AppString.date,
              value: '01/24/2023',
            ),
            const SizedBox(height: 20),
            const PaymentInfoItem(
              title: AppString.time,
              value: '10:15 AM',
            ),
            const SizedBox(height: 20),
            const PaymentInfoItem(
              title: AppString.to,
              value: 'Sam Louis',
            ),
            const Divider(
              thickness: 1.5,
              height: 60,
            ),
            const TotalPrice(title: AppString.total, value: r'$50.97'),
            SizedBox(height: getRelativeHeight(0.05)),
            const CustomCreditCart(),
            const Spacer(),
            const CustomBarCodeAndPAID(),
            SizedBox(
              height: (getRelativeHeight(0.2) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
