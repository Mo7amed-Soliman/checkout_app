import 'package:checkout_app/core/utils/app_assets.dart';
import 'package:checkout_app/core/utils/app_string.dart';
import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBarCodeAndPAID extends StatelessWidget {
  const CustomBarCodeAndPAID({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          AppAssets.barcode,
          height: 65,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 29,
            vertical: 14,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1.5,
                color: Color(0xff34A853),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            AppString.paid,
            style: AppStyles.interSemiBold24.copyWith(
              color: const Color(0xff34A853),
            ),
          ),
        ),
      ],
    );
  }
}
