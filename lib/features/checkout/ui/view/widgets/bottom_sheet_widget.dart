import 'dart:developer';

import 'package:checkout_app/core/utils/app_assets.dart';
import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/core/widgets/custom_bottom.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/payment_method_list_view.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  int _selectedIndex = 0;
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
              AppAssets.pay,
            ],
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          const SizedBox(height: 30),
          CustomBottom(
            text: 'Countinue',
            onTap: () {
              _callPaymentMethod();
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  void _callPaymentMethod() {
    switch (_selectedIndex) {
      case 0:
        log('card 0');
        break;
      case 1:
        log('card 1');
        break;
      case 2:
        log('card 2');
        break;
    }
  }
}
