import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: AppStyles.interSemiBold24,
      ),
      Text(
        value,
        style: AppStyles.interSemiBold24,
      ),
    ]);
  }
}
