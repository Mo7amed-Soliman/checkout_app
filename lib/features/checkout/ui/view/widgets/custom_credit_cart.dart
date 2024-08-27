import 'package:checkout_app/core/utils/app_assets.dart';
import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCreditCart extends StatelessWidget {
  const CustomCreditCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 73,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(width: 23),
          SvgPicture.asset(AppAssets.logoCard),
          const SizedBox(width: 22),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credit Card',
                style: AppStyles.interSemiBold18,
              ),
              Text(
                'Mastercard **78',
                style: AppStyles.interRegular18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
