import 'package:checkout_app/core/utils/size_confige.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/custom_check_icon.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/custom_dashed_line.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: getRelativeHeight(0.2),
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: getRelativeHeight(0.2),
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: 20 + 8,
            left: 20 + 8,
            bottom: getRelativeHeight(0.2) + 20,
            child: const CustorrDashedLine(),
          ),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
