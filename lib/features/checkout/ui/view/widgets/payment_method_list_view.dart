import 'package:checkout_app/features/checkout/ui/view/widgets/payment_method_tem.dart';
import 'package:flutter/material.dart';

class PaymentMethodListView extends StatelessWidget {
  const PaymentMethodListView({
    super.key,
    required this.paymentList,
    required this.onTap,
    required this.selectedIndex,
  });
  final List<String> paymentList;
  final Function(int) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: PaymentMethodItem(
              isActive: selectedIndex == index,
              assetName: paymentList[index],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
        itemCount: paymentList.length,
      ),
    );
  }
}
