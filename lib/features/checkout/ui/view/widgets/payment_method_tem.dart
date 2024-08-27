import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {super.key, required this.isActive, required this.assetName});
  final bool isActive;
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5,
            color: isActive ? const Color(0xff34A853) : const Color(0xff808080),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: isActive
            ? const [
                BoxShadow(
                  color: Color(0xff34A853),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ]
            : null,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffffffff),
        ),
        child: SvgPicture.asset(
          assetName,
        ),
      ),
    );
  }
}
