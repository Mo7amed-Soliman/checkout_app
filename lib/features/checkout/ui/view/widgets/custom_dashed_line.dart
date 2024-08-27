import 'package:flutter/material.dart';

class CustorrDashedLine extends StatelessWidget {
  const CustorrDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        18,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              height: 1,
              color: const Color(0xffB8B8B8),
            ),
          ),
        ),
      ),
    );
  }
}
