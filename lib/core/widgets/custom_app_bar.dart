import 'package:checkout_app/core/utils/app_assets.dart';
import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: AppStyles.latoMedium25,
    ),
    leading: InkWell(
      onTap: () {},
      child: Center(
        child: SvgPicture.asset(
          AppAssets.backArrow,
        ),
      ),
    ),
  );
}
